import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:newsapp_self/common/widgets/buttons/basic_app_elevated_button.dart';
import 'package:newsapp_self/common/widgets/buttons/basic_app_text_button.dart';

class NavigationPanel extends StatefulWidget {
  final PageController controller;
  final VoidCallback onPreviousPressed;
  final VoidCallback onNextPressed;
  final double finalpage;

  const NavigationPanel({
    super.key,
    required this.onPreviousPressed,
    required this.onNextPressed,
    required this.controller,
    required this.finalpage,
  });

  @override
  State<NavigationPanel> createState() => _NavigationPanelState();
}

class _NavigationPanelState extends State<NavigationPanel> {
  double currentpage = 0.0;

  @override
  void initState() {
    super.initState();
    widget.controller.addListener(_onPageChanged);
  }

  @override
  void dispose() {
    widget.controller.removeListener(_onPageChanged);
    super.dispose();
  }

  void _onPageChanged() {
    setState(() {
      currentpage = widget.controller.page ?? 0;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        currentpage > 0
            ? BasicAppTextButton(
                onPressed: _onPreviousPressed,
                title: 'Back',
              )
            : const SizedBox.shrink(),
        SizedBox(
          width: 10.w,
        ),
        widget.finalpage != currentpage
            ? BasicAppElevatedButton(
                onPressed: _onNextPressed,
                title: 'Next',
                width: 85.w,
              )
            : BasicAppElevatedButton(
                onPressed: _getStarted,
                title: 'Get Started',
                width: 142.w,
              ),
      ],
    );
  }

  void _onPreviousPressed() {
    widget.controller.previousPage(
      duration: const Duration(milliseconds: 500),
      curve: Curves.easeInOut,
    );
  }

  void _onNextPressed() {
    widget.controller.nextPage(
      duration: const Duration(milliseconds: 500),
      curve: Curves.easeInOut,
    );
  }

  void _getStarted() {
    log('Get Started Pressed!');
  }
}
