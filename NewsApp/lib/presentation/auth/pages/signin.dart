import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:newsapp_self/common/widgets/buttons/basic_app_elevated_button.dart';
import 'package:newsapp_self/core/config/theme/app_colors.dart';
import 'package:newsapp_self/presentation/auth/Bloc/auth_bloc.dart';
import 'package:newsapp_self/presentation/auth/Bloc/auth_event.dart';
import 'package:newsapp_self/presentation/auth/Bloc/auth_state.dart';
import 'package:newsapp_self/presentation/auth/widgets/custom_title.dart';
import 'package:newsapp_self/presentation/auth/widgets/email_textfield.dart';
import 'package:newsapp_self/presentation/auth/widgets/facebook_auth.dart';
import 'package:newsapp_self/presentation/auth/widgets/google_auth.dart';
import 'package:newsapp_self/presentation/auth/widgets/password_textfield.dart';

class SigninPage extends StatelessWidget {
  SigninPage({super.key});
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocProvider(
        create: (context) => AuthBloc(),
        child: BlocConsumer<AuthBloc, AuthState>(
          listener: (context, state) {
            if (state is AuthFailure) {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(content: Text(state.error)),
              );
            } else if (state is AuthSuccess) {
              context.go('/welcomepage');
            }
          },
          builder: (context, state) {
            if (state is AuthLoading) {
              return const Center(
                  child:
                      CircularProgressIndicator()); // Show loader during authentication
            }
            return SingleChildScrollView(
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
                        econtroller: emailController,
                      ),
                      CustomPasswordField(
                        pcontroller: passwordController,
                      ),
                      const SizedBox(height: 8),
                      _saveAndforgotpassword(context),
                      const SizedBox(height: 16),
                      _loginButton(context),
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
            );
          },
        ),
      ),
    );
  }

  Widget _loginButton(BuildContext context) {
    return BasicAppElevatedButton(
      onPressed: () {
        context.read<AuthBloc>().add(SignInEvent(
              email: emailController.text,
              password: passwordController.text,
            ));
      },
      title: 'Login',
      width: MediaQuery.of(context).size.width - 48,
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
