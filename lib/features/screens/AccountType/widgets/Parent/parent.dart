import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mindshield/Utilities/constants/colors.dart';
import 'package:mindshield/Utilities/constants/images.dart';
import 'package:mindshield/Utilities/constants/texts.dart';
import 'package:mindshield/common/widgets/button/rounded_rectangle_forward_elevated_button.dart';
import 'package:mindshield/features/screens/AccountType/widgets/Parent/shareqr.dart';
import 'package:mindshield/features/screens/forgotpassword/widgets/forgotbackbutton.dart';

// /*************************
//  * //   MAIN BRAIN CLASS *
//  *************************/

class ParentScreen extends StatelessWidget {
  const ParentScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Padding(
            padding: EdgeInsets.only(right: 40, left: 40, top: 160),
            child: Column(
              children: [
                Text(
                  UTexts.parentGuide,
                  textAlign: TextAlign.start,
                  style: const TextStyle(
                    fontSize: 19,
                    fontWeight: FontWeight.bold,
                  ),
                ),

                SizedBox(height: 10),

                Align(
                  alignment: Alignment.topLeft,
                  child: SizedBox(
                    height: 291,
                    width: 291,
                    child: Image.asset(UImages.parentGuidenceInstallation),
                  ),
                ),
              ],
            ),
          ),

          ForgotBackButton(),

          Positioned(
            bottom: 75,
            left: 15,
            right: 15,
            child: UElevatedButton(
              onPressed: () => Get.to(() => const ShareQR()),
              child: Text(UTexts.scanMe),
            ),
          ),

          Positioned(
            bottom: 25,
            left: 15,
            right: 15,
            child: UElevatedButton(
              onPressed: () => Get.to(() => const ShareQR()),
              backgroundColor: const Color.fromARGB(0, 255, 255, 255),
              textColor: UColors.primary_800,
              showBorder: false,
              elevation: 0,
              child: Text(UTexts.otpWay),
            ),
          ),
        ],
      ),
    );
  }
}
