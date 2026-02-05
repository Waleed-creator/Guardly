import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
// import 'package:mindshield/features/screens/allowNotification/allow_notification.dart';
import 'package:mindshield/Utilities/constants/sizes.dart';
import 'package:mindshield/Utilities/constants/colors.dart';
import 'package:mindshield/Utilities/constants/texts.dart';

class ForgotPage extends StatelessWidget {
  const ForgotPage({super.key, required this.title, required this.subtitle});
  final String title;
  final String subtitle;
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
              labelText: UTexts.email,
              hintText: "Email here",
            ),
          ),
        ],
      ),
    );
  }
}
