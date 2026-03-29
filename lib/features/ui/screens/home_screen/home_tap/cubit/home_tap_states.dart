import 'package:e_commerce_app2/core/errors/failures.dart';
import 'package:e_commerce_app2/domain/entities/Category_Response_Entity.dart';

import '../../../../../../domain/entities/Brand_response_entity.dart';


class HomeTapStates {}

class CategoryLoadingState extends HomeTapStates {}
class HomeTapInitialState extends HomeTapStates {}
class CategoryErrorState extends HomeTapStates {
  Failures failures;
  CategoryErrorState({required this.failures});
}
class CategorySuccessState extends HomeTapStates {
  CategoryResponseEntity categoryResponseEntity;
  CategorySuccessState({required this.categoryResponseEntity});
}
class BrandLoadingState extends HomeTapStates {}
class BrandErrorState extends HomeTapStates {
  Failures failures;
  BrandErrorState({required this.failures});
}
class BrandSuccessState extends HomeTapStates {
  BrandResponseEntity brandResponseEntity;
  BrandSuccessState({required this.brandResponseEntity});
}