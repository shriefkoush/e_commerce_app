import 'package:auto_size_text/auto_size_text.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:e_commerce_app2/core/utils/app_assets.dart';
import 'package:e_commerce_app2/core/utils/app_colors.dart';
import 'package:e_commerce_app2/core/utils/app_styles.dart';
import 'package:e_commerce_app2/domain/entities/Cart_response_entity.dart';
import 'package:e_commerce_app2/features/ui/widgets/CustomText.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CartItemWidget extends StatelessWidget {
  GetProductsEntity? productDetails ;
  Widget addOrFavourite ;
  CartItemWidget({super.key, required this.addOrFavourite , this.productDetails});
  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15),
        border: Border.all(
          color: AppColors.primaryColor,
          width: 0.3,
        ),
      ),
      child: Row(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(15),
            child:
            CachedNetworkImage(
              imageUrl: productDetails?.product?.imageCover??"" ,
              fit: BoxFit.fill,
              height: height*0.14,
              placeholder:(context ,url)=>
                  CircularProgressIndicator(color: AppColors.primaryColor,),
              errorWidget: (context,url, error)=>
                  Icon(Icons.error,color: AppColors.redColor,),
            ),
          ),
          SizedBox(width: width*0.015,),
          Column(children: [
            AutoSizeText(
              productDetails?.product?.title??"",
              style:  AppStyles.bold16Black,
               maxLines: 2,
              ),
            SizedBox(height: height*0.02,),
            CustomText(text: "EGP ${productDetails?.price??""}",
              textStyle: AppStyles.bold16Black,),

          ],),
          Spacer(),
          addOrFavourite ,
        ],
      ),
    );
  }
}
