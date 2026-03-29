import 'package:e_commerce_app2/core/utils/app_styles.dart';
import 'package:e_commerce_app2/features/ui/screens/cart_screen/cupit/cart_states.dart';
import 'package:e_commerce_app2/features/ui/screens/cart_screen/cupit/cart_view_model.dart';
import 'package:e_commerce_app2/features/ui/widgets/CustomText.dart';
import 'package:e_commerce_app2/features/ui/widgets/cart_item_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../core/di/di.dart';
import '../../../../core/utils/app_colors.dart';
import '../../widgets/add_or_delete_item_widget.dart';

class CartScreen extends StatelessWidget {
  CartViewModel viewModel = getIt<CartViewModel>();
  static const String routeName = "cart";

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: AppColors.whiteColor,
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: AppColors.whiteColor,
        title: CustomText(
          text: "Cart",
          textStyle: AppStyles.bold20primary,
        ),
        actions: [
          Icon(Icons.search, color: AppColors.primaryColor, size: 30),
          SizedBox(width: width * 0.03),
          Icon(Icons.shopping_cart_outlined, color: AppColors.primaryColor, size: 30),
          SizedBox(width: width * 0.01),
        ],
      ),
      body: Padding(
        padding:  EdgeInsets.symmetric(horizontal: width*0.02),
        child: BlocBuilder<CartViewModel,CartStates>(
          bloc: viewModel..getItemsInCart(),
          builder: (context ,state){
            if (state is CartSuccessState){
              return Column(children: [
                Expanded(child:
                ListView.separated(
                    itemBuilder: (context ,index){return
                      CartItemWidget(
                        productDetails: state.cartResponseEntity.data!.products?[index],
                        addOrFavourite:
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          IconButton(onPressed: (){},
                              icon: Icon(Icons.delete_forever_outlined,color: AppColors.primaryColor,size: 30,)),
                          AddOrDeleteItemWidget()
                        ],),);
                    },
                    separatorBuilder: (context , index){
                      return SizedBox(height: height*0.015,);
                    },
                    itemCount: state.cartResponseEntity.data!.products!.length)
                ),
                SizedBox(height: height * 0.015),
                Row(
                  children: [
                    CustomText(text: "Total Price:",textStyle: AppStyles.bold20primary,),
                    SizedBox(width: width*0.03,),
                    CustomText(text: state.cartResponseEntity.data!.totalCartPrice.toString(),
                      textStyle: AppStyles.bold20Black,),
                  ],
                ) ,
                SizedBox(height: height*0.03,),
                Padding(
                  padding:  EdgeInsets.symmetric(
                      horizontal: width*0.06
                  ),
                  child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(20)
                          ),
                          backgroundColor: AppColors.primaryColor,
                          padding: EdgeInsets.symmetric(
                            vertical: height*0.02,
                          )
                      ),
                      onPressed: (){},
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [

                          CustomText(text: "Check Out  ",textStyle: AppStyles.bold20White,),
                          Icon(Icons.arrow_forward,color: AppColors.whiteColor,
                            size: 30,),
                        ],
                      )),
                )
              ]
              );
            } else if (state is CartErrorState){
              return Center(child:
                Text(state.failures.errorMsg,),);
            } else {
              return Center(child:
                CircularProgressIndicator(color: AppColors.primaryColor,),);
            }
          },
        ),
      ),

    );
  }
}
