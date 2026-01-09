import 'dart:ui';
import 'package:flutter/src/painting/text_style.dart';
import 'package:google_fonts/google_fonts.dart';
import 'app_colors.dart';

class AppStyles {
  static TextStyle regular12Text = GoogleFonts.poppins(
    fontSize: 12,
    fontWeight: FontWeight.w400,
    color: AppColors.primaryDark,
  );
  static TextStyle regular11SalePrice = GoogleFonts.poppins(
    fontSize: 11,
    fontWeight: FontWeight.w400,
    color: AppColors.primaryDark,
  );
  static TextStyle regular14Text = GoogleFonts.poppins(
    fontSize: 14,
    fontWeight: FontWeight.w400,
    color: AppColors.primaryDark,
  );
  static TextStyle regular18White = GoogleFonts.poppins(
    fontSize: 18,
    fontWeight: FontWeight.w400,
    color: AppColors.whiteColor,
  );static TextStyle semiBold24White = GoogleFonts.poppins(
    fontSize: 20,
    fontWeight: FontWeight.bold,
    color: AppColors.whiteColor,
  );
  static TextStyle light14SearchHint = GoogleFonts.poppins(
    fontSize: 14,
    fontWeight: FontWeight.w300,
    color: AppColors.searchHintColor,
  );
  static TextStyle light16White = GoogleFonts.poppins(
    fontSize: 16,
    fontWeight: FontWeight.w300,
    color: AppColors.whiteColor,
  );static TextStyle Mediam16Grey = GoogleFonts.inter(
      fontSize:16 ,fontWeight: FontWeight.w500,color: AppColors.greyColor
  );
  static TextStyle bold20primary = GoogleFonts.inter(
      fontSize:20 ,fontWeight: FontWeight.bold,color: AppColors.primaryColor
  );
  static TextStyle bold16primary = GoogleFonts.inter(
      fontSize:16 ,fontWeight: FontWeight.bold,color: AppColors.primaryColor
  );
}
