import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:dartz/dartz.dart';
import 'package:e_commerce_app2/core/api/api_manager.dart';
import 'package:e_commerce_app2/core/errors/failures.dart';
import 'package:e_commerce_app2/domain/repositories/data_sources/remote_data_source/productRemoteDataSource.dart';
import 'package:injectable/injectable.dart';

import '../../../core/api/endPoints.dart';
import '../../models/Product_response_dm.dart';
@Injectable(as: ProductRemoteDataSource)
class ProductRemoteDataSourceImpl implements ProductRemoteDataSource{
  ApiManager apiManager;
  ProductRemoteDataSourceImpl({required this.apiManager});
  @override
  Future<Either<Failures, ProductResponseDm>> getAllProducts() async{
    try {
      final connectionResult = await Connectivity().checkConnectivity();
      if (connectionResult.contains(ConnectivityResult.wifi) ||
          connectionResult.contains(ConnectivityResult.mobile)) {
        //todo: internet
        var response = await apiManager.getData(
          endPoint: EndPoints.getAllProducts,
        );
        var productResponse = ProductResponseDm.fromJson(response.data);
        if (response.statusCode! >= 200 && response.statusCode! < 300) {
          return Right(productResponse);
        } else {
          return Left(ServerError(errorMsg: productResponse.message!));
        }
      } else {
        return Left(NetworkError(errorMsg: "no internet,Please try again"));
      }
    } catch (e) {
      return Left(ServerError(errorMsg: e.toString()));
    }
  }

}