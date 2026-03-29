import 'package:dartz/dartz.dart';
import 'package:e_commerce_app2/core/errors/failures.dart';
import 'package:e_commerce_app2/domain/entities/Add_to_cart_response_entity.dart';
import 'package:e_commerce_app2/domain/entities/Brand_response_entity.dart';
import 'package:e_commerce_app2/domain/entities/Category_Response_Entity.dart';
import 'package:e_commerce_app2/domain/repositories/data_sources/remote_data_source/homeRemoteDataSource.dart';
import 'package:e_commerce_app2/domain/repositories/home_repository/homeRepository.dart';
import 'package:injectable/injectable.dart';

@LazySingleton(as: HomeRepository)
class HomeRepositoryImpl implements HomeRepository {
  HomeRemoteDataSource remoteDataSource;
  HomeRepositoryImpl({required this.remoteDataSource});

  @override
  Future<Either<Failures, CategoryResponseEntity>> getAllCategories() async {
    var either = await remoteDataSource.getAllCategories();
    return either.fold((error) => Left(error), (response) => Right(response));
  }

  @override
  Future<Either<Failures, BrandResponseEntity>> getAllBrands() async{
  var either = await remoteDataSource.getAllBrands();
  return either.fold((error)=> Left(error), (response)=> Right(response));
  }

  @override
  Future<Either<Failures, AddToCartResponseEntity>> addToCart(String productID) async{
    var either = await remoteDataSource.addToCart(productID);
    return either.fold((error)=> Left(error), (response)=> Right(response));
  }
}
