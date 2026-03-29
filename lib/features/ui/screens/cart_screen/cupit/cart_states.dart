import 'package:e_commerce_app2/core/errors/failures.dart';
import 'package:e_commerce_app2/domain/entities/Cart_response_entity.dart';

abstract class CartStates{}
class CartLoadingState extends CartStates{}
class CartErrorState extends CartStates{
  Failures failures;
  CartErrorState({required this.failures});
}
class CartSuccessState extends CartStates{
  CartResponseEntity cartResponseEntity;
  CartSuccessState({required this.cartResponseEntity});
}