import 'package:go_router/go_router.dart';
import 'package:newsapp_self/presentation/auth/pages/forgot_password.dart';
import 'package:newsapp_self/presentation/auth/pages/signin.dart';
import 'package:newsapp_self/presentation/auth/pages/signup.dart';
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
    path: '/signin',
    name: 'signin',
    builder: (context, state) => const SigninPage(),
  ),
  GoRoute(
    path: '/signup',
    name: 'signup',
    builder: (context, state) => const SignupPage(),
  ),
  GoRoute(
    path: '/forgotpassword',
    name: 'forgotpassword',
    builder: (context, state) => const ForgotpasswordPage(),
  )
]);
