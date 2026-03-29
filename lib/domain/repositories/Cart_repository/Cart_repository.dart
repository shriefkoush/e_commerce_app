import 'package:dartz/dartz.dart';
import 'package:e_commerce_app2/core/errors/failures.dart';
import 'package:e_commerce_app2/domain/entities/Cart_response_entity.dart';

abstract class CartRepository{
  Future<Either<Failures,CartResponseEntity>> getCartItems();
}