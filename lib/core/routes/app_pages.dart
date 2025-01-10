
import 'package:flutter/material.dart';

class AppPages {
  static const onboarding = '/';
  static const register = '/register';
  static const login = '/login';
  static const loadingPage = '/loadingPage';
  static const home = '/home';
  static const profile = '/profile';
  static const addTask = '/addTask';
  static const chatDetails = '/chatDetails';
}

Map<String, Widget Function(BuildContext)> routes = {
  // AppPages.onboarding: (context) => const OnboardingScreen(),
  // AppPages.login: (context) => const LoginScreen(),
  // AppPages.register: (context) => const RegisterScreen(),
  // AppPages.home: (context) => const HomeScreen(),
  // AppPages.chatDetails: (context) => const ChatDetailsScreen(),
  // AppPages.profile: (context) => const ProfileScreen(),
};
