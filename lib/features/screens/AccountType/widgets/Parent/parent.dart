import 'package:flutter/material.dart';
import 'package:mindshield/Utilities/constants/images.dart';
import 'package:mindshield/Utilities/constants/sizes.dart';
import 'package:mindshield/Utilities/constants/texts.dart';
import 'package:mindshield/common/widgets/button/rounded_rectangle_forward_elevated_button.dart';
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
            padding: EdgeInsets.only(
              right: USizes.defaultSpace,
              left: USizes.defaultSpace,
              top: 140,
            ),
            child: Column(
              children: [
                Text(
                  UTexts.parentGuide,
                  textAlign: TextAlign.start,
                  style: const TextStyle(
                    fontSize: 21,
                    fontWeight: FontWeight.bold,
                  ),
                ),

                SizedBox(height: 10),

                Align(
                  alignment: Alignment.topLeft,
                  child: SizedBox(
                    height: 231,
                    width: 240,
                    child: Image.asset(UImages.parentGuidenceInstallation),
                  ),
                ),
              ],
            ),
          ),

          ForgotBackButton(),

          Positioned(
            bottom: 25,
            left: 15,
            right: 15,
            child: UElevatedButton(
              onPressed: () {},
              child: Text(UTexts.scanMe),
            ),
          ),
        ],
      ),
    );
  }
}
