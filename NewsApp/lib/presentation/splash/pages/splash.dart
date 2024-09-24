import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';
import 'package:newsapp_self/core/config/assets/app_vectors.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    redirect();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
          child: SvgPicture.asset(
        AppVectors.logo,
      )),
    );
  }

  Future<void> redirect() async {
    await Future.delayed(const Duration(seconds: 2));
    if (context.mounted) {
      context.go('/onboarding');
    }
  }
}
