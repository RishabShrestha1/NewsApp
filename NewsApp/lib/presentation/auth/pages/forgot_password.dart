import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:newsapp_self/common/widgets/buttons/back_button.dart';
import 'package:newsapp_self/common/widgets/buttons/basic_app_elevated_button.dart';
import 'package:newsapp_self/core/constants/screen_dimensions.dart';
import 'package:newsapp_self/presentation/auth/Bloc/auth_bloc.dart';
import 'package:newsapp_self/presentation/auth/Bloc/auth_event.dart';
import 'package:newsapp_self/presentation/auth/Bloc/auth_state.dart';
import 'package:newsapp_self/presentation/auth/widgets/custom_title.dart';
import 'package:newsapp_self/presentation/auth/widgets/email_textfield.dart';

class ForgotpasswordPage extends StatelessWidget {
  ForgotpasswordPage({super.key});
  final TextEditingController emailcontroller = TextEditingController();

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
            } else if (state is ForgotPasswordSuccess) {
              showDialog(
                  context: context,
                  builder: (context) => AlertDialog(
                        title: const Text('Success!'),
                        content: const Text(
                            'Password reset email sent if the email is present!'),
                        actions: [
                          TextButton(
                            onPressed: () {
                              context.go('/signin');
                            },
                            child: const Text('OK'),
                          ),
                        ],
                      ));
            }
          },
          builder: (context, state) {
            return SafeArea(
              child: Padding(
                padding: const EdgeInsets.all(24.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    CustomBackButton(
                      onPressed: () {
                        context.goNamed('signin');
                      },
                    ),
                    SizedBox(
                      height: 16.h,
                    ),
                    _titletext(context),
                    SizedBox(
                      height: 5.h,
                    ),
                    _descriptiontext(context),
                    SizedBox(
                      height: 16.h,
                    ),
                    CustomEmailField(
                      econtroller: emailcontroller,
                    ),
                    SizedBox(
                      height: 48.h,
                    ),
                    const Spacer(), // Spacer to push the button down
                    _submitbutton(context),
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }

  Widget _titletext(BuildContext context) {
    return CustomTitleWidget(
      text: 'Forgot\nPassword?',
      style: Theme.of(context).textTheme.displayMedium,
    );
  }

  Widget _descriptiontext(BuildContext context) {
    return SizedBox(
      width: deviceWidth - 48.w,
      child: Text(
        'Don’t worry! it happens. Please enter the \nemail address associated with your account.',
        textAlign: TextAlign.justify,
        style: Theme.of(context).textTheme.bodyMedium?.copyWith(),
      ),
    );
  }

  Widget _submitbutton(BuildContext context) {
    return Center(
        child: BasicAppElevatedButton(
      onPressed: () {
        context
            .read<AuthBloc>()
            .add(ForgotPasswordEvent(email: emailcontroller.text.toString()));
      },
      title: 'Submit',
      width: deviceWidth - 48.w,
    ));
  }
}
