import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:newsapp_self/common/widgets/buttons/back_button.dart';
import 'package:newsapp_self/common/widgets/buttons/basic_app_elevated_button.dart';
import 'package:newsapp_self/common/widgets/inputfield/custom_primary_input_field.dart';
import 'package:newsapp_self/core/config/assets/app_icons.dart';
import 'package:newsapp_self/core/config/theme/app_colors.dart';
import 'package:newsapp_self/core/constants/screen_dimensions.dart';

class ResetPasswordPage extends StatelessWidget {
  const ResetPasswordPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(24.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CustomBackButton(
                onPressed: () {},
              ),
              SizedBox(height: 24.h),
              Text(
                'Reset\nPassword',
                style: Theme.of(context).textTheme.displayMedium?.copyWith(
                      color: AppColors.darkmodeBody,
                      fontWeight: FontWeight.w700,
                    ),
              ),
              SizedBox(height: 24.h),
              CustomInputField(
                labelText: 'New Password',
                isObscure: true,
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Password cannot be empty';
                  }
                  if (value.length < 6) {
                    return 'Password must be at least 6 characters';
                  }
                  return null;
                },
                suffixIcon: AppIcons().passwordPrefixIcon,
              ),
              SizedBox(height: 24.h),
              CustomInputField(
                labelText: 'Confirm New Password',
                isObscure: true,
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Password cannot be empty';
                  }
                  if (value.length < 6) {
                    return 'Password must be at least 6 characters';
                  }
                  return null;
                },
                suffixIcon: AppIcons().passwordPrefixIcon,
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
      ),
    );
  }
}
