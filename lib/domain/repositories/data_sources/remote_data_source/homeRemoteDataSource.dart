import 'package:dartz/dartz.dart';

import '../../../../core/errors/failures.dart';
import '../../../entities/Add_to_cart_response_entity.dart';
import '../../../entities/Brand_response_entity.dart';
import '../../../entities/Category_Response_Entity.dart';

abstract class HomeRemoteDataSource {
  Future<Either<Failures,CategoryResponseEntity>> getAllCategories();
  Future<Either<Failures,BrandResponseEntity>> getAllBrands();
  Future<Either<Failures,AddToCartResponseEntity>> addToCart(String productID);

}