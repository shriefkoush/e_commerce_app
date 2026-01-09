import 'package:e_commerce_app2/core/di/di.dart';
import 'package:e_commerce_app2/core/utils/app_colors.dart';
import 'package:e_commerce_app2/core/utils/dialog_Utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../core/utils/app_assets.dart';
import '../../../core/utils/app_styles.dart';

import '../widgets/customElevatedButton.dart';
import '../widgets/customTextFeild.dart';
import 'cubit/register_states.dart';
import 'cubit/register_view_model.dart';

class RegisterScreen extends StatelessWidget {
  RegisterViewModel viewModel = getIt<RegisterViewModel>();

 static const String routeName = "register";
  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    return BlocListener<RegisterViewModel, RegisterStates>(
      bloc: viewModel,
  listener: (context, state) {
    if(state is RegisterLoadingState){
       DialogUtils.showLoading(context: context, message: "Loading..");
    }
    else if(state is RegisterErrorState){
      DialogUtils.hideLoading(context);
      DialogUtils.showMessage(context: context, message: state.failures.errorMsg,
      posActionName:"Ok" ,title: "Error");
    }
    else{
      DialogUtils.hideLoading(context);
      DialogUtils.showMessage(context: context, message: "Register Successfully",
          posActionName:"Ok" ,title: "Success");
    }
  },
  child: Scaffold(
      backgroundColor: AppColors.primaryColor,
      body: Padding(
        padding:  EdgeInsets.symmetric(
          horizontal: width*0.01
        ),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Form(
                key: viewModel.formKey,
                child: Padding(
                  padding:  EdgeInsets.only(
                      top: height*0.12,
                      left: width*0.17,
                      right : width*0.17,
                      bottom: height*0.04
                  ),
                  child: Image.asset(AppAssets.routeLogo),
                ),
              ),
              Text("Full name",style: AppStyles.regular18White,),
              SizedBox(height: height*0.01),
              CustomTextField(
                  controller: viewModel.fullNameController,
                  keyboardType: TextInputType.emailAddress,
                  validator: (text) {
                    if (text == null || text.trim().isEmpty) {
                      return "please , enter your full name";
                    }
                    return null;
                    },
                  hintStyle: AppStyles.Mediam16Grey,
                  hintText: "enter your full name"
              ),
              SizedBox(height: height*0.02,),
              Text("Mobile Number",style: AppStyles.regular18White,),
              SizedBox(height: height*0.01),
              CustomTextField(
                hintStyle: AppStyles.Mediam16Grey,
                keyboardType: TextInputType.phone,
                hintText: "enter your mobile number",
                controller: viewModel.mobileNumberController,
                validator: (String? val) {
                  if (val == null) {
                    return "this field is required";
                  } else if (int.tryParse(val.trim()) == null) {
                    return "enter numbers only";
                  } else if (val.trim().length != 11) {
                    return "enter value must equal 11 digit";
                  } else {
                    return null;
                  }
                },
              ),
              SizedBox(height: height*0.02,),
              Text("E-mail Address",style: AppStyles.regular18White,),
              SizedBox(height: height*0.01),
              CustomTextField(
                  controller: viewModel.emailAddressController,
                  keyboardType: TextInputType.emailAddress,
                  validator: (text) {
                    if (text == null || text.trim().isEmpty) {
                      return "please , enter your email";
                    }
                    final bool emailValid = RegExp(
                      r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+",
                    ).hasMatch(text);
                    if (!emailValid) {
                      return "please, enter valid email";
                    }
                    return null;
                  },
                  hintStyle: AppStyles.Mediam16Grey,
                  hintText: "enter your name"
              ),
              SizedBox(height: height*0.02,),
              Text("password",style: AppStyles.regular18White,),
              SizedBox(height: height*0.01),
              CustomTextField(
                controller: viewModel.passwordController,
                keyboardType: TextInputType.phone,
                validator: (text) {
                  if (text == null || text.trim().isEmpty) {
                    return "please, enter your password!";
                  }
                  if (text.length < 6) {
                    return "password should be at least 6 chars";
                  }
                  return null;
                },
                suffixIcon: Icon(
                  Icons.visibility_off,
                  color: AppColors.greyColor,
                ),
                obscureText: true,
                hintStyle: AppStyles.Mediam16Grey,
                hintText: "enter your password",
              ),
              SizedBox(height: height*0.02,),
              Text("Re-Password",style: AppStyles.regular18White,),
              SizedBox(height: height*0.01),
              CustomTextField(
                controller: viewModel.passwordController,
                keyboardType: TextInputType.phone,
                validator: (text) {
                  if (text == null || text.trim().isEmpty) {
                    return "please, enter your password!";
                  }
                  if (text.length < 6) {
                    return "password should be at least 6 chars";
                  }
                  else if (text != viewModel.passwordController.text) {
                    return "enter same password please!";
                  }
                  return null;
                },
                suffixIcon: Icon(
                  Icons.visibility_off,
                  color: AppColors.greyColor,
                ),
                obscureText: true,
                hintStyle: AppStyles.Mediam16Grey,
                hintText: "enter same password",
              ),
              SizedBox(height: height*0.05,),
              CustomElevatedButton(onButtonClick: (){
                viewModel.register();
              }, text: "Sign up")
            ],
          ),
        ),
      ),
    ),
);
  }


}
