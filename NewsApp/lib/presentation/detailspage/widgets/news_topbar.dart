import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:newsapp_self/common/widgets/elements/text_widget.dart';
import 'package:newsapp_self/core/config/theme/app_colors.dart';
import 'package:newsapp_self/core/constants/font_size.dart';
import 'package:newsapp_self/presentation/Homepage/widgets/source_logo.dart';

class NewsDetailsTopBar extends StatelessWidget {
  final String source;
  final String time;
  const NewsDetailsTopBar(
      {super.key, required this.source, required this.time});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Row(
          children: [
            SourceLogo(source: source, radius: 25.sp),
            SizedBox(width: 4.sp),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CustomTextWidget.selectedcolour(
                  text: source,
                  fontsize: fontSize16,
                  fontweight: FontWeight.w600,
                  selectedcolour: AppColors.blacktext,
                ),
                CustomTextWidget(
                  text: '$time ago',
                  fontsize: fontSize14,
                  fontweight: FontWeight.w400,
                ),
              ],
            ),
          ],
        ),
        const Spacer(),
        ElevatedButton(
          onPressed: () {},
          style: ElevatedButton.styleFrom(
            backgroundColor: AppColors.elevatedColor,
            foregroundColor: AppColors.white,
            padding: EdgeInsets.symmetric(
              horizontal: 12.sp,
              vertical: 5.sp,
            ),
            textStyle: TextStyle(
              fontSize: 16.sp,
              fontWeight: FontWeight.w600,
            ),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(6),
            ),
          ),
          child: const Text('Following'),
        ),
      ],
    );
  }
}
