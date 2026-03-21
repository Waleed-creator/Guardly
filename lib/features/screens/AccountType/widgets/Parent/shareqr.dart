import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:mindshield/Utilities/constants/images.dart';
import 'package:mindshield/Utilities/constants/sizes.dart';
import 'package:mindshield/Utilities/constants/texts.dart';
import 'package:mindshield/common/widgets/button/rounded_rectangle_forward_elevated_button.dart';
import 'package:mindshield/features/screens/AccountType/account_type_splash.dart';
import 'package:mindshield/features/screens/AccountType/widgets/Parent/otpcard.dart';
import 'package:mindshield/features/screens/forgotpassword/widgets/forgotbackbutton.dart';

// /*************************
//  * //   MAIN BRAIN CLASS *
//  *************************/

class ShareQR extends StatelessWidget {
  const ShareQR({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Padding(
            padding: EdgeInsets.only(
              right: USizes.defaultSpace,
              left: USizes.defaultSpace,
              top: 130,
            ),
            child: Column(
              children: [
                Align(
                  alignment: Alignment.center,
                  child: SizedBox(
                    height: 295,
                    width: 235,
                    child: Image.asset(UImages.scanMe),
                  ),
                ),

                SizedBox(height: 40),

                Text(
                  UTexts.getOTP,
                  style: TextStyle(fontWeight: FontWeight.w500),
                ),
              ],
            ),
          ),

          Positioned(
            bottom: 165,
            left: 15,
            right: 15,
            child: OTPCard(code: "932255"),
          ),

          ForgotBackButton(),

          Positioned(
            bottom: 25,
            left: 15,
            right: 15,
            child: UElevatedButton(
              onPressed: () => Get.to(() => const ChooseAccount()),
              child: Text(UTexts.continueButton),
            ),
          ),
        ],
      ),
    );
  }
}
