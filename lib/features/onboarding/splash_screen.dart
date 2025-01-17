
import 'package:flutter/material.dart';
import 'package:uber_app/core/extension/navigation_extension.dart';
import 'package:uber_app/core/routes/app_pages.dart';
import 'package:uber_app/core/utils/app_colors.dart';
import 'package:uber_app/core/utils/app_images.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Future.delayed(const Duration(seconds: 2), () {
      context.navigateToAndReplacement(AppPages.onboarding);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.primaryColor,
      body: Center(
        child: ClipOval(
          child: AnimatedRotation(
            duration: const Duration(seconds: 2),
            turns: 360 * 2,
            child: Image.asset(
              AppImages.logo,
              width: 200,
              height: 200,
              fit: BoxFit.cover,
            ),
          ),
        ),
      ),
    );
  }
}
