import 'dart:ffi';

import 'package:flutter/material.dart';

class BasicAppButton extends StatelessWidget {
  final VoidCallback onPressed;
  final String text;
  final Color? textColor;
  const BasicAppButton({
    super.key,
    required this.onPressed,
    required this.text,
    this.textColor,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      child: Text(
        text,
        style: TextStyle(
          color: textColor,
        ),
      ),
    );
  }
}
