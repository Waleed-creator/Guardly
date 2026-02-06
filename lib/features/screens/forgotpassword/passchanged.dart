import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/src/extension_navigation.dart';
import 'package:mindshield/Utilities/constants/images.dart';
import 'package:mindshield/Utilities/constants/texts.dart';
import 'package:mindshield/features/screens/forgotpassword/widgets/forgotbackbutton.dart';
import 'package:mindshield/Utilities/constants/sizes.dart';
import 'package:mindshield/Utilities/constants/colors.dart';
import 'package:mindshield/features/screens/forgotpassword/widgets/forgotbutton.dart';
import 'package:mindshield/features/screens/login/login.dart';

class PassChanged extends StatelessWidget {
  const PassChanged({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          PageView(
            children: [
              SetPassPage(
                // ! Header
                image: UImages.passwordChanged,
                title: UTexts.passwordchangedTitle,
                subtitle: UTexts.passwordchangedSubTitle,
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
              text: UTexts.backToLogin ,
              onPressed: () => Get.to(() => LoginScreen()),
            ),
          ),
        ],
      ),
    );
  }
}

class SetPassPage extends StatelessWidget {
  const SetPassPage({
    super.key,
    required this.title,
    required this.subtitle,
    required this.image,
  });
  final String image;
  final String title;
  final String subtitle;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
        right: USizes.defaultSpace,
        left: USizes.defaultSpace,
        // top: UDeviceHelper.getAppBarHeight(),
        top: 200,
      ),
      child: Column(
        children: [
          /***************
          * HEADER PART *
           ***************/
          // ! Image
          Center(
            child: SizedBox(
              height: 120,
              width: 120, // image height adjust karo yahan
              child: Image.asset(image, fit: BoxFit.contain),
            ),
          ),
          // !  Title
          const SizedBox(height: 20),

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
        ],
      ),
    );
  }
}
