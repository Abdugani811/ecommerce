import 'package:flutter/material.dart';
import 'package:splash_screen/presentation/ui/resourses/app_colors.dart';

abstract class AppStyles {
  static TextStyle getLogoTextStyle() => TextStyle(
    fontSize: 38,
    color: AppColors.primaryColor,
    fontWeight: FontWeight.w800,
    fontFamily: "BeVietnamPro",
  );

  static TextStyle getTextActionStyle() => TextStyle(
    fontSize: 18,
    color: AppColors.primaryColor,
    fontWeight: FontWeight.w700,
    fontFamily: "BeVietnamPro",
  );

  static TextStyle getOnboardingTitle() => TextStyle(
    fontSize: 26,
    color: AppColors.black,
    fontWeight: FontWeight.w700,
    fontFamily: "BeVietnamPro",
  );

  static TextStyle getOnboardingSubTitle() => TextStyle(
    fontSize: 18,
    fontFamily: "BeVietnamPro",
    color: AppColors.lightGray,
  );

  static TextStyle getLabelStyle() => TextStyle(
    fontSize: 16,
    fontWeight: FontWeight.w600,
    fontFamily: "BeVietnamPro",
    color: AppColors.black,
  );

  static TextStyle getPriceStyle() => TextStyle(
    fontSize: 16,
    fontWeight: FontWeight.w800,
    fontFamily: "BeVietnamPro",
    color: AppColors.primaryColor,
  );

  static TextStyle getContentStyle() => TextStyle(
    fontSize: 16,
    fontWeight: FontWeight.w500,
    fontFamily: "BeVietnamPro",
    color: Color(0xFFAAAAAA),
  );
}
