import 'package:dartz/dartz.dart';
import 'package:e_commerce_app2/core/errors/failures.dart';
import 'package:e_commerce_app2/domain/entities/LoginResponseEntity.dart';
import 'package:e_commerce_app2/domain/entities/RegisterResponseEntity.dart';
import 'package:e_commerce_app2/domain/repositories/authRepository.dart';
import 'package:e_commerce_app2/domain/repositories/data_sources/remote_data_source/authRemoteDataSource.dart';
import 'package:injectable/injectable.dart';


@Injectable(as: AuthRepository)
class AuthRepositoryImpl implements AuthRepository {
  AuthRemoteDataSource authRemoteDataSource;
  AuthRepositoryImpl({required this.authRemoteDataSource});

  @override
  Future<Either<Failures, RegisterResponseEntity>> Register(
    String name,
    String email,
    String password,
    String rePassword,
    String phone,
  ) async {
    var either = await authRemoteDataSource.register(
      name,
      email,
      password,
      rePassword,
      phone,
    );
    return either.fold((error) => Left(error), (response) => Right(response));
  }

  @override
  Future<Either<Failures, LoginResponseEntity>> Login(
    String email,
    String password,
  ) async {
    var either = await authRemoteDataSource.Login(email, password);
    return either.fold((error) => Left(error), (response) => Right(response));
  }
}
