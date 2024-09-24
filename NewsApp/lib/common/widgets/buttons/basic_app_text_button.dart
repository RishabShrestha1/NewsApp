import 'package:flutter/material.dart';

class BasicAppTextButton extends StatelessWidget {
  final VoidCallback? onPressed;
  final String? title;
  const BasicAppTextButton({
    super.key,
    required this.onPressed,
    required this.title,
  });

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: onPressed!,
      child: Text(
        title ?? 'No TITLE',
        style: const TextStyle(color: Color(0xFFB0B3B8)),
      ),
    );
  }
}
