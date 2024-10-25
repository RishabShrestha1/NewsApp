import 'package:flutter/material.dart';

class CustomLabelWidget extends StatelessWidget {
  final String label;
  const CustomLabelWidget({super.key, required this.label});

  @override
  Widget build(BuildContext context) {
    return Text(
      label,
      style: Theme.of(context).textTheme.bodySmall?.copyWith(),
    );
  }
}
