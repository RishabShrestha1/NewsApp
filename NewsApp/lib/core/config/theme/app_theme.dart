import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:newsapp_self/core/config/theme/app_colors.dart';
import 'package:newsapp_self/core/constants/font_size.dart';

class AppTheme {
  static final lightTheme = ThemeData(
    brightness: Brightness.light,
    primaryColor: AppColors.primaryDefault,
    scaffoldBackgroundColor: AppColors.lightmodeBackground,
    bottomSheetTheme: const BottomSheetThemeData(
      backgroundColor: AppColors.lightmodeBackground,
    ),
    fontFamily: 'Poppins',
    textTheme: TextTheme(
        titleMedium: TextStyle(
          fontSize: fontSize30,
          fontWeight: FontWeight.w600,
          color: AppColors.grayscaleBodyText,
        ),
        bodyMedium: TextStyle(
          fontSize: fontSize16,
          fontWeight: FontWeight.w600,
          color: AppColors.grayscaleBodyText,
        )),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        backgroundColor: AppColors.primaryDefault,
        foregroundColor: AppColors.grayscaleWhite,
        textStyle: TextStyle(
          color: AppColors.grayscaleWhite,
          fontSize: fontSize16,
          fontWeight: FontWeight.w600,
        ),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(6.0),
        ),
      ),
    ),
  );
  static final darktTheme = ThemeData(
    brightness: Brightness.dark,
    primaryColor: AppColors.primaryDefault,
    scaffoldBackgroundColor: AppColors.darkmodeBackground,
    fontFamily: 'Poppins',
    textTheme: TextTheme(
        titleMedium: TextStyle(
          fontSize: fontSize30,
          fontWeight: FontWeight.w600,
          color: AppColors.darkmodeTitle,
        ),
        bodyMedium: TextStyle(
          fontSize: fontSize16,
          fontWeight: FontWeight.w600,
          color: AppColors.darkmodeBody,
        )),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        backgroundColor: AppColors.primaryDefault,
        foregroundColor: AppColors.grayscaleWhite,
        textStyle: TextStyle(
          color: AppColors.grayscaleWhite,
          fontSize: fontSize16,
        ),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(6.0.r),
        ),
      ),
    ),
  );
}
