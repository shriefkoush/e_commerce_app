import 'package:e_commerce_app2/core/errors/failures.dart';

import '../../../../../domain/entities/LoginResponseEntity.dart';

abstract class LoginStates {}

class LoginInitialState extends LoginStates {}

class LoginLoadingState extends LoginStates {}

class LoginErrorState extends LoginStates {
  Failures errors;
  LoginErrorState({required this.errors});
}

class LoginSuccessState extends LoginStates {
  LoginResponseEntity loginResponseEntity;
  LoginSuccessState({required this.loginResponseEntity});
}
