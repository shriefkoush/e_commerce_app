import 'package:e_commerce_app2/domain/use_cases/Add_to_cart_use_case.dart';
import 'package:e_commerce_app2/domain/use_cases/get_all_products_use_case.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import '../../../../../../domain/entities/Product_response_entity.dart';
import 'Category_states.dart';

@injectable
class CategoryTapViewModel extends Cubit<ProductState> {
  GetAllProductsUseCase getAllProductsUseCase;
  AddToCartUseCase addToCartUseCase;
  CategoryTapViewModel({
    required this.getAllProductsUseCase,
    required this.addToCartUseCase,
  }) : super(ProductInitialState());
  //todo : hold Data , handle logic
  List<ProductEntity> productsList = [];
  int numOfProducts = 0;
  static CategoryTapViewModel get(context) =>
      BlocProvider.of<CategoryTapViewModel>(context);
  getAllProducts() async {
    emit(ProductLoadingState());
    var either = await getAllProductsUseCase.invoke();
    either.fold(
      (error) {
        emit(ProductErrorState(failures: error));
      },
      (response) {
        productsList = response.data!;
        emit(ProductSuccessState(productResponseEntity: response));
      },
    );
  }

  addToCart(String productId) async {
    emit(AddCartLoadingState());
    var either = await addToCartUseCase.invoke(productId);
    either.fold(
      (error) {
        emit(AddCartErrorState(failures: error));
      },
      (response) {
        numOfProducts = response.numOfCartItems!.toInt();
        print("numOfCartItems : ${numOfProducts}");
        emit(AddCartSuccessState(addToCartResponseEntity: response));
      },
    );
  }
}
