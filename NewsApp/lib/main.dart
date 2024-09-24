import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:newsapp_self/core/config/theme/app_theme.dart';
import 'package:newsapp_self/core/constants/routes.dart';
import 'package:newsapp_self/core/constants/screen_dimensions.dart';

void main() {
  runApp(const NewsApp());
}

class NewsApp extends StatelessWidget {
  const NewsApp({super.key});

  @override
  Widget build(BuildContext context) {
    deviceHeight = MediaQuery.of(context).size.height;
    deviceWidth = MediaQuery.of(context).size.width;
    return ScreenUtilInit(
      designSize: Size(deviceWidth, deviceHeight),
      builder: (context, child) {
        return MaterialApp.router(
          title: 'News App',
          debugShowCheckedModeBanner: false,
          theme: AppTheme.lightTheme,
          routerConfig: approutes,
        );
      },
    );
  }
}
