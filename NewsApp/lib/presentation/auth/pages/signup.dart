import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:newsapp_self/common/widgets/buttons/basic_app_elevated_button.dart';
import 'package:newsapp_self/core/config/assets/app_vectors.dart';
import 'package:newsapp_self/core/config/theme/app_colors.dart';
import 'package:newsapp_self/core/constants/screen_dimensions.dart';
import 'package:newsapp_self/data/models/auth/create_user_req.dart';
import 'package:newsapp_self/domain/usecases/auth/signup.dart';
import 'package:newsapp_self/presentation/auth/widgets/custom_title.dart';
import 'package:newsapp_self/presentation/auth/widgets/email_textfield.dart';
import 'package:newsapp_self/presentation/auth/widgets/facebook_auth.dart';
import 'package:newsapp_self/presentation/auth/widgets/google_auth.dart';
import 'package:newsapp_self/presentation/auth/widgets/password_textfield.dart';
import 'package:newsapp_self/service_locator.dart';

class SignupPage extends StatelessWidget {
  SignupPage({super.key});
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

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
                _titletext(),
                const SizedBox(height: 5),
                _descriptiontext(context),
                const SizedBox(height: 48),
                //Email Field and Password
                CustomEmailField(
                  econtroller: emailController,
                ),
                CustomPasswordField(
                  pcontroller: passwordController,
                ),
                const SizedBox(height: 8),
                _savepassword(context),
                const SizedBox(height: 16),
                _signupbutton(context),
                const SizedBox(height: 16),
                _orcontinuewith(context),
                const SizedBox(height: 16),
                _alternativeLogin(),
                const SizedBox(height: 16),
                _alreadyhaveanaccount(context),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _titletext() {
    return const CustomTitleWidget(
      text: 'Hello',
      color: AppColors.primaryDefault,
    );
  }

  Widget _descriptiontext(BuildContext context) {
    return SizedBox(
      width: 230.w,
      child: Text(
        'Signup to get Started',
        style: Theme.of(context).textTheme.bodyLarge?.copyWith(),
      ),
    );
  }

  Widget _savepassword(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Checkbox(
          value: true,
          onChanged: (value) {},
          fillColor: WidgetStateProperty.all(AppColors.primaryDefault),
        ),
        Text(
          'Remember me',
          style: Theme.of(context).textTheme.bodySmall,
        ),
      ],
    );
  }

  Widget _signupbutton(BuildContext context) {
    return Center(
      child: BasicAppElevatedButton(
        onPressed: () async {
          var result = await sl<SignupUseCase>().call(
            params: CreateUserReq(
              email: emailController.text.toString(),
              password: passwordController.text.toString(),
            ),
          );
          result.fold(
            (l) {
              var snackBar = SnackBar(
                content: Text(l),
                behavior: SnackBarBehavior.floating,
              );
              ScaffoldMessenger.of(context).showSnackBar(snackBar);
            },
            (r) {
              context.go('/welcomepage');
            },
          );
        },
        title: 'Signup',
        width: deviceWidth - 48.w,
      ),
    );
  }

  Widget _orcontinuewith(BuildContext context) {
    return Center(
      child: Text(
        'or continue with',
        style: Theme.of(context).textTheme.bodySmall,
      ),
    );
  }

  Widget _alternativeLogin() {
    return const Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        FacebookButton(),
        Spacer(),
        GoogleAuthButton(),
      ],
    );
  }

  Widget _alreadyhaveanaccount(BuildContext context) {
    return Row(
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
    );
  }
}
