import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:dartz/dartz.dart';
import 'package:e_commerce_app2/core/api/api_manager.dart';
import 'package:e_commerce_app2/core/errors/failures.dart';
import 'package:e_commerce_app2/data/models/Cart_response_Dm.dart';
import 'package:e_commerce_app2/domain/repositories/data_sources/remote_data_source/cartRemoteDataSource.dart';
import 'package:injectable/injectable.dart';
import '../../../core/api/endPoints.dart';
import '../../../core/cached/shared_preference_utils.dart';
@Injectable(as: CartRemoteDataSource)
class CartRemoteDataSourceImpl implements CartRemoteDataSource{
  ApiManager apiManager;
  CartRemoteDataSourceImpl({required this.apiManager});
  @override
  Future<Either<Failures, CartResponseDm>> getCartItems() async{
    try {
      final connectionResult = await Connectivity().checkConnectivity();
      if (connectionResult.contains(ConnectivityResult.wifi) ||
          connectionResult.contains(ConnectivityResult.mobile)) {
        //todo: internet
        var token = SharedPreferenceUtils.getData(key: "token");
        var response = await apiManager.getData(
          endPoint: EndPoints.addToCart,
          headers: {
            "token" : token
          }
        );
        var cartResponse = CartResponseDm.fromJson(response.data);
        if (response.statusCode! >= 200 && response.statusCode! < 300) {
          return Right(cartResponse);
        } else {
          return Left(ServerError(errorMsg: cartResponse.message!));
        }
      } else {
        return Left(NetworkError(errorMsg: "no internet,Please try again"));
      }
    } catch (e) {
      return Left(ServerError(errorMsg: e.toString()));
    }
  }

}