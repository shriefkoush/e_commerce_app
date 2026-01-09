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
import '../../data/repositories/auth_repository_impl.dart' as _i895;
import '../../domain/repositories/authRepository.dart' as _i260;
import '../../domain/repositories/data_sources/remote_data_source/authRemoteDataSource.dart'
    as _i981;
import '../../domain/use_cases/login_use_case.dart' as _i471;
import '../../domain/use_cases/register_use_case.dart' as _i479;
import '../../features/ui/login/cubit/cubit/login_view_model.dart' as _i296;
import '../../features/ui/register/cubit/register_view_model.dart' as _i195;
import '../api/api_manager.dart' as _i1047;

extension GetItInjectableX on _i174.GetIt {
  // initializes the registration of main-scope dependencies inside of GetIt
  _i174.GetIt init({
    String? environment,
    _i526.EnvironmentFilter? environmentFilter,
  }) {
    final gh = _i526.GetItHelper(this, environment, environmentFilter);
    gh.singleton<_i1047.ApiManager>(() => _i1047.ApiManager());
    gh.factory<_i981.AuthRemoteDataSource>(
      () => _i373.AuthRemoteDataSourceImpl(apiManager: gh<_i1047.ApiManager>()),
    );
    gh.factory<_i260.AuthRepository>(
      () => _i895.AuthRepositoryImpl(
        authRemoteDataSource: gh<_i981.AuthRemoteDataSource>(),
      ),
    );
    gh.factory<_i479.RegisterUseCase>(
      () => _i479.RegisterUseCase(authRepository: gh<_i260.AuthRepository>()),
    );
    gh.factory<_i471.LoginUseCase>(
      () => _i471.LoginUseCase(authRepository: gh<_i260.AuthRepository>()),
    );
    gh.factory<_i296.LoginViewModel>(
      () => _i296.LoginViewModel(loginUseCase: gh<_i471.LoginUseCase>()),
    );
    gh.factory<_i195.RegisterViewModel>(
      () =>
          _i195.RegisterViewModel(registerUseCase: gh<_i479.RegisterUseCase>()),
    );
    return this;
  }
}
