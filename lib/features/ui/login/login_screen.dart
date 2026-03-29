import 'package:e_commerce_app2/core/cached/shared_preference_utils.dart';
import 'package:e_commerce_app2/core/di/di.dart';
import 'package:e_commerce_app2/core/utils/app_assets.dart';
import 'package:e_commerce_app2/core/utils/app_colors.dart';
import 'package:e_commerce_app2/core/utils/app_styles.dart';
import 'package:e_commerce_app2/core/utils/dialog_Utils.dart';
import 'package:e_commerce_app2/core/utils/validators.dart';
import 'package:e_commerce_app2/features/ui/login/cubit/cubit/login_states.dart';
import 'package:e_commerce_app2/features/ui/login/cubit/cubit/login_view_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../register/register_screen.dart';
import '../screens/home_screen/home_screen.dart';
import '../widgets/customElevatedButton.dart';
import '../widgets/customTextFeild.dart';

class LoginScreen extends StatefulWidget {
static const String routeName = "login";

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  LoginViewModel viewModel = getIt<LoginViewModel>();

  @override
  Widget build(BuildContext context) {

    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;

    return BlocListener<LoginViewModel, LoginStates>(
      bloc: viewModel,
  listener: (context, state) {
    if( state is LoginLoadingState){
      DialogUtils.showLoading(context: context, message: "Loading..");
    } else if(state is LoginErrorState){
      DialogUtils.hideLoading(context);
       DialogUtils.showMessage(context: context, message: state.errors.errorMsg,
           posActionName: "Ok",title: "Error");
    } else if(state is LoginSuccessState){
      DialogUtils.hideLoading(context);
      DialogUtils.showMessage(context: context, message: "Login Successfully",
      posActionName: "Ok",title: "Success",posAction: (){
        //Todo : save token
        SharedPreferenceUtils.saveData(key: "token",
            value: state.loginResponseEntity.token);
        //Todo : go to Home screen
        Navigator.pushReplacementNamed(context, HomeScreen.routeName);
          });
    }
  },
  child: Scaffold(
      backgroundColor: AppColors.primaryColor,
      body: Padding(
        padding:  EdgeInsets.symmetric(horizontal: width*0.01),
        child: SingleChildScrollView(child:
        Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Form(
              key: viewModel.formKey,
              child: Padding(
                padding:  EdgeInsets.only(
                    top: height*0.12,
                    left: width*0.17,
                    right : width*0.17,
                    bottom: height*0.09
                ),
                child: Image.asset(AppAssets.routeLogo),
              ),
            ),
            Text("Welcome Back To Route",style: AppStyles.semiBold24White,),
            Text("Please sign in with your email",style: AppStyles.light16White,),
            SizedBox(height: height*0.04,),
            Text("Email",style: AppStyles.regular18White,),
            SizedBox(height: height*0.01),
            CustomTextField(
                controller: viewModel.emailController,
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
               validator: AppValidators.validatePassword,
              // (text) {
              //   if (text == null || text.trim().isEmpty) {
              //     return "please, enter your password!";
              //   }
              //   if (text.length < 6) {
              //     return "password should be at least 6 chars";
              //   }
              //   return null;
              // },
              suffixIcon: Icon(
                Icons.visibility_off,
                color: AppColors.greyColor,
              ),
              obscureText: true,
              hintStyle: AppStyles.Mediam16Grey,
              hintText: "enter your password",
            ),
            SizedBox(height: height*0.01),
            Align(
              alignment: Alignment.centerRight,
              child: TextButton(
                  onPressed: (){
                  },
                  child: Text("Forget Password?",style:AppStyles.regular18White  ,)),
            ),
            SizedBox(height: height*0.03,),
            CustomElevatedButton(
                onButtonClick: (){
              viewModel.login();
            }, text: "Login"),
            SizedBox(height: height*0.01),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text("Don't have an account? ",style: AppStyles.light16White,),
                TextButton(onPressed: (){
                  Navigator.pushNamed(context, RegisterScreen.routeName);
                  },
                    child: Text("Create Account",style: AppStyles.regular18White,))
              ],)
          ],)
        )
      ),
    ),
);
  }
}
