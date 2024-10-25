import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:newsapp_self/data/repository/onboarding/onboarding_repository.dart';
import 'package:newsapp_self/presentation/onboarding/widgets/navigation_panel.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({super.key});

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  final controller = OnboardingRepository();
  PageController pageController = PageController();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: PageView.builder(
          itemCount: controller.items.length,
          physics: const NeverScrollableScrollPhysics(),
          onPageChanged: (int index) {},
          itemBuilder: (context, index) => Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: 580.h, // Image takes up 70% of the screen height
                width: double.infinity,
                child: Image.asset(
                  'assets/images/onboarding${index + 1}.png',
                  fit: BoxFit.fill,
                ),
              ),
              Padding(
                padding: EdgeInsets.all(16.h), // Adjust padding to prevent gaps
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      controller.items[index].title,
                      style: TextStyle(
                        fontSize: 20.sp, // Set a specific font size
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(
                        height: 10
                            .sp), // Adjust space between title and description
                    Text(
                      controller.items[index].description,
                      style: TextStyle(
                        fontSize: 16.sp,
                        fontWeight: FontWeight.normal,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
          controller: pageController,
        ),
        bottomSheet: Container(
          padding: EdgeInsets.symmetric(horizontal: 24.sp, vertical: 40.sp),
          color: Theme.of(context).scaffoldBackgroundColor,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              SmoothPageIndicator(
                controller: pageController,
                count: controller.items.length,
                effect: const ScrollingDotsEffect(
                  dotHeight: 10,
                  dotWidth: 10,
                  dotColor: Colors.grey,
                  activeDotColor: Colors.blue,
                ),
              ),
              const Spacer(),
              Row(
                children: [
                  SizedBox(width: 8.sp),
                  NavigationPanel(
                    controller: pageController,
                    finalpage: controller.items.length - 1,
                    onPreviousPressed: () {
                      pageController.previousPage(
                        duration: const Duration(milliseconds: 500),
                        curve: Curves.easeInOut,
                      );
                    },
                    onNextPressed: () {
                      pageController.nextPage(
                        duration: const Duration(milliseconds: 500),
                        curve: Curves.easeIn,
                      );
                    },
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
