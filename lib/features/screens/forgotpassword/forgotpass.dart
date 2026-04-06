import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:mindshield/Utilities/constants/images.dart';
import 'package:mindshield/Utilities/constants/sizes.dart';
import 'package:mindshield/Utilities/constants/texts.dart';
import 'package:mindshield/Utilities/theme/theme.dart';
import 'package:mindshield/common/widgets/button/u_elevated_button.dart'
    show UElevatedButton;
import 'package:mindshield/features/screens/forgotpassword/widgets/forgotscreen.dart';
import 'package:get/get.dart';
import 'package:mindshield/features/screens/forgotpassword/verifyemail.dart';

class ForgotMainScreen extends StatelessWidget {
  const ForgotMainScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Stack(
        children: [
          PageView(
            children: [
              ForgotPage(
                // ! Header
                title: UTexts.forgetPasswordTitle,
                subtitle: UTexts.forgetPasswordSubTitle,
              ),
            ],
          ),

          //  BackWard Button


          Positioned(
            top: USizes.spaceBtwItems * 4.6,
            left: 10,
            child: UElevatedButton.svgOnly(
              onPressed: () => Get.back(),
              child: SvgPicture.asset(
                UImages.backward,
                width: 34,
                height: 34,
                colorFilter: const ColorFilter.mode(
                  UColors.secondaryBlack,
                  BlendMode.srcIn,
                ),
              ),
            ),
          ),

          Positioned(
            bottom: 10,
            right: 0,
            left: 0,
            child: UElevatedButton.rectangle(
              text: UTexts.otpText,
              onPressed: () => Get.to(() => const VerifyEmail()),
              backgroundColor: UColors.bprimary,
              elevation: 1,
              // textSize: ,
            ),
          ),
        ],
      ),
    );
  }
}
