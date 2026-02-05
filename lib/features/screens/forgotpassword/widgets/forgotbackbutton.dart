import 'package:flutter/material.dart';
import 'package:mindshield/Utilities/constants/sizes.dart';
import 'package:flutter_svg/flutter_svg.dart';
// import 'package:mindshield/features/authentication/controllers/onboarding/onboarding_controller.dart';
import 'package:get/get.dart';
import 'package:mindshield/Utilities/constants/colors.dart';
import 'package:mindshield/features/screens/forgotpassword/widgets/forgotelevatedbutton.dart';

// Next Button Widget
class ForgotBackButton extends StatelessWidget {
  const ForgotBackButton({super.key});

  @override
  Widget build(BuildContext context) {
    return Positioned(
      top: USizes.spaceBtwItems * 4,
      left: 10,
      child: UForgotElevatedButton(
        onPressed: () {
          Get.back(); 
        },
        
        child: SvgPicture.asset(
          "assets/notification/backward.svg",
          width: 34,
          height: 34,
          colorFilter: const ColorFilter.mode(
            UColors.secondaryBlack,
            BlendMode.srcIn,
          ),
        ),
      ),
    );
  }
}



