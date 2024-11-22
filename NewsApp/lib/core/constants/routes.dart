import 'package:go_router/go_router.dart';
import 'package:newsapp_self/presentation/Homepage/pages/Homepage.dart';
import 'package:newsapp_self/presentation/auth/pages/forgot_password.dart';
import 'package:newsapp_self/presentation/auth/pages/otp_verification.dart';
import 'package:newsapp_self/presentation/auth/pages/reset_password.dart';
import 'package:newsapp_self/presentation/auth/pages/signin.dart';
import 'package:newsapp_self/presentation/auth/pages/signup.dart';
import 'package:newsapp_self/presentation/choose_mode/pages/choose_mode.dart';
import 'package:newsapp_self/presentation/detailspage/pages/news_screen.dart';
import 'package:newsapp_self/presentation/onboarding/pages/onboarding.dart';
import 'package:newsapp_self/presentation/splash/pages/splash.dart';
import 'package:newsapp_self/presentation/welcome/pages/welcomepage.dart';

final approutes = GoRouter(
  initialLocation: '/splashscreen',
  // initialLocation: '/onboarding',
  // initialLocation: '/choose_mode',
  // initialLocation: '/signin',
  // initialLocation: '/signup',
  // initialLocation: '/forgotpassword',
  // initialLocation: '/otpverification',
  // initialLocation: '/resetpassword',
  // initialLocation: '/welcomepage',
  routes: [
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
      builder: (context, state) => SigninPage(),
    ),
    GoRoute(
      path: '/signup',
      name: 'signup',
      builder: (context, state) => SignupPage(),
    ),
    GoRoute(
      path: '/forgotpassword',
      name: 'forgotpassword',
      builder: (context, state) => ForgotpasswordPage(),
    ),
    GoRoute(
      path: '/otpverification',
      name: 'otpverification',
      builder: (context, state) => const OtpVerificationPage(),
    ),
    GoRoute(
        path: '/resetpassword',
        name: 'resetpassword',
        builder: (context, state) => const ResetPasswordPage()),
    GoRoute(
      path: '/welcomepage',
      name: 'welcomepage',
      builder: (context, state) => const Welcomepage(),
    ),
    GoRoute(
      path: '/homepage',
      name: 'homepage',
      builder: (context, state) => const HomeScreen(),
    ),
    GoRoute(
      path: '/details',
      name: 'details',
      builder: (context, state) {
        final extra = state.extra as Map<String, dynamic>;
        return DetailsScreen(
          title: extra['title'],
          source: extra['source'],
          time: extra['time'],
          imageUrl: extra['imageUrl'],
          content: extra['content'],
          description: extra['description'],
        );
      },
    ),
  ],
);
