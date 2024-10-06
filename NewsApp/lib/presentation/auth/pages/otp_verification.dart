import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:newsapp_self/common/widgets/buttons/back_button.dart';
import 'package:newsapp_self/common/widgets/buttons/basic_app_elevated_button.dart';
import 'package:newsapp_self/core/constants/screen_dimensions.dart';

class OtpVerificationPage extends StatelessWidget {
  const OtpVerificationPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(24.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Align(
                alignment: Alignment.centerLeft,
                child: CustomBackButton(
                  onPressed: () {},
                ),
              ),
              SizedBox(height: 27.h),
              Text(
                'OTP Verification',
                style: Theme.of(context).textTheme.displayMedium?.copyWith(
                      fontWeight: FontWeight.w700,
                    ),
              ),
              SizedBox(height: 8.h),
              Text(
                'Enter the 4-digit code sent to +91 9876543210',
                style: Theme.of(context).textTheme.bodyMedium?.copyWith(),
              ),
              SizedBox(height: 27.h),
              //OTP FIELD
              SizedBox(
                height: 27.h,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Resend Code in ',
                    style: Theme.of(context).textTheme.bodySmall?.copyWith(),
                  ),
                ],
              ),
              const Spacer(),
              BasicAppElevatedButton(
                onPressed: () {},
                title: 'Verify',
                width: deviceWidth - 48.w,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
