import 'package:e_commerce_app2/core/cached/shared_preference_utils.dart';
import 'package:e_commerce_app2/core/utils/app_colors.dart';
import 'package:e_commerce_app2/features/ui/login/login_screen.dart';
import 'package:e_commerce_app2/features/ui/widgets/CustomText.dart';
import 'package:flutter/material.dart';

import '../../../../../core/utils/app_assets.dart';
import '../../../../../core/utils/app_styles.dart';
import '../../../../../core/utils/validators.dart';
import '../../../widgets/customTextFeild.dart';

class ProfileTap extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    var fullNameController = TextEditingController(text: "shrief Hassan Ali");
    var mobileNumberController = TextEditingController(text: "01274926183");
    var passwordController = TextEditingController(text: "Shrief111");
    var addressController = TextEditingController(text: "1 ش العزيمة سيدي بشر بحري ");
    var emailAddressController = TextEditingController(text: "sherifhassanally@gmail.com");
    var formKey = GlobalKey<FormState>();
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    return Padding(
      padding:  EdgeInsets.symmetric(horizontal: width*0.02),
      child: Scaffold(
        backgroundColor: AppColors.whiteColor,
        appBar: AppBar(
          backgroundColor: AppColors.whiteColor,
          leading: Image.asset(AppAssets.routeHomeIcon),
          leadingWidth: width*0.22,
        ),
        body: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Row(mainAxisAlignment:MainAxisAlignment .spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                  CustomText(text: "Welcome, Sherif ",textStyle: AppStyles.bold18primary,),
                  SizedBox(height: height*0.005,),
                  CustomText(text: "shifoo242@gmail.co ",textStyle: AppStyles.Mediam16Grey,),

                ],),
                IconButton(onPressed: (){
                  //Todo: remove token
                  SharedPreferenceUtils.removeData(key: "token");
                  //Todo : navigate to loginScreen
                  Navigator.of(context).pushNamedAndRemoveUntil( LoginScreen.routeName,
                      (route)=>false);
                },
                    icon: Icon(Icons.logout,color: AppColors.redColor,size: 30,))
              ],
              ),
              SizedBox(height: height*0.02,),
              Form(
                key: formKey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Text("Your Full name",style: AppStyles.regular18primary,),
                    SizedBox(height: height*0.01),
                    CustomTextField(
                        controller: fullNameController,
                        validator: AppValidators.validateFullName,
                        //   (text) {
                        // if (text == null || text.trim().isEmpty) {
                        //   return "please , enter your full name";
                        // }
                        // return null;
                        // },
                        hintStyle: AppStyles.Mediam16Grey,
                        hintText: "enter your full name"
                    ),
                    SizedBox(height: height*0.02,),
                    Text("Your Mobile Number",style: AppStyles.regular18primary,),
                    SizedBox(height: height*0.01),
                    CustomTextField(
                      hintStyle: AppStyles.Mediam16Grey,
                      keyboardType: TextInputType.phone,
                      hintText: "enter your mobile number",
                      controller: mobileNumberController,
                      validator: AppValidators.validatePhoneNumber,
                      //     (String? val) {
                      //   if (val == null) {
                      //     return "this field is required";
                      //   } else if (int.tryParse(val.trim()) == null) {
                      //     return "enter numbers only";
                      //   } else if (val.trim().length != 11) {
                      //     return "enter value must equal 11 digit";
                      //   } else {
                      //     return null;
                      //   }
                      // },
                    ),
                    SizedBox(height: height*0.02,),
                    Text("Your E-mail Address",style: AppStyles.regular18primary,),
                    SizedBox(height: height*0.01),
                    CustomTextField(
                        controller: emailAddressController,
                        keyboardType: TextInputType.emailAddress,
                        validator: AppValidators.validateEmail,
                        //     (text) {
                        //   if (text == null || text.trim().isEmpty) {
                        //     return "please , enter your email";
                        //   }
                        //   final bool emailValid = RegExp(
                        //     r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+",
                        //   ).hasMatch(text);
                        //   if (!emailValid) {
                        //     return "please, enter valid email";
                        //   }
                        //   return null;
                        // },
                        hintStyle: AppStyles.Mediam16Grey,
                        hintText: "enter your name"
                    ),
                    SizedBox(height: height*0.02,),
                    Text("Your password",style: AppStyles.regular18primary,),
                    SizedBox(height: height*0.01),
                    CustomTextField(
                      controller: passwordController,
                      validator: AppValidators.validatePassword,
                      //     (text) {
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
                    SizedBox(height: height*0.02,),
                    Text("Your Address",style: AppStyles.regular18primary,),
                    SizedBox(height: height*0.01),
                    CustomTextField(
                        controller: addressController,
                        hintStyle: AppStyles.Mediam16Grey,
                        hintText: "enter your full Address"
                    ),
                    SizedBox(height: height*0.05,),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
