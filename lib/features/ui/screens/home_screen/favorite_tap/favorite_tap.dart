import 'package:e_commerce_app2/core/utils/app_colors.dart';
import 'package:e_commerce_app2/domain/entities/Cart_response_entity.dart';
import 'package:flutter/material.dart';
import '../../../../../core/utils/app_assets.dart';
import '../../../../../core/utils/app_styles.dart';
import '../../../widgets/CustomText.dart';
import '../../../widgets/cart_item_widget.dart';
import '../../../widgets/customTextFeild.dart';
import '../../cart_screen/cart_screen.dart';

class FavoriteTap extends StatelessWidget {
  const FavoriteTap({super.key});

  @override
  Widget build(BuildContext context) {
    var width =MediaQuery.of(context).size.width;
    var height =MediaQuery.of(context).size.height;
    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: width * 0.02,
        vertical: height * 0.01,
      ),      child: Scaffold(
        backgroundColor: AppColors.whiteColor,
        appBar: AppBar(
        leadingWidth: width * 0.22,
        actions: [
          GestureDetector(
            onTap: (){
              Navigator.pushNamed(context, CartScreen.routeName);
            },
            child: ImageIcon(
              AssetImage(AppAssets.cartIcon),
              color: AppColors.primaryColor,
              size: 35,
            ),
          ),
        ],
        backgroundColor: AppColors.whiteColor,
        leading: Image.asset(AppAssets.routeHomeIcon),
      ),
      body: Column(children: [
        CustomTextField(
          borderColor: AppColors.primaryColor,
          prefixIcon: Icon(
            Icons.search,
            size: 35,
            color: AppColors.primaryColor,
          ),
          hintText: "What do you search for ?",
        ),
        SizedBox(height: height * 0.02),
        Expanded(child:
        ListView.separated(
            itemBuilder: (context ,index){return
              Padding(
                padding:  EdgeInsets.only(right: width*0.01),
                child: CartItemWidget(
                  addOrFavourite:
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      CircleAvatar(
                        backgroundColor: AppColors.whiteColor,
                        child: IconButton(onPressed: (){},
                            icon: Icon(Icons.favorite,
                              color: AppColors.primaryColor,size: 30,)),
                      ),
                  SizedBox(height: height*0.01,),
                  Container(
                    decoration: BoxDecoration(
                      color: AppColors.primaryColor,
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Padding(
                      padding:  EdgeInsets.symmetric(horizontal: width*0.015,
                      vertical: height*0.01),
                      child: CustomText(text: "Add to cart",textStyle: AppStyles.bold16White,),
                    ),
                  ),
                    ],),
                ),
              );
            },
            separatorBuilder: (context , index){
              return SizedBox(height: height*0.02,);
            },
            itemCount: 15)
        ),

      ],),
      ),
    );
  }
}
