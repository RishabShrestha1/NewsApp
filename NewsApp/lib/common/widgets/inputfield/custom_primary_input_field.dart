import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:iconsax/iconsax.dart';
import 'package:newsapp_self/core/constants/screen_dimensions.dart';

class CustomInputField extends StatefulWidget {
  final String labelText;
  final bool isObscure;
  final String? Function(String?)? validator;
  final TextEditingController? controller;
  final bool? readOnly;
  final IconData? prefixIcon;
  final IconData? suffixIcon;

  const CustomInputField({
    super.key,
    required this.labelText,
    this.isObscure = false,
    this.validator,
    this.controller,
    this.readOnly = false,
    this.prefixIcon,
    this.suffixIcon,
  });

  @override
  State<CustomInputField> createState() => _CustomInputFieldState();
}

class _CustomInputFieldState extends State<CustomInputField> {
  bool isViewed = false;

  @override
  Widget build(BuildContext context) {
    return Column(
      // mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Text(
              widget.labelText,
              style: Theme.of(context).textTheme.bodySmall,
            ),
            const Text(
              ' *',
              style: TextStyle(color: Colors.red),
            )
          ],
        ),
        SizedBox(height: 4.h),
        Container(
          margin: EdgeInsetsDirectional.only(bottom: deviceHeight * 0.02),
          child: TextFormField(
            validator: widget.validator,
            controller: widget.controller,
            obscureText: widget.isObscure ? !isViewed : false,
            readOnly: widget.readOnly!,
            decoration: InputDecoration(
              labelStyle: const TextStyle(color: Colors.black),
              floatingLabelBehavior: FloatingLabelBehavior.always,
              floatingLabelStyle: const TextStyle(
                color: Colors.black,
              ),
              floatingLabelAlignment: FloatingLabelAlignment.start,
              prefixIcon: Icon(
                widget.prefixIcon,
              ),
              suffixIcon: widget.isObscure
                  ? IconButton(
                      onPressed: () {
                        setState(() {
                          isViewed = !isViewed;
                        });
                      },
                      icon: isViewed
                          ? const Icon(Iconsax.eye)
                          : const Icon(Iconsax.eye_slash),
                    )
                  : null,
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
