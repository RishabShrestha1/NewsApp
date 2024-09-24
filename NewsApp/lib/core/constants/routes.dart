import 'package:go_router/go_router.dart';
import 'package:newsapp_self/presentation/onboarding/pages/onboarding.dart';
import 'package:newsapp_self/presentation/splash/pages/splash.dart';

final approutes = GoRouter(initialLocation: '/splashscreen', routes: [
  GoRoute(
    path: '/splashscreen',
    name: 'splashscreen',
    builder: (context, state) => const SplashScreen(),
  ),
  GoRoute(
    path: '/onboarding',
    name: 'onboarding',
    builder: (context, state) => OnboardingScreen(),
  )
]);
