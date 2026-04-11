import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:guardly/Utilities/constants/images.dart';
import 'package:guardly/Utilities/constants/texts.dart';
import 'package:guardly/features/screens/AccountType/widgets/child/Scan&ReferCode/grantp.dart';
// import 'package:guardly/features/screens/forgotpassword/widgets/forgotbackbutton.dart';
// import 'package:guardly/features/screens/forgotpassword/widgets/forgotbutton.dart';
import 'package:guardly/Utilities/constants/sizes.dart';
import 'package:guardly/Utilities/constants/colors.dart';
import 'package:get/get.dart';
import 'package:pin_code_fields/pin_code_fields.dart';

import '../../../../../../common/widgets/button/u_elevated_button.dart';

class CReferCode extends StatelessWidget {
  const CReferCode({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Stack(
        children: [
          PageView(
            children: [
              HelperVerifyEmail(
                // ! Header
                title: UTexts.cToDevice,
                send: UTexts.yCanFindCodeOnParentdevice,
              ),
            ],
          ),
          //  BackWard Button
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
            bottom: 20,
            right: 0,
            left: 0,
            child: UElevatedButton.rectangle(
              text: UTexts.continueButton,
              onPressed: () => Get.to(() => const GrantPermission()),
              backgroundColor: UColors.bprimary,
              elevation: 2,
              horizontalMargin: 9,
            ),
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
    return Padding(
      padding: EdgeInsets.only(
        right: USizes.defaultSpace,
        left: USizes.defaultSpace,
        // top: UDeviceHelper.getAppBarHeight(),
        top: 170,
      ),
      child: Column(
        children: [
          /***************
          * HEADER PART *
           ***************/
          // ! Large Title
          Text(
            title,
            style: Theme.of(context).textTheme.headlineLarge,
            textAlign: TextAlign.center,
          ),

          const SizedBox(height: 10),

          const SizedBox(height: 40),

          PinCodeTextField(
            appContext: context,
            length: 6,
            keyboardType: TextInputType.number,
            animationType: AnimationType.fade,
            cursorColor: Colors.black,

            textStyle: const TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.w600,
              color: Colors.black,
            ),

            mainAxisAlignment: MainAxisAlignment.center,

            separatorBuilder: (context, index) {
              if (index == ((6 ~/ 2) - 1)) {
                return const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 6),
                  child: Text(
                    "-",
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                );
              }
              return const SizedBox(width: 8);
            },

            pinTheme: PinTheme(
              shape: PinCodeFieldShape.box,
              borderRadius: BorderRadius.circular(10),

              activeColor: Colors.transparent,
              selectedColor: Colors.transparent,
              inactiveColor: Colors.transparent,

              activeFillColor: const Color(0xFFF2F2F2),
              selectedFillColor: const Color(0xFFF2F2F2),
              inactiveFillColor: const Color(0xFFF2F2F2),
            ),

            enableActiveFill: true,
            onChanged: (value) {},
            onCompleted: (value) {},
          ),

          const SizedBox(height: 20),

          Text(
            send,
            style: TextStyle().copyWith(
              fontSize: 18.0,
              // fontWeight: FontWeight.bold,
              color: UColors.textPrimary500,
            ),
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }
}
