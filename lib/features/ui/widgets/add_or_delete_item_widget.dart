import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../core/utils/app_colors.dart';
import '../../../core/utils/app_styles.dart';
import 'CustomText.dart';

class AddOrDeleteItemWidget extends StatefulWidget {
  @override
  State<AddOrDeleteItemWidget> createState() => _AddOrDeleteItemWidgetState();
}

class _AddOrDeleteItemWidgetState extends State<AddOrDeleteItemWidget> {
int productCounter =1 ;
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: AppColors.primaryColor,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          IconButton(onPressed: (){
            --productCounter;
            setState(() {

            });
          },
              icon: Icon(Icons.remove_circle_outline,color: AppColors.whiteColor,)),
          CustomText(
            text: productCounter.toString(),
            textStyle: AppStyles.regular18White,
          ),
          IconButton(onPressed: (){
            setState(() {
              productCounter++;
            });
          },
              icon: Icon(Icons.add_circle_outline,
                color: AppColors.whiteColor,)),
        ],
      ),
    );
  }
}
