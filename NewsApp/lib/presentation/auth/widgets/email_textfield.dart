import 'package:flutter/material.dart';
import 'package:newsapp_self/common/widgets/inputfield/custom_primary_input_field.dart';
import 'package:newsapp_self/domain/validators/userdetails_textfield_validation.dart';

class CustomEmailField extends StatelessWidget {
  final TextEditingController econtroller;
  const CustomEmailField({super.key, required this.econtroller});

  @override
  Widget build(BuildContext context) {
    return CustomInputField(
      labelText: 'Email',
      controller: econtroller,
      validator: (value) {
        if (value!.isEmpty) {
          return 'Email cannot be empty';
        }
        if (!UserCredentialValidation.isEmail(value)) {
          return 'Invalid Email';
        }
        return null;
      },
    );
  }
}
