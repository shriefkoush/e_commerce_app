import 'package:dartz/dartz.dart';
import 'package:e_commerce_app2/core/errors/failures.dart';
import 'package:e_commerce_app2/domain/entities/Product_response_entity.dart';

abstract class ProductRepository {
  Future<Either<Failures,ProductResponseEntity>> getAllProducts();
}