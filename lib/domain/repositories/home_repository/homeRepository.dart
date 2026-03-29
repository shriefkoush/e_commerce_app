import 'package:dartz/dartz.dart';
import 'package:e_commerce_app2/core/errors/failures.dart';
import 'package:e_commerce_app2/domain/entities/Add_to_cart_response_entity.dart';
import 'package:e_commerce_app2/domain/entities/Category_Response_Entity.dart';

import '../../entities/Brand_response_entity.dart';

abstract class HomeRepository{
  Future<Either<Failures,CategoryResponseEntity>> getAllCategories();
  Future<Either<Failures,BrandResponseEntity>> getAllBrands();
  Future<Either<Failures,AddToCartResponseEntity>> addToCart(String productID);
}
