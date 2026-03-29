import 'package:dartz/dartz.dart';
import 'package:e_commerce_app2/core/errors/failures.dart';
import 'package:e_commerce_app2/domain/entities/Cart_response_entity.dart';
import 'package:e_commerce_app2/domain/repositories/Cart_repository/Cart_repository.dart';
import 'package:injectable/injectable.dart';
@injectable
class GetCartItemsUseCase {
  CartRepository cartRepository ;
  GetCartItemsUseCase({required this.cartRepository});
  Future<Either<Failures,CartResponseEntity>> invoke(){
    return cartRepository.getCartItems();
  }

}