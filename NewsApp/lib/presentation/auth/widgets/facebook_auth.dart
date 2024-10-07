import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:newsapp_self/common/widgets/buttons/basic_app_elevated_button.dart';
import 'package:newsapp_self/core/config/assets/app_vectors.dart';
import 'package:newsapp_self/core/config/theme/app_colors.dart';
import 'package:newsapp_self/core/constants/screen_dimensions.dart';

class FacebookButton extends StatelessWidget {
  const FacebookButton({super.key});

  @override
  Widget build(BuildContext context) {
    return BasicAppElevatedButton(
      onPressed: () {},
      title: 'Facebook',
      icon: AppVectors.facebooklogo,
      width: deviceWidth / 2 - 40.w,
      textColor: AppColors.grayscaleButtonText,
      customBackgroundColor: AppColors.grayscaleSecondaryButton,
    );
  }
}
