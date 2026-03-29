import 'package:e_commerce_app2/domain/entities/Cart_response_entity.dart';
import 'package:e_commerce_app2/domain/use_cases/get_cart_items_use_case.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

import 'cart_states.dart';
@injectable
class CartViewModel extends Cubit<CartStates> {
  GetCartItemsUseCase getCartItemsUseCase;
  CartViewModel({required this.getCartItemsUseCase})
    : super(CartLoadingState());
  // todo: hold data / handle logic
  List<GetProductsEntity> productList = [];
  getItemsInCart() async {
    emit(CartLoadingState());
    var either = await getCartItemsUseCase.invoke();
    either.fold(
      (error) {
        emit(CartErrorState(failures: error));
      },
      (response) {
        productList = response.data!.products!;
        emit(CartSuccessState(cartResponseEntity: response));
      },
    );
  }
}
