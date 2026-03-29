// dart format width=80
// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:get_it/get_it.dart' as _i174;
import 'package:injectable/injectable.dart' as _i526;

import '../../data/data_sources/remote_data_source/auth_remote_data_source_impl.dart'
    as _i373;
import '../../data/data_sources/remote_data_source/cart_remote_data_source_impl.dart'
    as _i756;
import '../../data/data_sources/remote_data_source/home_remote_data_source_impl.dart'
    as _i886;
import '../../data/data_sources/remote_data_source/product_remote_data_source_impl.dart'
    as _i213;
import '../../data/repositories/auth_repository_impl.dart' as _i895;
import '../../data/repositories/cart_repository_impl.dart' as _i915;
import '../../data/repositories/home_repository_impl.dart' as _i514;
import '../../data/repositories/product_repository_impl.dart' as _i876;
import '../../domain/repositories/authRepository.dart' as _i260;
import '../../domain/repositories/Cart_repository/Cart_repository.dart'
    as _i1055;
import '../../domain/repositories/data_sources/remote_data_source/authRemoteDataSource.dart'
    as _i981;
import '../../domain/repositories/data_sources/remote_data_source/cartRemoteDataSource.dart'
    as _i414;
import '../../domain/repositories/data_sources/remote_data_source/homeRemoteDataSource.dart'
    as _i942;
import '../../domain/repositories/data_sources/remote_data_source/productRemoteDataSource.dart'
    as _i918;
import '../../domain/repositories/home_repository/homeRepository.dart' as _i34;
import '../../domain/repositories/product_repository/Product_repository.dart'
    as _i8;
import '../../domain/use_cases/Add_to_cart_use_case.dart' as _i466;
import '../../domain/use_cases/get_all_brands_use_case.dart' as _i773;
import '../../domain/use_cases/get_all_products_use_case.dart' as _i939;
import '../../domain/use_cases/get_cart_items_use_case.dart' as _i136;
import '../../domain/use_cases/getAllCategoriesUseCase.dart' as _i541;
import '../../domain/use_cases/login_use_case.dart' as _i471;
import '../../domain/use_cases/register_use_case.dart' as _i479;
import '../../features/ui/login/cubit/cubit/login_view_model.dart' as _i296;
import '../../features/ui/register/cubit/register_view_model.dart' as _i195;
import '../../features/ui/screens/cart_screen/cupit/cart_view_model.dart'
    as _i333;
import '../../features/ui/screens/home_screen/categories_tap/cubit/Category_tab_view_model.dart'
    as _i538;
import '../../features/ui/screens/home_screen/home_tap/cubit/home_tab_view_model.dart'
    as _i59;
import '../api/api_manager.dart' as _i1047;

extension GetItInjectableX on _i174.GetIt {
  // initializes the registration of main-scope dependencies inside of GetIt
  _i174.GetIt init({
    String? environment,
    _i526.EnvironmentFilter? environmentFilter,
  }) {
    final gh = _i526.GetItHelper(this, environment, environmentFilter);
    gh.singleton<_i1047.ApiManager>(() => _i1047.ApiManager());
    gh.lazySingleton<_i942.HomeRemoteDataSource>(
      () => _i886.HomeRemoteDataSourceImpl(apiManager: gh<_i1047.ApiManager>()),
    );
    gh.factory<_i918.ProductRemoteDataSource>(
      () => _i213.ProductRemoteDataSourceImpl(
        apiManager: gh<_i1047.ApiManager>(),
      ),
    );
    gh.factory<_i981.AuthRemoteDataSource>(
      () => _i373.AuthRemoteDataSourceImpl(apiManager: gh<_i1047.ApiManager>()),
    );
    gh.factory<_i8.ProductRepository>(
      () => _i876.ProductRepositoryImpl(
        productRemoteDataSource: gh<_i918.ProductRemoteDataSource>(),
      ),
    );
    gh.factory<_i414.CartRemoteDataSource>(
      () => _i756.CartRemoteDataSourceImpl(apiManager: gh<_i1047.ApiManager>()),
    );
    gh.lazySingleton<_i34.HomeRepository>(
      () => _i514.HomeRepositoryImpl(
        remoteDataSource: gh<_i942.HomeRemoteDataSource>(),
      ),
    );
    gh.factory<_i260.AuthRepository>(
      () => _i895.AuthRepositoryImpl(
        authRemoteDataSource: gh<_i981.AuthRemoteDataSource>(),
      ),
    );
    gh.factory<_i1055.CartRepository>(
      () => _i915.CartRepositoryImpl(
        cartRemoteDataSource: gh<_i414.CartRemoteDataSource>(),
      ),
    );
    gh.factory<_i939.GetAllProductsUseCase>(
      () => _i939.GetAllProductsUseCase(
        productRepository: gh<_i8.ProductRepository>(),
      ),
    );
    gh.factory<_i773.GetAllBrandsUseCase>(
      () => _i773.GetAllBrandsUseCase(gh<_i34.HomeRepository>()),
    );
    gh.factory<_i471.LoginUseCase>(
      () => _i471.LoginUseCase(authRepository: gh<_i260.AuthRepository>()),
    );
    gh.factory<_i479.RegisterUseCase>(
      () => _i479.RegisterUseCase(authRepository: gh<_i260.AuthRepository>()),
    );
    gh.factory<_i466.AddToCartUseCase>(
      () => _i466.AddToCartUseCase(homeRepository: gh<_i34.HomeRepository>()),
    );
    gh.factory<_i541.GetAllCategoriesUseCase>(
      () => _i541.GetAllCategoriesUseCase(
        homeRepository: gh<_i34.HomeRepository>(),
      ),
    );
    gh.factory<_i136.GetCartItemsUseCase>(
      () => _i136.GetCartItemsUseCase(
        cartRepository: gh<_i1055.CartRepository>(),
      ),
    );
    gh.factory<_i538.CategoryTapViewModel>(
      () => _i538.CategoryTapViewModel(
        getAllProductsUseCase: gh<_i939.GetAllProductsUseCase>(),
        addToCartUseCase: gh<_i466.AddToCartUseCase>(),
      ),
    );
    gh.factory<_i296.LoginViewModel>(
      () => _i296.LoginViewModel(loginUseCase: gh<_i471.LoginUseCase>()),
    );
    gh.factory<_i195.RegisterViewModel>(
      () =>
          _i195.RegisterViewModel(registerUseCase: gh<_i479.RegisterUseCase>()),
    );
    gh.factory<_i333.CartViewModel>(
      () => _i333.CartViewModel(
        getCartItemsUseCase: gh<_i136.GetCartItemsUseCase>(),
      ),
    );
    gh.factory<_i59.HomeTapViewModel>(
      () => _i59.HomeTapViewModel(
        getAllCategoriesUseCase: gh<_i541.GetAllCategoriesUseCase>(),
        getAllBrandsUseCase: gh<_i773.GetAllBrandsUseCase>(),
      ),
    );
    return this;
  }
}
