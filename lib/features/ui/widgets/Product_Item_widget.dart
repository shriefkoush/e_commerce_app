import 'package:cached_network_image/cached_network_image.dart';
import 'package:e_commerce_app2/core/utils/app_colors.dart';
import 'package:e_commerce_app2/core/utils/app_styles.dart';
import 'package:e_commerce_app2/domain/entities/Product_response_entity.dart';
import 'package:e_commerce_app2/features/ui/screens/home_screen/categories_tap/cubit/Category_tab_view_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../core/utils/flutter_Toast.dart';
import '../screens/home_screen/categories_tap/cubit/Category_states.dart';
import 'CustomText.dart';

class ProductItemWidget extends StatelessWidget {
  ProductEntity product;
  ProductItemWidget({required this.product});

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    return BlocListener<CategoryTapViewModel, ProductState>(
      listener: (context ,state) {
        if (state is AddCartSuccessState){
          return ToastMessage.customToast(context, "Added to card");
        } else if (state is AddCartErrorState){
          return ToastMessage.customToast(
              bg: AppColors.redColor,
              context, state.failures.errorMsg);
        }
      },
  child: Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15),
        border: Border.all(
          color: AppColors.primaryColor
        ),
      ),
      child: Column(children: [
        Stack(
          children: [
            ClipRRect(
            borderRadius: BorderRadius.only(topLeft: Radius.circular(15),topRight: Radius.circular(15)),
            child:
                // Image.asset(AppAssets.productImage,fit: BoxFit.fill,)
            CachedNetworkImage(imageUrl: product.imageCover??"",
              fit: BoxFit.cover,
              height: height*0.19,
              width: double.infinity,
              placeholder:(context ,url)=>
                  CircularProgressIndicator(color: AppColors.primaryColor,),
              errorWidget: (context,url, error)=>
                  Icon(Icons.error,color: AppColors.redColor,),
            ),
          ),
            Positioned(top: height*0.015,right:width*0.015 ,
                child: CircleAvatar(
                  backgroundColor: AppColors.whiteColor,
                  radius: 20,
                  child: Center(child: IconButton(onPressed: (){},
                      icon:Icon(Icons.favorite_border,color: AppColors.primaryColor,
                      size: 25,
                      ),
                    ), ),),
                )
            ]
        ),
        Padding(
          padding:  EdgeInsets.symmetric(
            horizontal: width*0.01,
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
            CustomText(
              text: product.title??"",
              fontSize: 16,
            ),
              SizedBox(height: height*0.01,
              ),
              Row(children: [
                CustomText(text: "EGP ${product.price}"),SizedBox(width: width*0.015,)
                ,CustomText(text:"EGP ${product.price!*1.25}",textStyle:
                AppStyles.regular11SalePrice.copyWith(decoration: TextDecoration.lineThrough), )
              ],),
              SizedBox(height: height*0.02,),
              Row(children: [
                CustomText(text: "Review (${product.ratingsAverage})"),
                Icon(Icons.star,color: AppColors.yellowColor,size: 28,),
                const Spacer(),
                InkWell(
                  onTap: (){
                    //Todo : add to cart
                    CategoryTapViewModel.get(context).addToCart(product.id??"");
                  },
                  splashColor: Colors.transparent,
                  child: Icon(Icons.add_circle,size: 32,color: AppColors.primaryColor,),
                )
              ],)
            ],),
        )


      ],),
    ),
);
  }
}
