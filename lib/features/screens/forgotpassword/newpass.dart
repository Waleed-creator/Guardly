import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:guardly/Utilities/constants/images.dart';
import 'package:guardly/Utilities/constants/texts.dart';
import 'package:guardly/features/screens/forgotpassword/passchanged.dart';
import 'package:guardly/Utilities/constants/sizes.dart';
import 'package:guardly/Utilities/constants/colors.dart';
import 'package:get/get.dart';
import 'package:guardly/common/widgets/button/u_elevated_button.dart';


class NewPassScreen extends StatelessWidget {
  const NewPassScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
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
          // ForgotBackButton(),

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

          Positioned(
            bottom: 10,
            right: 0,
            left: 0,
            child: UElevatedButton.rectangle(
                            text: UTexts.confirmButton,
              onPressed: () => Get.to(() => PassChanged()),
                            backgroundColor: UColors.primary_800,
              elevation: 1,
            )
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
        top: 140,
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

          const SizedBox(height: 15),
          /***************
          * FORM PART *
           ***************/
          TextFormField(
            decoration: InputDecoration(
              // prefix: Icon(Iconsax.direct_right),
              labelText: UTexts.password,
              hintText: UTexts.newPassword,
            ),
          ),

          const SizedBox(height: 10),

          TextFormField(
            decoration: InputDecoration(
              // prefix: Icon(Iconsax.direct_right),
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
