import 'dart:developer';

import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import '../../../../../domain/use_cases/login_use_case.dart';
import 'login_states.dart';

@injectable
class LoginViewModel extends Cubit<LoginStates> {
  LoginUseCase loginUseCase;
  LoginViewModel({required this.loginUseCase}) : super(LoginInitialState());

  // todo: hold Data , handle Logic


  TextEditingController emailController = TextEditingController(
    text: "shifoo242@gmail.co",
  );
  TextEditingController passwordController = TextEditingController(
    text: "Shrief111*",
  );
  var formKey = GlobalKey<FormState>();

  void login() async {
    if (formKey.currentState?.validate() == true) {
      emit(LoginLoadingState());
      var either = await loginUseCase.invoke(
        emailController.text,
        passwordController.text,
      );
      either.fold(
        (error) {
          log("LOGIN ERROR STATE 🔴");
          log("Type: ${error.runtimeType}");
          log("Message: ${error.errorMsg}");
          emit(LoginErrorState(errors: error));
        },
        (response) {
          emit(LoginSuccessState(loginResponseEntity: response));
        },
      );
    }
  }
}
