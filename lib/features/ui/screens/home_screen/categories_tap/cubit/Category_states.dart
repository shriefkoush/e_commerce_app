import 'package:e_commerce_app2/core/errors/failures.dart';
import 'package:e_commerce_app2/domain/entities/Add_to_cart_response_entity.dart';
import 'package:e_commerce_app2/domain/entities/Product_response_entity.dart';

class ProductState{}
class ProductInitialState extends ProductState {}
class ProductLoadingState extends ProductState {}
class ProductErrorState extends ProductState {
  Failures failures;
  ProductErrorState({required this.failures});
}
class ProductSuccessState extends ProductState {
  ProductResponseEntity productResponseEntity;
  ProductSuccessState({required this.productResponseEntity});
}
class AddCartLoadingState extends ProductState {}
class AddCartErrorState extends ProductState {
  Failures failures;
  AddCartErrorState({required this.failures});
}
class AddCartSuccessState extends ProductState {
  AddToCartResponseEntity addToCartResponseEntity;
  AddCartSuccessState({required this.addToCartResponseEntity});
}