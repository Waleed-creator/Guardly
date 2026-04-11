import 'package:flutter/material.dart';
// import 'package:mindshield/Utilities/theme/widgets_theme/text_theme.dart';
import 'package:guardly/features/screens/onboarding/onboarding.dart';
// import 'package:lottie/lottie.dart';
// import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'Utilities/theme/theme.dart';
import 'package:get/get.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      // ------------------- Auto THEME Switch based on system -------------------
      themeMode: ThemeMode.system,
      // ------------------- LIGHT THEME -------------------
      theme: UAppTheme.lightTheme,
      // ------------------- DARK THEME -------------------
      darkTheme: UAppTheme.darkTheme,
      // ------------------- Starts OnBoarding Screens From Here -------------------
      home: const OnboardingScreen(),
      // ------------------- Blank -------------------
    );
  }
}
