import 'package:go_router/go_router.dart';
import 'package:newsapp_self/presentation/auth/pages/signin.dart';
import 'package:newsapp_self/presentation/choose_mode/pages/choose_mode.dart';
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
    builder: (context, state) => const OnboardingScreen(),
  ),
  GoRoute(
    path: '/choose_mode',
    name: 'choose_mode',
    builder: (context, state) => const ChooseModePage(),
  ),
  GoRoute(
    path: '/signin_or_signup',
    name: 'signin_or_signup',
    builder: (context, state) => const SigninPage(),
  ),
]);
