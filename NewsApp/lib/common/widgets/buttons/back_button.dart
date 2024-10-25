import 'package:flutter/material.dart';
import 'package:newsapp_self/core/config/assets/app_icons.dart';

class CustomBackButton extends StatelessWidget {
  final VoidCallback? onPressed;
  const CustomBackButton({super.key, this.onPressed});

  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: onPressed,
      icon: Icon(
        AppIcons().backbutton,
      ),
      padding: EdgeInsets.zero,
      alignment: Alignment.centerLeft,
    );
  }
}
