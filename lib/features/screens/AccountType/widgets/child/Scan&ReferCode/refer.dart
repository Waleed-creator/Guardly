import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:guardly/Utilities/constants/colors.dart';
import 'package:guardly/Utilities/constants/images.dart';
import 'package:guardly/Utilities/constants/sizes.dart';
import 'package:guardly/Utilities/constants/texts.dart';
import 'package:guardly/features/screens/AccountType/widgets/Parent/controller/otp_controller.dart';
import 'package:pin_code_fields/pin_code_fields.dart';
import '../../../../../../common/widgets/button/u_elevated_button.dart';
import 'grantp.dart';

class CReferCode extends StatelessWidget {
  const CReferCode({super.key});

  @override
  Widget build(BuildContext context) {
    // 1. Yahan 'Get.put' karein taakay Child device par bhi controller create ho jaye
    final ConnectionController controller = Get.put(ConnectionController());

    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Stack(
        children: [
          HelperVerifyEmail(
            title: UTexts.cToDevice,
            send: UTexts.yCanFindCodeOnParentdevice,
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

          // 2. Safe Continue Button
          Positioned(
            bottom: 20,
            right: 0,
            left: 0,
            child: Obx(() {
              bool isVerified = controller.connectionStatus.value == 'verified';
              return UElevatedButton.rectangle(
                text: UTexts.continueButton,
                onPressed: isVerified
                    ? () => Get.to(() => const GrantPermission())
                    : () {
                        Get.snackbar(
                          "Verification Required",
                          "Pehle parent device wala code enter karein.",
                          snackPosition: SnackPosition.BOTTOM,
                          backgroundColor: Colors.redAccent.withValues(
                            alpha: 0.8,
                          ),
                          colorText: Colors.white,
                        );
                      },
                backgroundColor: isVerified
                    ? UColors.bprimary
                    : Colors.grey.shade400,
                elevation: isVerified ? 2 : 0,
                horizontalMargin: 9,
              );
            }),
          ),
        ],
      ),
    );
  }
}

class HelperVerifyEmail extends StatelessWidget {
  const HelperVerifyEmail({super.key, required this.title, required this.send});
  final String title;
  final String send;

  @override
  Widget build(BuildContext context) {
    // Ab 'Get.find' kaam karega kyunke humne upar 'Get.put' kar diya hai
    final ConnectionController controller = Get.find<ConnectionController>();

    return Padding(
      padding: const EdgeInsets.only(right: 20, left: 20, top: 170),
      child: Column(
        children: [
          Text(
            title,
            style: Theme.of(context).textTheme.headlineLarge,
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 50),

          Obx(
            () => controller.isLoading.value
                ? const CircularProgressIndicator()
                : PinCodeTextField(
                    appContext: context,
                    length: 6,
                    keyboardType: TextInputType.number,
                    onChanged: (value) {},
                    onCompleted: (value) {
                      // OTP Verification call
                      controller.verifyOTP(value);
                    },
                    pinTheme: PinTheme(
                      shape: PinCodeFieldShape.box,
                      borderRadius: BorderRadius.circular(10),
                      activeFillColor: const Color(0xFFF2F2F2),
                      inactiveFillColor: const Color(0xFFF2F2F2),
                      selectedFillColor: const Color(0xFFF2F2F2),
                    ),
                    enableActiveFill: true,
                  ),
          ),

          const SizedBox(height: 20),
          Text(
            send,
            style: const TextStyle(fontSize: 18.0, color: Colors.grey),
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }
}
