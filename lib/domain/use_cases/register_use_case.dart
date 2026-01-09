import 'package:dartz/dartz.dart';
import 'package:e_commerce_app2/core/errors/failures.dart';
import 'package:e_commerce_app2/domain/entities/RegisterResponseEntity.dart';
import 'package:e_commerce_app2/domain/repositories/authRepository.dart';
import 'package:injectable/injectable.dart';
@injectable
class RegisterUseCase{
  AuthRepository authRepository;
  RegisterUseCase({required this.authRepository});

  Future<Either<Failures,RegisterResponseEntity>> invoke(String name , String email ,String password,String rePassword,
       String phone){
     return authRepository.Register(name, email, password, rePassword, phone);
   }
}