import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:uber_app/core/extension/navigation_extension.dart';
import 'package:uber_app/core/extension/text_extension.dart';
import 'package:uber_app/core/utils/app_colors.dart';
import 'package:uber_app/core/utils/app_images.dart';

import '../../core/routes/app_pages.dart';

class OnboardingScreen extends StatelessWidget {
  const OnboardingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const SizedBox(height: 20),
              Text(
                'Your Digital Assistant',
                style: context.f24700!.copyWith(color: AppColors.primaryColor),
              ),
              const SizedBox(height: 10),
              Text(
                '''With this software, you can ask your questions and receive articles powered by an artificial intelligence assistant.''',
                style: context.f15400!,
                textAlign: TextAlign.center,
              )..animate()
                  .fadeIn() // uses `Animate.defaultDuration`
                  .scale() // inherits duration from fadeIn
                  ,
              const Spacer(flex: 1),
              Image.asset(
                AppImages.onboarding,
                width: MediaQuery.sizeOf(context).width,
                fit: BoxFit.fill,
              ),
              const Spacer(flex: 2),
              ElevatedButton(
                onPressed: ()async {
                  print(await FirebaseMessaging.instance.getToken());
               context.navigateToAndReplacement(AppPages.chatScreen);
                },
                style: ElevatedButton.styleFrom(
                  fixedSize: Size(MediaQuery.sizeOf(context).width, 60),
                  backgroundColor:
                      AppColors.primaryColor, // Button background color
                  foregroundColor: Colors.white, // Text color
                  padding: const EdgeInsets.symmetric(
                      horizontal: 24.0, vertical: 12.0), // Padding
                  textStyle: const TextStyle(
                    fontSize: 16.0, // Text size
                    fontWeight: FontWeight.bold, // Text weight
                  ),
                  shape: RoundedRectangleBorder(
                    borderRadius:
                        BorderRadius.circular(30.0), // Rounded corners
                  ),
                  elevation: 5, // Shadow elevation
                ),
                child: const Text('Continue'),
              )
            ],
          ),
        ),
      ),
    );
  }
}
