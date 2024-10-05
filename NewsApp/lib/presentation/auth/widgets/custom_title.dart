import 'package:flutter/material.dart';

class CustomTitleWidget extends StatelessWidget {
  final String text;
  final Color? color;
  final TextStyle? style;
  const CustomTitleWidget(
      {super.key, required this.text, this.color, this.style});

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: style ??
          Theme.of(context).textTheme.displayLarge?.copyWith(
                color: color,
                fontWeight: FontWeight.w700,
              ),
    );
  }
}
