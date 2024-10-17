import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:newsapp_self/common/widgets/buttons/basic_app_elevated_button.dart';
import 'package:newsapp_self/core/config/assets/app_vectors.dart';
import 'package:newsapp_self/core/config/theme/app_colors.dart';
import 'package:newsapp_self/core/constants/screen_dimensions.dart';
import 'package:newsapp_self/data/models/auth/signin_user_req.dart';
import 'package:newsapp_self/domain/usecases/auth/signin.dart';
import 'package:newsapp_self/presentation/auth/widgets/custom_title.dart';
import 'package:newsapp_self/presentation/auth/widgets/email_textfield.dart';
import 'package:newsapp_self/presentation/auth/widgets/facebook_auth.dart';
import 'package:newsapp_self/presentation/auth/widgets/google_auth.dart';
import 'package:newsapp_self/service_locator.dart';

import '../widgets/password_textfield.dart';

class SigninPage extends StatelessWidget {
  SigninPage({super.key});
  final TextEditingController emailcontroller = TextEditingController();
  final TextEditingController passwordcontroller = TextEditingController();

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
                const SizedBox(height: 10),
                _titletext2(),
                const SizedBox(height: 5),
                _descriptiontext(context),
                const SizedBox(height: 48),
                CustomEmailField(
                  econtroller: emailcontroller,
                ),
                CustomPasswordField(
                  pcontroller: passwordcontroller,
                ),
                const SizedBox(height: 8),
                _saveAndforgotpassword(context),
                const SizedBox(height: 16),
                _loginbutton(context),
                const SizedBox(height: 16),
                _orcontinuewith(context),
                const SizedBox(height: 16),
                _alternativeLogin(),
                const SizedBox(height: 16),
                _donthaveanaccount(context),
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
    );
  }

  Widget _titletext2() {
    return const CustomTitleWidget(
      text: 'Again!',
      color: AppColors.primaryDefault,
    );
  }

  Widget _descriptiontext(BuildContext context) {
    return SizedBox(
      width: 230.w,
      child: Text(
        'Welcome back you\'ve been missed!',
        style: Theme.of(context).textTheme.bodyLarge?.copyWith(),
      ),
    );
  }

  Widget _loginbutton(BuildContext context) {
    return BasicAppElevatedButton(
      onPressed: () async {
        var result = await sl<SigninUseCase>().call(
          params: SigninUserReq(
            email: emailcontroller.text.toString(),
            password: passwordcontroller.text.toString(),
          ),
        );

        result.fold((l) {
          var snackBar = SnackBar(
            content: Text(l,
                style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                      color: AppColors.black,
                    )),
            behavior: SnackBarBehavior.floating,
            margin: const EdgeInsets.all(16),
          );
          ScaffoldMessenger.of(context).showSnackBar(snackBar);
        }, (r) {
          context.go('/welcomepage');
        });
      },
      title: 'Login',
      width: deviceWidth - 48.w,
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

  Widget _saveAndforgotpassword(BuildContext context) {
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
    );
  }

  Widget _donthaveanaccount(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          'Don\'t have an account ? ',
          style: Theme.of(context).textTheme.bodySmall,
        ),
        GestureDetector(
          onTap: () {
            context.go('/signup');
          },
          child: Text(
            'Sign up',
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
