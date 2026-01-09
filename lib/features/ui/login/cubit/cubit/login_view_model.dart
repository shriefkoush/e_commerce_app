import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import '../../../../../domain/use_cases/login_use_case.dart';
import 'login_states.dart';

@injectable
class LoginViewModel extends Cubit<LoginStates> {
  LoginUseCase loginUseCase;
  LoginViewModel({required this.loginUseCase}) : super(LoginInitialState());
  TextEditingController emailController = TextEditingController(
    text: "sherifhassanally@gmail.com",
  );
  TextEditingController passwordController = TextEditingController(
    text: "Shrief111",
  );
  var formKey = GlobalKey<FormState>();

  // todo: hold Data , handle Logic
  void login() async {
    if (formKey.currentState!.validate() == true) {
      emit(LoginLoadingState());
      var either = await loginUseCase.invoke(
        emailController.text,
        passwordController.text,
      );
      either.fold(
        (error) {
          print("LOGIN ERROR STATE 🔴");
          print("Type: ${error.runtimeType}");
          print("Message: ${error.errorMsg}");
          emit(LoginErrorState(errors: error));
        },
        (response) {
          emit(LoginSuccessState(loginResponseEntity: response));
        },
      );
    }
  }
}
