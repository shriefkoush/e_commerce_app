import 'package:cached_network_image/cached_network_image.dart';
import 'package:e_commerce_app2/core/utils/app_colors.dart';
import 'package:e_commerce_app2/core/utils/app_styles.dart';
import 'package:e_commerce_app2/domain/entities/Product_response_entity.dart';
import 'package:e_commerce_app2/features/ui/screens/cart_screen/cart_screen.dart';
import 'package:e_commerce_app2/features/ui/widgets/add_or_delete_item_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_image_slideshow/flutter_image_slideshow.dart';
import 'package:readmore/readmore.dart';

import '../../widgets/CustomText.dart';


class ProductDetailsScreen extends StatefulWidget {
  static const String routeName = "productDetails";

  @override
  State<ProductDetailsScreen> createState() => _ProductDetailsScreenState();
}

class _ProductDetailsScreenState extends State<ProductDetailsScreen> {
  @override
  Widget build(BuildContext context) {
    var args = ModalRoute.of(context)?.settings.arguments as ProductEntity ;
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    int productCounter = 0 ;
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: AppColors.whiteColor,
        title: CustomText(
          text: "Product Details",
          textStyle: AppStyles.bold20primary,
        ),
        actions: [
          Icon(Icons.search, color: AppColors.primaryColor, size: 30),
          SizedBox(width: width * 0.03),
          IconButton(
              onPressed: (){
                Navigator.pushNamed(context, CartScreen.routeName);
              },
              icon:  Icon(Icons.shopping_cart_outlined, color: AppColors.primaryColor, size: 30)),
          SizedBox(width: width * 0.01),
        ],
      ),
      backgroundColor: AppColors.whiteColor,
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: width * 0.02),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Stack(
                children: [
                  ImageSlideshow(
                    indicatorColor: AppColors.primaryColor,
                     indicatorPadding: width*0.015,
                    initialPage: 0,
                    indicatorBottomPadding: height*0.01,
                    indicatorRadius: 5,
                    indicatorBackgroundColor: AppColors.whiteColor ,
                    isLoop: true,
                    autoPlayInterval:3000 ,
                    children: args.images!.map((url){
                      return  ClipRRect(
                      borderRadius: BorderRadius.circular(15),
                      child:
                      CachedNetworkImage(imageUrl: args.imageCover!,
                        fit: BoxFit.cover,
                        width: double.infinity,
                        placeholder:(context ,url)=>
                            CircularProgressIndicator(color: AppColors.primaryColor,),
                        errorWidget: (context,url, error)=>
                            Icon(Icons.error,color: AppColors.redColor,),
                      ),
                      );}
                      ).toList()
                  ),
                  Positioned(
                    top: height * 0.02,
                    right: width * 0.03,
                    child: CircleAvatar(
                      backgroundColor: AppColors.whiteColor,
                      // radius: BorderRadius,
                      child: Icon(
                        size: 30,
                        Icons.favorite_border,
                        color: AppColors.primaryColor,
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(height: height * 0.02),
              Row(
                children: [
                  CustomText(
                    text: args.title??"",
                    textStyle: AppStyles.bold20primary,
                  ),
                  Spacer(),
                  CustomText(
                    text: "EGP ${args.price}",
                    textStyle: AppStyles.bold18Black,
                  ),
                ],
              ),
              SizedBox(height: height * 0.015),
              Row(
                children: [
                  Container(
                    decoration: BoxDecoration(
                      border: Border.all(
                        color: AppColors.primaryColor,
                        width: 0.5,
                      ),
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Padding(
                      padding: EdgeInsets.symmetric(
                        horizontal: width * 0.02,
                        vertical: height * 0.01,
                      ),
                      child: CustomText(text: '${args.sold} Sold', textStyle: AppStyles.bold16Black,),
                    ),
                  ),
                  SizedBox(width: width * 0.02),
                  Icon(Icons.star, size: 25, color: AppColors.yellowColor),
                  CustomText(
                    text: "${args.ratingsAverage}  (${args.ratingsQuantity})",
                    textStyle: AppStyles.bold16Black,
                  ),
                  Spacer(),
                  AddOrDeleteItemWidget()
                ],
              ),
              SizedBox(height: height * 0.015),
              CustomText(text: "Description",
                  textStyle: AppStyles.bold18primary
              ),
              SizedBox(height: height * 0.01),
              ReadMoreText(
                args.description??"",
                style: AppStyles.medium15,
                trimExpandedText: "Read less",
                trimCollapsedText: "Read more",
                trimLines: 3,
                trimMode: TrimMode.Line,
              ),
              SizedBox(height: height * 0.015),
              Row(
                children: [
                  CustomText(text: "Total Price:",textStyle: AppStyles.bold20primary,),
                  SizedBox(width: width*0.03,),
                  CustomText(text: "EGP ${args.price}",
                    textStyle: AppStyles.bold18Black,),
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
                        Icon(Icons.add_shopping_cart,color: AppColors.whiteColor,
                        size: 30,),
                        CustomText(text: "  Add to cart",textStyle: AppStyles.bold20White,)
                      ],
                    )),
              )

            ],
          ),
        ),
      ),
    );
  }
}
