import 'package:e_commerce_app2/domain/use_cases/register_use_case.dart';
import 'package:e_commerce_app2/features/ui/register/cubit/register_states.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

@injectable
class RegisterViewModel extends Cubit<RegisterStates> {
  var fullNameController = TextEditingController(text: "Sherif Koush");
  var mobileNumberController = TextEditingController(text: "01068342137");
  var passwordController = TextEditingController(text: "Sherif11*");
  var rePasswordController = TextEditingController(text: "Sherif11*");
  var emailAddressController = TextEditingController(text: "shriefHassan@gmail.com");
  var formKey = GlobalKey<FormState>();
  RegisterUseCase registerUseCase;
  RegisterViewModel({required this.registerUseCase})
    : super(RegisterInitialState());
  // todo: hold Data , handle Logic
  void register() async {
    if (formKey.currentState!.validate() == true) {
      emit(RegisterLoadingState());
      var either = await registerUseCase.invoke(
        fullNameController.text,
        emailAddressController.text,
        passwordController.text,
        rePasswordController.text,
        mobileNumberController.text,
      );
      either.fold(
        (error) {
          emit(RegisterErrorState(failures: error));
        },
        (response) {
          emit(RegisterSuccessState(registerResponseEntity: response));
        },
      );
    }
  }
}
