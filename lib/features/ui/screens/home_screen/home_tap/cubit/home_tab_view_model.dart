import 'package:e_commerce_app2/core/utils/app_assets.dart';
import 'package:e_commerce_app2/domain/entities/Category_Response_Entity.dart';
import 'package:e_commerce_app2/domain/use_cases/getAllCategoriesUseCase.dart';
import 'package:e_commerce_app2/domain/use_cases/get_all_brands_use_case.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

import '../../../../../../domain/entities/Brand_response_entity.dart';
import 'home_tap_states.dart';

@injectable
class HomeTapViewModel extends Cubit<HomeTapStates> {
  GetAllBrandsUseCase getAllBrandsUseCase;
  GetAllCategoriesUseCase getAllCategoriesUseCase;
  HomeTapViewModel({
    required this.getAllCategoriesUseCase,
    required this.getAllBrandsUseCase,
  }) : super(HomeTapInitialState());
  //todo : hold data , handle logic
  List<CategoryEntity> categoryList = [];
  List<BrandEntity> brandsList = [];
  List<String> images = [
    AppAssets.adImage1,
    AppAssets.adImage2,
    AppAssets.adImage3,
  ];
  getAllCategories() async {
    emit(CategoryLoadingState());
    var either = await getAllCategoriesUseCase.invoke();
    either.fold(
      (error) {
        emit(CategoryErrorState(failures: error));
      },
      (response) {
        categoryList = response.data!;
        emit(CategorySuccessState(
           categoryResponseEntity : response));
      },
    );
  }

  getAllBrands() async {
    emit(BrandLoadingState());
    var either = await getAllBrandsUseCase.invoke();
    either.fold(
      (error) {
        emit(BrandErrorState(failures: error));
      },
      (response) {
        brandsList = response.data!;
        emit(BrandSuccessState(brandResponseEntity: response));
      },
    );
  }
}
