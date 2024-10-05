import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:newsapp_self/common/widgets/buttons/basic_app_elevated_button.dart';
import 'package:newsapp_self/common/widgets/inputfield/custom_primary_input_field.dart';
import 'package:newsapp_self/core/config/assets/app_icons.dart';
import 'package:newsapp_self/core/config/assets/app_vectors.dart';
import 'package:newsapp_self/core/config/theme/app_colors.dart';
import 'package:newsapp_self/core/constants/screen_dimensions.dart';
import 'package:newsapp_self/domain/validators/userdetails_textfield_validation.dart';
import 'package:newsapp_self/presentation/auth/widgets/custom_title.dart';

class SignupPage extends StatelessWidget {
  const SignupPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(24.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const CustomTitleWidget(
                  text: 'Hello',
                  color: AppColors.primaryDefault,
                ),
                SizedBox(
                  height: 5.h,
                ),
                SizedBox(
                  width: 230.w,
                  child: Text(
                    'Signup to get Started',
                    style: Theme.of(context).textTheme.bodyLarge?.copyWith(),
                  ),
                ),
                SizedBox(
                  height: 48.h,
                ),
                CustomInputField(
                  labelText: 'Email',
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'Email cannot be empty';
                    }
                    if (!UserCredentialValidation.isEmail(value)) {
                      return 'Invalid Email';
                    }
                    return null;
                  },
                ),
                CustomInputField(
                  labelText: 'Password',
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
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Checkbox(
                      value: true,
                      onChanged: (value) {},
                      fillColor:
                          WidgetStateProperty.all(AppColors.primaryDefault),
                    ),
                    Text(
                      'Remember me',
                      style: Theme.of(context).textTheme.bodySmall,
                    ),
                    const Spacer(),
                    GestureDetector(
                      onTap: () {
                        context.go('/forgotpassword');
                      },
                      child: Text(
                        'Forget Password ?',
                        style: Theme.of(context)
                            .textTheme
                            .bodySmall
                            ?.copyWith(color: AppColors.primaryDefault),
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 16.h,
                ),
                Center(
                  child: BasicAppElevatedButton(
                    onPressed: () {},
                    title: 'Login',
                    width: deviceWidth - 48.w,
                  ),
                ),
                SizedBox(
                  height: 16.h,
                ),
                Center(
                  child: Text(
                    'or continue with',
                    style: Theme.of(context).textTheme.bodySmall,
                  ),
                ),
                SizedBox(
                  height: 16.h,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    BasicAppElevatedButton(
                      onPressed: () {},
                      title: 'Facebook',
                      icon: AppVectors.facebooklogo,
                      width: deviceWidth / 2 - 40.w,
                      textColor: AppColors.grayscaleButtonText,
                      customBackgroundColor: AppColors.grayscaleSecondaryButton,
                    ),
                    Spacer(),
                    BasicAppElevatedButton(
                      onPressed: () {},
                      title: 'Google',
                      width: deviceWidth / 2 - 40.w,
                      icon: AppVectors.googlelogo,
                      textColor: AppColors.grayscaleButtonText,
                      customBackgroundColor: AppColors.grayscaleSecondaryButton,
                    ),
                  ],
                ),
                SizedBox(
                  height: 16.h,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'Already have an account ? ',
                      style: Theme.of(context).textTheme.bodySmall,
                    ),
                    GestureDetector(
                      onTap: () {
                        context.go('/signin');
                      },
                      child: Text(
                        'Login',
                        style: Theme.of(context)
                            .textTheme
                            .bodySmall
                            ?.copyWith(color: AppColors.primaryDefault),
                      ),
                    ),
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
