import 'package:cached_network_image/cached_network_image.dart';
import 'package:e_commerce_app2/core/utils/app_styles.dart';
import 'package:e_commerce_app2/domain/entities/Brand_response_entity.dart';
import 'package:e_commerce_app2/domain/entities/Category_Response_Entity.dart';
import 'package:flutter/material.dart';

import '../../../core/utils/app_colors.dart';

class CategoryItemWidget extends StatelessWidget {
  CategoryEntity? item;
  BrandEntity? brand;
  CategoryItemWidget({ this.item , this.brand});

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    return Column(
      children: [
        ClipRRect(
          borderRadius: BorderRadius.circular(15),
          child:
          CachedNetworkImage(
          fit: BoxFit.fill
          ,
            imageUrl: item?.image?? brand?.image??"",
            width: width*0.21,
            height: height*0.1,
            placeholder:(context ,url)=>
                CircularProgressIndicator(color: AppColors.primaryColor,),
            errorWidget: (context,url, error)=>
                Icon(Icons.error,color: AppColors.redColor,),
                 ),
        ),
      SizedBox(height: height*0.01,),
      Text(item?.name?? brand?.name??"" ,style: AppStyles.regular14Primary,maxLines: 1)
    ],);
  }
}
