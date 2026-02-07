import 'package:flutter/material.dart';
import 'package:mindshield/Utilities/constants/sizes.dart';
import 'package:mindshield/Utilities/constants/texts.dart';
import 'package:mindshield/common/widgets/button/rounded_rectangle_forward_elevated_button.dart';
import 'package:mindshield/features/screens/forgotpassword/widgets/forgotbackbutton.dart';

class ChooseAccount extends StatelessWidget {
  const ChooseAccount({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          PageView(children: [AccontBody(title: UTexts.accountTypeTitle)]),

          //  Backward Button
          ForgotBackButton(),
          //  Continue Button
          Positioned(
            bottom: 25,
            left: 15,
            right: 15,
            child: UElevatedButton(
              onPressed: () {},
              child: Text(UTexts.continueButton),
            ),
          ),
        ],
      ),
    );
  }
}

class AccontBody extends StatelessWidget {
  const AccontBody({super.key, required this.title});
  final String title;
  // final String title;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
        right: USizes.defaultSpace,
        left: USizes.defaultSpace,
        // top: UDeviceHelper.getAppBarHeight(),
        top: 160,
      ),
      child: Column(
        children: [
          //  Header Text
          Text(
            title,
            style: TextStyle().copyWith(
              fontSize: 28.0,
              fontWeight: FontWeight.bold,
            ),
            textAlign: TextAlign.center,
          ),

          // For parent & For Child
        ],
      ),
    );
  }
}
