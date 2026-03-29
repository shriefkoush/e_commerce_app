import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:dartz/dartz.dart';
import 'package:e_commerce_app2/core/api/api_manager.dart';
import 'package:e_commerce_app2/core/api/endPoints.dart';
import 'package:e_commerce_app2/core/errors/failures.dart';
import 'package:e_commerce_app2/data/models/LoginResponseDm.dart';
import 'package:e_commerce_app2/data/models/RegisterResponseDm.dart';
import 'package:e_commerce_app2/domain/repositories/data_sources/remote_data_source/authRemoteDataSource.dart';
import 'package:injectable/injectable.dart';

@Injectable(as: AuthRemoteDataSource)
class AuthRemoteDataSourceImpl implements AuthRemoteDataSource {
  ApiManager apiManager;
  AuthRemoteDataSourceImpl({required this.apiManager});

  @override
  Future<Either<Failures, RegisterResponseDm>> register(
    String name,
    String email,
    String password,
    String rePassword,
    String phone,
  ) async {
    try {
      final connectionResult = await Connectivity().checkConnectivity();
      if (connectionResult.contains(ConnectivityResult.wifi) ||
          connectionResult.contains(ConnectivityResult.mobile)) {
        //todo: internet
        var response = await apiManager.postData(
          endPoint: EndPoints.signUp,
          body: {
            "name": name,
            "email": email,
            "password": password,
            "rePassword": rePassword,
            "phone": phone,
          },
        );
        var registerResponse = RegisterResponseDm.fromJson(response.data);
        if (response.statusCode! >= 200 && response.statusCode! < 300 ) {
          return Right(registerResponse);
        } else {
          return Left(ServerError(errorMsg: registerResponse.message!));
        }
      } else {
        return Left(NetworkError(errorMsg: "no internet,Please try again"));
      }
    } catch (e) {
      return Left(ServerError(errorMsg: e.toString()));
    }
  }

  @override
  Future<Either<Failures, LoginResponseDm>> login(
    String email,
    String password,
  ) async {
    try {
      final connectionResult = await Connectivity().checkConnectivity();
      if (connectionResult.contains(ConnectivityResult.wifi) ||
          connectionResult.contains(ConnectivityResult.mobile)) {
        //todo: internet
        var response = await apiManager.postData(
          endPoint: EndPoints.signIn,
          body: {"email": email, "password": password}
        );
        var loginResponse = LoginResponseDm.fromJson(response.data);
        if (response.statusCode! >= 200 && response.statusCode! < 300) {
          return Right(loginResponse);
        } else {
          return Left(ServerError(errorMsg: loginResponse.message??
              "login failed, please, try again"));
        }
      } else {
        return Left(NetworkError(errorMsg: "no internet,Please try again"));
      }
    } catch (e) {
      print("LOGIN EXCEPTION: $e");
      return Left(ServerError(errorMsg: e.toString()));
    }
  }
}
