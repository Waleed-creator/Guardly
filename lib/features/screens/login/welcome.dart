import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:guardly/Utilities/constants/sizes.dart';
import 'package:guardly/Utilities/constants/images.dart';
import 'package:guardly/Utilities/constants/texts.dart';
import 'package:guardly/Utilities/constants/colors.dart';
import 'package:guardly/features/screens/AccountType/account_type_splash.dart';
// import 'package:guardly/features/screens/allowNotification/widgets/notify_backward_button.dart';
import 'package:guardly/features/screens/login/widgets/terms_splash.dart';

import '../../../common/widgets/button/u_elevated_button.dart';
// import 'package:guardly/common/widgets/button/rounded_rectangle_forward_elevated_button.dart';

class WellcomeScreen extends StatelessWidget {
  const WellcomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
                WellcomePage(
                  title: UTexts.wellcomeTitle,
                  subTitle: UTexts.wellcomeFirstName,
                  image: UImages.loginSplash,
                ),
              ],
            ),

            Positioned(
              bottom: 130,
              left: 15,
              right: 15,
              child: UElevatedButton.rectangle(
                onPressed: () => Get.to(() => ChooseAccount()),
                text: UTexts.continueButton,
                backgroundColor: UColors.bprimary,
                horizontalMargin: 8,
              ),
            ),

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

            TermsText(),
          ],
        ),
      ),
    );
  }
}

class WellcomePage extends StatelessWidget {
  const WellcomePage({
    super.key,
    required this.image,
    required this.title,
    required this.subTitle,
  });
  final String image;
  final String title;
  final String subTitle;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
        right: USizes.defaultSpace,
        left: USizes.defaultSpace,
        // top: UDeviceHelper.getAppBarHeight(),
        top: 100,
      ),
      child: Column(
        children: [
          // Title
          Text(
            title,
            style: TextStyle().copyWith(
              fontSize: 18.0,
              // fontWeight: FontWeight.bold,
            ),
            textAlign: TextAlign.center,
          ),

          // SubTitle
          Text(
            subTitle,
            textAlign: TextAlign.center,
            style: TextStyle().copyWith(
              fontSize: 42.0,
              fontWeight: FontWeight.bold,
              color: UColors.green_800,
            ),
          ),

          const SizedBox(height: 75),

          Center(
            child: SizedBox(
              height: 220,
              width: 202, // image height adjust karo yahan
              child: Image.asset(image, fit: BoxFit.contain),
            ),
          ),

          // // Image
          // Image.asset(image),
        ],
      ),
    );
  }
}


//  Additional chnages ETC

// Isme kya change kiya:

// Image.asset ko SizedBox me wrap kiya aur height: 150 diya — isse image chhoti ho gayi.

// Center widget use kiya image ko horizontally center karne ke liye.

// mainAxisAlignment: MainAxisAlignment.center laga diya Column me taake vertical center ho jaye (agar aap full height me center chahte hain).

// SizedBox ke through vertical spacing manage kiya — padding/margin kam ho gayi.

// Agar chaho to image ki width bhi control kar sakte ho jaise:

// SizedBox(
//   height: 150,
//   width: 150,
//   child: Image.asset(image, fit: BoxFit.contain),
// )