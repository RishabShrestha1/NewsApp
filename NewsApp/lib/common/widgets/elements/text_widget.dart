import 'package:flutter/material.dart';

// ignore: must_be_immutable
class CustomTextWidget extends StatelessWidget {
  final String text;
  final double fontsize;
  final FontWeight fontweight;

  const CustomTextWidget(
      {super.key,
      required this.text,
      required this.fontsize,
      required this.fontweight});

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(
        fontSize: fontsize,
        fontWeight: fontweight,
        letterSpacing: 0.12,
      ),
    );
  }
}
