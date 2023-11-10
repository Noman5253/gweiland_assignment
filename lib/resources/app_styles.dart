import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gweiland/resources/app_colors.dart';

import 'app_fonts.dart';

class AppStyles {
  static TextStyle? interMediumStyle(
      {double? fontSize = 16, Color? color = AppColors.blackColor}) {
    return TextStyle(
        fontSize: fontSize!.sp, color: color, fontFamily: AppFonts.interMedium);
  }

  static TextStyle? interSemiBoldStyle(
      {double? fontSize = 15, Color? color = AppColors.blackColor,TextOverflow? textOverflow}) {
    return TextStyle(
        fontSize: fontSize!.sp, color: color, fontFamily: AppFonts.interSemiBold, overflow: textOverflow);
  }

  static TextStyle? interBoldStyle(
      {double? fontSize = 15, Color? color = AppColors.blackColor}) {
    return TextStyle(
        fontSize: fontSize!.sp, color: color, fontFamily: AppFonts.interBold);
  }
}