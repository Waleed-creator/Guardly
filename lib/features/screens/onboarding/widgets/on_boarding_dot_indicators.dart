import 'package:flutter/material.dart';
// import 'package:guardly/Utilities/helpers/device_helpers.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
// import 'package:get/get.dart';
import 'package:guardly/features/authentication/controllers/onboarding/onboarding_controller.dart';
import 'package:guardly/Utilities/constants/colors.dart';

class OnBoardingDotNavigation extends StatelessWidget {
  const OnBoardingDotNavigation({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = OnboardingController.instance;
    return Positioned(
      top: 400,
      left: 0,
      right: 0,
      child: Align(
        alignment: Alignment.center, // center horizontally
        child: SmoothPageIndicator(
          controller: controller.pageController,
          onDotClicked: controller.dotNavigationClick,
          count: 6,
          effect: ExpandingDotsEffect(
            dotWidth: 12.0,
            dotHeight: 12.0,
            // n-> Navigator Color
            activeDotColor: UColors.iPrimary,
            dotColor: UColors.iSecondary,
          ),
        ),
      ),
    );
  }
}

