import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:guardly/Utilities/constants/colors.dart';
import 'package:guardly/Utilities/constants/images.dart';
import 'package:guardly/Utilities/constants/sizes.dart';
import 'package:guardly/Utilities/constants/texts.dart';
import 'package:guardly/features/screens/AccountType/widgets/Parent/shareqr.dart';
import '../../../../../common/widgets/button/u_elevated_button.dart';

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
                    height: 271,
                    width: 271,
                    child: Image.asset(UImages.parentGuidenceInstallation),
                  ),
                ),
              ],
            ),
          ),

          // ForgotBackButton(),

          //  BackWard Button
          Positioned(
            top: USizes.spaceBtwItems * 4.6,
            left: 30,
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
            bottom: 75,
            left: 15,
            right: 15,
            child: UElevatedButton.rectangle(
              onPressed: () => Get.to(() => const ShareQR()),
              text: UTexts.scanMe,
              backgroundColor: UColors.bprimary,
              elevation: 2,
              horizontalMargin: 9,
            ),
          ),

          Positioned(
            bottom: 25,
            left: 15,
            right: 15,
            child: UElevatedButton.textButton(
              onPressed: () => Get.to(() => const ShareQR()),
              // backgroundColor: const Color.fromARGB(0, 255, 255, 255),
              textColor: UColors.primary_800,
              // showBorder: false,
              // elevation: 0,
              text: UTexts.otpWay,
            ),
          ),
        ],
      ),
    );
  }
}
