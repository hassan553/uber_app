import 'package:flutter/material.dart';
import 'package:uber_app/features/onboarding/onboarding_screen.dart';
import 'package:uber_app/features/onboarding/splash_screen.dart';

import '../../features/home/ui/home_screen.dart';

class AppPages {
  static const splash = '/';
  static const onboarding = '/onBoarding';
  static const chatScreen = '/ChatScreen';
  static const home = '/home';
  
}

Map<String, Widget Function(BuildContext)> routes = {
  AppPages.splash: (context) => const SplashScreen(),
  AppPages.onboarding: (context) => const OnboardingScreen(),
  AppPages.chatScreen: (context) => const ChatScreen(),
};
