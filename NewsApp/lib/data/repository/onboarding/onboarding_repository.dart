import 'package:newsapp_self/core/config/assets/app_images.dart';
import 'package:newsapp_self/data/models/onboarding/onboarding_model.dart';

class OnboardingRepository {
  List<OnboardingItem> items = [
    OnboardingItem(
      title: 'Welcome to Khabar',
      description:
          'Khabar is a platform for you to get information about the latest news from around the world.',
      imagePath: AppImages.onboarding1,
    ),
    OnboardingItem(
      title: 'News for You',
      description: 'The latest news from around the world. Just for you.',
      imagePath: AppImages.onboarding2,
    ),
    OnboardingItem(
      title: 'Get News Anywhere, Anytime',
      description:
          'Learn The latest news from around the world anywhere, anytime.',
      imagePath: AppImages.onboarding3,
    ),
  ];
}
