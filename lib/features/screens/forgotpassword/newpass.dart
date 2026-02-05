import 'package:flutter/material.dart';
import 'package:mindshield/Utilities/constants/images.dart';
import 'package:mindshield/Utilities/constants/texts.dart';
import 'package:mindshield/features/screens/forgotpassword/passchanged.dart';
import 'package:mindshield/features/screens/forgotpassword/widgets/forgotbackbutton.dart';
import 'package:iconsax/iconsax.dart';
import 'package:mindshield/Utilities/constants/sizes.dart';
import 'package:mindshield/Utilities/constants/colors.dart';
import 'package:get/get.dart';
import 'package:mindshield/features/screens/forgotpassword/widgets/forgotbutton.dart';

class NewPassScreen extends StatelessWidget {
  const NewPassScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          PageView(
            children: [
              SetPassPage(
                // ! Header
                title: UTexts.setNewPasswordTitle,
                subtitle: UTexts.setNewPasswordSubTitle,
                image: UImages.passwordRequirements,
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
              text: UTexts.confirmButton,
              onPressed: () => Get.to(() => PassChanged()),
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
  final String title;
  final String subtitle;
  final String image;
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

          const SizedBox(height: 70),
          /***************
          * FORM PART *
           ***************/
          TextFormField(
            decoration: InputDecoration(
              prefix: Icon(Iconsax.direct_right),
              labelText: UTexts.password,
              hintText: UTexts.newPassword,
            ),
          ),

          const SizedBox(height: 10),

          TextFormField(
            decoration: InputDecoration(
              prefix: Icon(Iconsax.direct_right),
              labelText: UTexts.confirmPassword,
              hintText: UTexts.confirmPassword,
            ),
          ),

          const SizedBox(height: 20),

          Center(
            child: SizedBox(
              // height: 110,
              // width: 90, // image height adjust karo yahan
              child: Image.asset(image, fit: BoxFit.contain),
            ),
          ),
        ],
      ),
    );
  }
}
