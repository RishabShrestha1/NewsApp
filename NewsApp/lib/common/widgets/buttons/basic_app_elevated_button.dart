import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class BasicAppElevatedButton extends StatelessWidget {
  final VoidCallback onPressed;
  final String title;
  final Color? textColor;
  final double? height;
  final double? width;
  final double? radius;
  const BasicAppElevatedButton({
    super.key,
    required this.onPressed,
    required this.title,
    this.textColor,
    this.height,
    this.width,
    this.radius,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        minimumSize: Size(width ?? 150.w, height ?? 50.h),
        maximumSize: Size(width ?? 150.w, height ?? 50.h),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(radius ?? 10.r),
        ),
      ),
      onPressed: onPressed,
      child: Text(
        title,
        style: TextStyle(
          color: textColor,
        ),
      ),
    );
  }
}
