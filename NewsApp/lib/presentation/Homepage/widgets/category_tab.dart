import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:newsapp_self/core/config/theme/app_colors.dart';

class CategoryTab extends StatefulWidget {
  final Function(String) onCategorySelected;

  const CategoryTab({
    super.key,
    required this.onCategorySelected,
  });

  @override
  State<CategoryTab> createState() => _CategoryTabState();
}

class _CategoryTabState extends State<CategoryTab>
    with SingleTickerProviderStateMixin {
  TabController? tabController;

  @override
  void initState() {
    super.initState();
    tabController = TabController(length: 8, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    return TabBar(
      controller: tabController,
      isScrollable: true,
      overlayColor: WidgetStateProperty.all(Colors.transparent),
      labelPadding: EdgeInsets.only(left: 1.sp, right: 10.sp),
      labelStyle: TextStyle(
        fontSize: 16.sp,
        fontWeight: FontWeight.w600,
      ),
      unselectedLabelStyle: TextStyle(
        fontSize: 16.sp,
        fontWeight: FontWeight.w400,
        color: AppColors.unselectedtextColor,
      ),
      onTap: (index) {
        final categories = [
          'All',
          'Sports',
          'Politics',
          'Business',
          'Health',
          'Travel',
          'Science',
          'Fashion,'
        ];
        widget.onCategorySelected(categories[index]);
      },
      tabAlignment: TabAlignment.start,
      dividerColor: Colors.transparent,
      indicatorColor: AppColors.primaryDefault,
      indicatorSize: TabBarIndicatorSize.label,
      automaticIndicatorColorAdjustment: true,
      tabs: const [
        Tab(text: 'All'),
        Tab(child: Text('Sports')),
        Tab(child: Text('Politics')),
        Tab(child: Text('Business')),
        Tab(child: Text('Health')),
        Tab(child: Text('Travel')),
        Tab(child: Text('Science')),
        Tab(child: Text('Fashion'))
      ],
    );
  }
}
