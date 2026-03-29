import 'dart:ui';

import 'package:auto_size_text/auto_size_text.dart';
import 'package:e_commerce_app2/core/utils/app_colors.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CustomText extends StatelessWidget {
  final Color? fontColor;
  final String text;
  final double? fontSize;
  final TextStyle? textStyle;
  final FontWeight? fontWeight;

  CustomText({this.fontWeight,this.fontSize,this.fontColor,required this.text,this.textStyle});

  @override
  Widget build(BuildContext context) {
    return AutoSizeText(
      text ,
      maxLines: 1,
      overflow: TextOverflow.ellipsis,
      style: textStyle ??
      Theme.of(context).textTheme.titleMedium?.copyWith(
        color: fontColor?? AppColors.primaryColor,
        fontWeight: fontWeight?? FontWeight.w500,
        fontSize: fontSize ?? 18
      )
      ,
    );
  }
}
