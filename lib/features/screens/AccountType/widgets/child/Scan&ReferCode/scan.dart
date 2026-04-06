import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:mindshield/Utilities/constants/colors.dart';
import 'package:mindshield/Utilities/constants/images.dart';
import 'package:mindshield/Utilities/constants/sizes.dart';
import 'package:mindshield/Utilities/constants/texts.dart';
import 'package:mindshield/common/widgets/button/u_elevated_button.dart';
import 'package:flutter_svg/flutter_svg.dart';

class ChildScan extends StatelessWidget {
  const ChildScan({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          ScanBody(),

          Positioned(
            top: USizes.spaceBtwItems * 4.6,
            left: 20,
            child: UElevatedButton.svgOnly(
              onPressed: () {
                Get.back();
              },
              child: SvgPicture.asset(
                "assets/notification/backward.svg",
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
            bottom: MediaQuery.of(context).padding.bottom + 20,
            left: 0,
            right: 0,
            child: UElevatedButton.rectangle(
              text: UTexts.continueButton,
              onPressed: () {},
              backgroundColor: UColors.bprimary,
              elevation: 2,
            ),
          ),
        ],
      ),
    );
  }
}

class ScanBody extends StatelessWidget {
  const ScanBody({super.key});

  @override
  Widget build(BuildContext context) {
    return PageView(
      children: [
        Padding(
          padding: EdgeInsets.only(
            left: USizes.defaultSpace,
            right: USizes.defaultSpace,
            top: 140,
          ),
          child: Column(
            children: [
              // Title
              Text(
                UTexts.sQRCode,
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 28,
                  fontWeight: FontWeight.bold,
                  color: UColors.textPrimary800,
                ),
              ),
              // Subtitle
              Text(
                UTexts.scaning,
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w500,
                  color: UColors.subtext,
                ),
              ),
              // Scaning
              SizedBox(height: 50),
              Image(image: AssetImage(UImages.scaningFrame)),
            ],
          ),
        ),
      ],
    );
  }
}
