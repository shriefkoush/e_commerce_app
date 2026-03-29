import 'package:dartz/dartz.dart';

import '../../../../core/errors/failures.dart';
import '../../../entities/Cart_response_entity.dart';

abstract class CartRemoteDataSource{
  Future<Either<Failures,CartResponseEntity>> getCartItems();

}