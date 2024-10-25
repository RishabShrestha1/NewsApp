import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:newsapp_self/common/widgets/buttons/basic_app_elevated_button.dart';
import 'package:newsapp_self/core/config/assets/app_vectors.dart';
import 'package:newsapp_self/core/config/theme/app_colors.dart';
import 'package:newsapp_self/core/constants/screen_dimensions.dart';

class GoogleAuthButton extends StatelessWidget {
  final VoidCallback? onPressed;
  const GoogleAuthButton({super.key, this.onPressed});

  @override
  Widget build(BuildContext context) {
    return BasicAppElevatedButton(
      onPressed: onPressed ?? () {},
      title: 'Google',
      width: deviceWidth / 2 - 40.w,
      icon: AppVectors.googlelogo,
      textColor: AppColors.grayscaleButtonText,
      customBackgroundColor: AppColors.grayscaleSecondaryButton,
    );
  }
}
