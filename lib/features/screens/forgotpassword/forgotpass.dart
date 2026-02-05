import 'package:flutter/material.dart';
// import 'package:mindshield/Utilities/constants/colors.dart';
import 'package:mindshield/Utilities/constants/texts.dart';
import 'package:mindshield/features/screens/forgotpassword/widgets/forgotbackbutton.dart';
import 'package:mindshield/features/screens/forgotpassword/widgets/forgotbutton.dart';
import 'package:mindshield/features/screens/forgotpassword/widgets/forgotscreen.dart';

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

          Positioned(
            // top: MediaQuery.of(context).size.height * 1,
            left: 0,
            right: 0,
            bottom: 10,
            child: OTPButton(),
          ),
        ],
      ),
    );
  }
}
