import 'package:flutter/material.dart';

class BasicAppIconButton extends StatelessWidget {
  final Icon icon;
  final VoidCallback onPressed;
  final Color? iconColor;
  final double? iconSize;
  final Color? disabledColor;
  final Color? splashColor;
  final Color? highlightColor;
  final Color? backgroundColor;
  final double? padding;
  const BasicAppIconButton({
    super.key,
    required this.icon,
    required this.onPressed,
    this.iconColor,
    this.iconSize,
    this.disabledColor,
    this.splashColor,
    this.highlightColor,
    this.backgroundColor,
    this.padding,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(padding ?? 0),
      decoration: BoxDecoration(
        color: backgroundColor,
        shape: BoxShape.circle,
      ),
      child: IconButton(
        onPressed: onPressed,
        icon: icon,
        color: iconColor ?? Colors.black,
        iconSize: iconSize ?? 24,
        disabledColor: disabledColor,
        splashColor: splashColor ?? Colors.grey,
        padding: EdgeInsets.zero,
        highlightColor: highlightColor ?? Colors.grey,
      ),
    );
  }
}
