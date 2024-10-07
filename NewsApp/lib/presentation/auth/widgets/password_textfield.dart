import 'package:flutter/material.dart';
import 'package:newsapp_self/common/widgets/inputfield/custom_primary_input_field.dart';
import 'package:newsapp_self/core/config/assets/app_icons.dart';

class CustomPasswordField extends StatelessWidget {
  const CustomPasswordField({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomInputField(
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
    );
  }
}
