import 'package:flutter/material.dart';
import 'package:newsapp_self/core/config/theme/app_colors.dart';

// ignore: must_be_immutable
class CustomTextWidget extends StatelessWidget {
  final String text;
  final double fontsize;
  final FontWeight fontweight;
  Color? selectedcolour;

  CustomTextWidget(
      {super.key,
      required this.text,
      required this.fontsize,
      required this.fontweight});
  CustomTextWidget.selectedcolour(
      {super.key,
      required this.text,
      required this.fontsize,
      required this.fontweight,
      required this.selectedcolour});

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(
        fontSize: fontsize,
        fontWeight: fontweight,
        letterSpacing: 0.12,
        color: selectedcolour ?? AppColors.graybodytext,
      ),
    );
  }
}
