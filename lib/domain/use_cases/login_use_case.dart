import 'package:dartz/dartz.dart';
import 'package:e_commerce_app2/core/errors/failures.dart';
import 'package:e_commerce_app2/domain/repositories/authRepository.dart';
import 'package:injectable/injectable.dart';

import '../entities/LoginResponseEntity.dart';
@injectable
class LoginUseCase{
  AuthRepository authRepository;
  LoginUseCase({required this.authRepository});

  Future<Either<Failures,LoginResponseEntity>>
  invoke( String email ,String password){
     return authRepository.Login(email, password);
   }
}