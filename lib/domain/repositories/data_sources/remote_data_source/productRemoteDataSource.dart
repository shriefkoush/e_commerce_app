import 'package:dartz/dartz.dart';

import '../../../../core/errors/failures.dart';
import '../../../entities/Product_response_entity.dart';

abstract class ProductRemoteDataSource {
  Future<Either<Failures,ProductResponseEntity>> getAllProducts();

}