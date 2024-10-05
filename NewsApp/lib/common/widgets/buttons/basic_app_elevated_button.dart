import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

class BasicAppElevatedButton extends StatelessWidget {
  final VoidCallback onPressed;
  final String title;
  final Color? textColor;
  final double? height;
  final double? width;
  final double? radius;
  final Color? customBackgroundColor;
  final String? icon;

  const BasicAppElevatedButton({
    super.key,
    required this.onPressed,
    required this.title,
    this.textColor,
    this.height,
    this.width,
    this.radius,
    this.icon,
    this.customBackgroundColor,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        minimumSize: Size(width ?? 150.w, height ?? 50.h),
        maximumSize: Size(width ?? 170.w, height ?? 50.h),
        backgroundColor: customBackgroundColor,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(radius ?? 10.r),
        ),
      ),
      onPressed: onPressed,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          if (icon != null) ...[
            SvgPicture.asset(icon!),
            SizedBox(width: 10.w),
          ],
          Flexible(
            child: Text(
              title,
              style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                    color: textColor ?? Colors.white,
                  ),
            ),
          ),
        ],
      ),
    );
  }
}
