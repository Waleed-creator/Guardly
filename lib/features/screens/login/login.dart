import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:mindshield/Utilities/constants/images.dart';
import 'package:mindshield/Utilities/constants/sizes.dart';
import 'package:mindshield/Utilities/constants/texts.dart';
import 'package:mindshield/Utilities/constants/colors.dart';
import 'package:mindshield/common/widgets/button/u_elevated_button.dart';
import 'package:mindshield/features/screens/login/widgets/loginpage.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomRight,
            colors: [
              UColors.primary_600, // Teal
              UColors.secondary, // White
            ],
            stops: [0.1, 0.6], // End > Begin Point
          ),
        ),
        child: Stack(
          children: [
            PageView(
              children: [
                LoginPage(
                  // ! Header
                  image: UImages.loginSplash,
                  title: UTexts.loginTitle,

                  // ! Form

                  // ! Divider

                  // ! Footer
                ),
              ],
            ),
            //  BackWard Button
            // NotifyBackButton(),
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
            // ************************************
          ],
        ),
      ),
    );
  }
}
