import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:iconsax/iconsax.dart';

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
      crossAxisAlignment:
          CrossAxisAlignment.start, // Ensure content starts at the left
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
        TextFormField(
          validator: widget.validator,
          controller: widget.controller,
          obscureText: widget.isObscure ? !isViewed : false,
          readOnly: widget.readOnly!,
          textAlign: TextAlign.start,
          style: Theme.of(context).textTheme.bodySmall,
          decoration: InputDecoration(
            prefixIcon:
                widget.prefixIcon != null ? Icon(widget.prefixIcon) : null,
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
      ],
    );
  }
}
