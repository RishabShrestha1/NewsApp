import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:newsapp_self/common/widgets/buttons/basic_app_elevated_button.dart';
import 'package:newsapp_self/core/config/assets/app_vectors.dart';
import 'package:newsapp_self/core/config/theme/app_colors.dart';
import 'package:newsapp_self/core/constants/screen_dimensions.dart';

class Welcomepage extends StatelessWidget {
  const Welcomepage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.all(24.0),
        child: Column(
          children: [
            Spacer(),
            //Welcome Widgets
            Padding(
              padding: EdgeInsets.all(76.0),
              child: SvgPicture.asset(
                AppVectors.logo,
              ),
            ),
            Text(
              'Congratulations',
              style: Theme.of(context).textTheme.displayMedium?.copyWith(
                    color: AppColors.darkmodeTitle,
                  ),
            ),
            SizedBox(
              height: 8.h,
            ),
            Text(
              'Your account is ready to use',
              style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                    color: AppColors.darkmodeBody,
                  ),
            ),
            const Spacer(),
            BasicAppElevatedButton(
              onPressed: () {},
              title: "Go To Homepage",
              width: deviceWidth - 48.w,
            ),
          ],
        ),
      ),
    );
  }
}
