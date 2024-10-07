import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:newsapp_self/common/widgets/buttons/back_button.dart';
import 'package:newsapp_self/common/widgets/buttons/basic_app_elevated_button.dart';
import 'package:newsapp_self/core/constants/screen_dimensions.dart';
import 'package:newsapp_self/presentation/auth/widgets/custom_title.dart';

class ForgotpasswordPage extends StatelessWidget {
  const ForgotpasswordPage({super.key});

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
                //TODO:Make the forgot password page similar to the UI
                CustomBackButton(
                  onPressed: () {},
                ),
                SizedBox(
                  height: 16.h,
                ),
                CustomTitleWidget(
                  text: 'Forgot\nPassword?',
                  style: Theme.of(context).textTheme.displayMedium,
                ),
                SizedBox(
                  height: 5.h,
                ),
                SizedBox(
                  width: deviceWidth - 48.w,
                  child: Flexible(
                    child: Text(
                      'Don’t worry! it happens. Please select the \n email or number associated with your account.',
                      textAlign: TextAlign.justify,
                      style: Theme.of(context).textTheme.bodyMedium?.copyWith(),
                    ),
                  ),
                ),
                SizedBox(
                  height: 48.h,
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
              ],
            ),
          ),
        ),
      ),
    );
  }
}
