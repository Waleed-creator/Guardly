import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:guardly/Utilities/constants/colors.dart';
import 'package:guardly/Utilities/constants/images.dart';
import 'package:guardly/Utilities/constants/sizes.dart';
import 'package:guardly/Utilities/constants/texts.dart';
import 'package:guardly/features/screens/AccountType/widgets/Parent/otpcard.dart';
import 'package:guardly/features/screens/AccountType/widgets/Parent/controller/otp_controller.dart';
import 'package:guardly/parent_navigation_menu.dart';
import '../../../../../common/widgets/button/u_elevated_button.dart';
// import 'package:guardly/features/screens/forgotpassword/widgets/forgotbackbutton.dart';

// /*************************
//  * //   MAIN BRAIN CLASS *
//  *************************/

class ShareQR extends StatelessWidget {
  const ShareQR({super.key});

  @override
  Widget build(BuildContext context) {
    // Controller ko initialize karein
    final OTPController controller = Get.put(OTPController());

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
                const SizedBox(height: 40),
                Text(
                  UTexts.getOTP,
                  style: const TextStyle(fontWeight: FontWeight.w500),
                ),
              ],
            ),
          ),

          // Yahan OTPCard ko Obx mein wrap kiya taakay jab code aaye toh update ho
          Positioned(
            bottom: 165,
            left: 15,
            right: 15,
            child: Obx(
              () => controller.isLoading.value
                  ? const Center(child: CircularProgressIndicator())
                  : OTPCard(code: controller.generatedOTP.value),
            ),
          ),

          // Back Button
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
            bottom: 25,
            left: 15,
            right: 15,
            child: UElevatedButton.rectangle(
              onPressed: () => Get.to(() => const ParentNavigationMenu()),
              text: UTexts.continueButton,
              backgroundColor: UColors.bprimary,
              elevation: 2,
            ),
          ),
        ],
      ),
    );
  }
}
