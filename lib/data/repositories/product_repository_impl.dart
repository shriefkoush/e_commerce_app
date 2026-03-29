import 'package:dartz/dartz.dart';
import 'package:e_commerce_app2/core/errors/failures.dart';
import 'package:e_commerce_app2/domain/entities/Product_response_entity.dart';
import 'package:e_commerce_app2/domain/repositories/data_sources/remote_data_source/productRemoteDataSource.dart';
import 'package:e_commerce_app2/domain/repositories/product_repository/Product_repository.dart';
import 'package:injectable/injectable.dart';
@Injectable(as: ProductRepository)
class ProductRepositoryImpl implements ProductRepository {
  ProductRemoteDataSource productRemoteDataSource;
  ProductRepositoryImpl({required this.productRemoteDataSource});
  @override
  Future<Either<Failures, ProductResponseEntity>> getAllProducts() async {
    var either = await productRemoteDataSource.getAllProducts();
    return either.fold((error) => Left(error), (response) => Right(response));
  }
}
