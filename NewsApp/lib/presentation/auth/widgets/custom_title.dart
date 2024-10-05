import 'package:flutter/material.dart';

class CustomTitleWidget extends StatelessWidget {
  final String text;
  final Color? color;
  const CustomTitleWidget({super.key, required this.text, this.color});

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: Theme.of(context).textTheme.displayLarge?.copyWith(
            color: color,
            fontWeight: FontWeight.w700,
          ),
    );
  }
}
