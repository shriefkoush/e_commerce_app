import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:dartz/dartz.dart';
import 'package:e_commerce_app2/core/api/api_manager.dart';
import 'package:e_commerce_app2/core/cached/shared_preference_utils.dart';
import 'package:e_commerce_app2/core/errors/failures.dart';
import 'package:e_commerce_app2/data/models/AddToCartResponseDm.dart';
import 'package:e_commerce_app2/domain/entities/Add_to_cart_response_entity.dart';
import 'package:e_commerce_app2/domain/repositories/data_sources/remote_data_source/homeRemoteDataSource.dart';
import 'package:injectable/injectable.dart';
import '../../../core/api/endPoints.dart';
import '../../models/Brand_Response_Dm.dart';
import '../../models/Category_Response_Dm.dart';

@LazySingleton(as: HomeRemoteDataSource)
class HomeRemoteDataSourceImpl implements HomeRemoteDataSource {
  ApiManager apiManager;
  HomeRemoteDataSourceImpl({required this.apiManager});
  @override
  Future<Either<Failures, CategoryResponseDm>> getAllCategories() async {
    try {
      final connectionResult = await Connectivity().checkConnectivity();
      if (connectionResult.contains(ConnectivityResult.wifi) ||
          connectionResult.contains(ConnectivityResult.mobile)) {
        //todo: internet
        var response = await apiManager.getData(
          endPoint: EndPoints.getAllCategories,
        );
        var categoryResponse = CategoryResponseDm.fromJson(response.data);
        if (response.statusCode! >= 200 && response.statusCode! < 300) {
          return Right(categoryResponse);
        } else {
          return Left(ServerError(errorMsg: categoryResponse.message!));
        }
      } else {
        return Left(NetworkError(errorMsg: "no internet,Please try again"));
      }
    } catch (e) {
      return Left(ServerError(errorMsg: e.toString()));
    }
  }

  @override
  Future<Either<Failures, BrandResponseDm>> getAllBrands()async {
    try {
      final connectionResult = await Connectivity().checkConnectivity();
      if (connectionResult.contains(ConnectivityResult.wifi) ||
          connectionResult.contains(ConnectivityResult.mobile)) {
        //todo: internet
        var response = await apiManager.getData(
          endPoint: EndPoints.getAllBrands,
        );
        var brandResponse = BrandResponseDm.fromJson(response.data);
        if (response.statusCode! >= 200 && response.statusCode! < 300) {
          return Right(brandResponse);
        } else {
          return Left(ServerError(errorMsg: brandResponse.message!));
        }
      } else {
        return Left(NetworkError(errorMsg: "no internet,Please try again"));
      }
    } catch (e) {
      return Left(ServerError(errorMsg: e.toString()));
    }
  }

  @override
  Future<Either<Failures, AddToCartResponseEntity>> addToCart(String productID)
  async{
    try {
      final connectionResult = await Connectivity().checkConnectivity();
      if (connectionResult.contains(ConnectivityResult.wifi) ||
          connectionResult.contains(ConnectivityResult.mobile)) {
        //todo: internet
        var token = SharedPreferenceUtils.getData(key: "token");
        var response = await apiManager.postData(
          endPoint: EndPoints.addToCart,
          headers: {
            "token" : token
          } ,
          body: {
            "productId" : productID
          }
        );
        var addToCartResponse = AddToCartResponseDm.fromJson(response.data);
        if (response.statusCode! >= 200 && response.statusCode! < 300) {
          return Right(addToCartResponse);
        } else {
          return Left(ServerError(errorMsg: addToCartResponse.message!));
        }
      } else {
        return Left(NetworkError(errorMsg: "no internet,Please try again"));
      }
    } catch (e) {
      return Left(ServerError(errorMsg: e.toString()));
    }
  }
  }
