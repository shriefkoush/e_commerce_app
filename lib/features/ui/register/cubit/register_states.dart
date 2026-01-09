import 'package:e_commerce_app2/core/errors/failures.dart';
import 'package:e_commerce_app2/domain/entities/RegisterResponseEntity.dart';

abstract class RegisterStates {}
class RegisterInitialState extends RegisterStates{}
class RegisterLoadingState extends RegisterStates{}
class RegisterErrorState extends RegisterStates{
  Failures failures ;
  RegisterErrorState({required this.failures});
}
class RegisterSuccessState extends RegisterStates{
  RegisterResponseEntity registerResponseEntity;
  RegisterSuccessState({required this.registerResponseEntity});
}