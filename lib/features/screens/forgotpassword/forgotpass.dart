import 'package:flutter/material.dart';
// import 'package:mindshield/Utilities/constants/colors.dart';
import 'package:mindshield/Utilities/constants/texts.dart';
import 'package:mindshield/features/screens/forgotpassword/widgets/forgotbackbutton.dart';
import 'package:mindshield/features/screens/forgotpassword/widgets/forgotbutton.dart';
import 'package:mindshield/features/screens/forgotpassword/widgets/forgotscreen.dart';
import 'package:get/get.dart';
import 'package:mindshield/features/screens/forgotpassword/verifyemail.dart';

class ForgotMainScreen extends StatelessWidget {
  const ForgotMainScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
          ForgotBackButton(),

          Positioned(bottom: 10, right: 0, left: 0, child: ForgotButtonContainer(
            text: UTexts.otpText,
            onPressed: () => Get.to(() => const VerifyEmail()),
          )),
        ],
      ),
    );
  }
}
