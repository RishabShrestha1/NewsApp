import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:newsapp_self/common/widgets/buttons/basic_app_elevated_button.dart';
import 'package:newsapp_self/common/widgets/buttons/basic_app_icon_button.dart';
import 'package:newsapp_self/core/config/assets/app_vectors.dart';
import 'package:newsapp_self/core/config/assets/app_icons.dart';
import 'package:newsapp_self/core/config/theme/app_colors.dart';

class ChooseModePage extends StatelessWidget {
  const ChooseModePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            const Spacer(),
            Center(
                child: SvgPicture.asset(
              AppVectors.logo,
            )),
            const Spacer(),
            const Center(
              child: Text('Choose Mode for The App',
                  style: TextStyle(fontSize: 20)),
            ),
            SizedBox(
              height: 100.h,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Column(
                  children: [
                    BasicAppIconButton(
                      onPressed: () {},
                      icon: Icon(AppIcons().darkmode),
                      iconSize: 50.h,
                      backgroundColor: AppColors.darkmodeBackground,
                      iconColor: AppColors.darkmodeTitle,
                      padding: 5,
                      highlightColor: AppColors.darkmodeTitle,
                    ),
                    SizedBox(
                      height: 20.h,
                    ),
                    const Text(
                      'Dark Mode',
                    )
                  ],
                ),
                SizedBox(
                  width: 80.w,
                ),
                Column(
                  children: [
                    BasicAppIconButton(
                      onPressed: () {},
                      icon: Icon(AppIcons().lightmode),
                      iconSize: 50.h,
                      backgroundColor: AppColors.lightmodeBackground,
                      iconColor: AppColors.black,
                      padding: 5,
                    ),
                    SizedBox(
                      height: 20.h,
                    ),
                    const Text(
                      'Light Mode',
                    )
                  ],
                ),
              ],
            ),
            SizedBox(
              height: 100.h,
            ),
            BasicAppElevatedButton(
              onPressed: () {},
              title: 'Get Started',
              width: 150.w,
              height: 50.h,
            ),
            const Spacer(),
          ],
        ),
      ),
    );
  }
}
