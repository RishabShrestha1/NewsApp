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
      displayLarge: TextStyle(
        fontSize: fontSize48,
        fontWeight: FontWeight.w400,
        color: AppColors.grayscaleTitleActive,
      ),
      displayMedium: TextStyle(
        fontSize: fontSize32,
        fontWeight: FontWeight.w400,
        color: AppColors.grayscaleBodyText,
      ),
      displaySmall: TextStyle(
        fontSize: fontSize24,
        fontWeight: FontWeight.w400,
        color: AppColors.grayscaleTitleActive,
      ),
      bodyLarge: TextStyle(
        fontSize: fontSize20,
        fontWeight: FontWeight.w400,
        color: AppColors.grayscaleBodyText,
      ),
      bodyMedium: TextStyle(
        fontSize: fontSize16,
        fontWeight: FontWeight.w600,
        color: AppColors.grayscaleBodyText,
      ),
      bodySmall: TextStyle(
        fontSize: fontSize14,
        fontWeight: FontWeight.w400,
        color: AppColors.grayscaleBodyText,
      ),
    ),
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
          borderRadius: BorderRadius.circular(6.0.r),
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
      displayLarge: TextStyle(
        fontSize: fontSize48,
        fontWeight: FontWeight.w400,
        color: AppColors.darkmodeTitle,
      ),
      displayMedium: TextStyle(
        fontSize: fontSize32,
        fontWeight: FontWeight.w400,
        color: AppColors.darkmodeTitle,
      ),
      displaySmall: TextStyle(
        fontSize: fontSize24,
        fontWeight: FontWeight.w400,
        color: AppColors.darkmodeTitle,
      ),
      bodyLarge: TextStyle(
        fontSize: fontSize20,
        fontWeight: FontWeight.w400,
        color: AppColors.darkmodeBody,
      ),
      bodyMedium: TextStyle(
        fontSize: fontSize16,
        fontWeight: FontWeight.w600,
        color: AppColors.darkmodeBody,
      ),
      bodySmall: TextStyle(
        fontSize: fontSize14,
        fontWeight: FontWeight.w400,
        color: AppColors.darkmodeBody,
      ),
    ),
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
