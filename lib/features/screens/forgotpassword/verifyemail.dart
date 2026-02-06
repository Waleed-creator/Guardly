import 'package:flutter/material.dart';
import 'package:mindshield/Utilities/constants/texts.dart';
import 'package:mindshield/features/screens/forgotpassword/newpass.dart';
import 'package:mindshield/features/screens/forgotpassword/widgets/forgotbackbutton.dart';
import 'package:mindshield/features/screens/forgotpassword/widgets/forgotbutton.dart';
import 'package:mindshield/Utilities/constants/sizes.dart';
import 'package:mindshield/Utilities/constants/colors.dart';
import 'package:get/get.dart';
import 'package:pin_code_fields/pin_code_fields.dart';

class VerifyEmail extends StatelessWidget {
  const VerifyEmail({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          PageView(
            children: [
              HelperVerifyEmail(
                // ! Header
                title: UTexts.verifyEmailTitle,
                subtitle: UTexts.verifyEmailSubTitle,
                subtitle2: UTexts.verifyEmailSubTitle2,
                send: UTexts.codeNotReceive,
              ),
            ],
          ),
          //  BackWard Button
          ForgotBackButton(),

          Positioned(
            bottom: 10,
            right: 0,
            left: 0,
            child: ForgotButtonContainer(
              text: UTexts.verifyText,
              onPressed: () => Get.to(() => const NewPassScreen()),
            ),
          ),
        ],
      ),
    );
  }
}

class HelperVerifyEmail extends StatelessWidget {
  const HelperVerifyEmail({
    super.key,
    required this.title,
    required this.subtitle,
    required this.subtitle2,
    required this.send,
  });
  final String title;
  final String subtitle;
  final String subtitle2;
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

          // !  Sub Title
          Text(
            subtitle,
            style: TextStyle().copyWith(
              fontSize: 18.0,
              // fontWeight: FontWeight.bold,
              color: UColors.textPrimary500,
            ),
            textAlign: TextAlign.center,
          ),

          // !  Sub Title 2
          Text(
            subtitle2,
            style: TextStyle().copyWith(
              fontSize: 18.0,
              // fontWeight: FontWeight.bold,
              color: UColors.green_600,
            ),
            textAlign: TextAlign.center,
          ),

          const SizedBox(height: 70),

          PinCodeTextField(
            appContext: context,
            length: 4,
            keyboardType: TextInputType.number,
            animationType: AnimationType.fade,
            cursorColor: UColors.green_600,
            textStyle: const TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
            mainAxisAlignment: MainAxisAlignment.center,
            separatorBuilder: (context, index) => const SizedBox(width: 8),
            pinTheme: PinTheme(
              shape: PinCodeFieldShape.box,
              borderRadius: BorderRadius.circular(10),
              fieldHeight: 55,
              fieldWidth: 45,
              activeColor: UColors.green_600,
              selectedColor: UColors.textPrimary500,
              inactiveColor: UColors.grey_400,
            ),
            onChanged: (value) {},
            onCompleted: (value) {},
          ),

          const SizedBox(height: 20),
          /***************
          * FORM PART *
           ***************/

          SizedBox(height: 10,),
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


//  Hi Miam Waleed