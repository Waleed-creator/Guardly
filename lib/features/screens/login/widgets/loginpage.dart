import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
// import 'package:mindshield/features/screens/allowNotification/allow_notification.dart';
import 'package:mindshield/Utilities/constants/sizes.dart';
import 'package:mindshield/Utilities/constants/texts.dart';
import 'package:mindshield/common/widgets/button/rounded_rectangle_forward_elevated_button.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key, required this.image, required this.title});
  final String image;
  final String title;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
        right: USizes.defaultSpace,
        left: USizes.defaultSpace,
        // top: UDeviceHelper.getAppBarHeight(),
        top: 120,
      ),
      child: Column(
        children: [
          /***************
          * HEADER PART *
           ***************/
          // ! Image
          Center(
            child: SizedBox(
              height: 110,
              width: 90, // image height adjust karo yahan
              child: Image.asset(image, fit: BoxFit.contain),
            ),
          ),

          const SizedBox(height: 5),
          // !  Title
          Text(
            title,
            style: Theme.of(context).textTheme.headlineLarge,
            textAlign: TextAlign.center,
          ),

          const SizedBox(height: 20),
          /***************
          * FORM PART *
           ***************/
          TextFormField(
            decoration: InputDecoration(
              prefix: Icon(Iconsax.direct_right),
              labelText: UTexts.email,
              hintText: "Enter your email",
            ),
          ),

          SizedBox(height: USizes.spaceBtwInputFields),

          TextFormField(
            decoration: InputDecoration(
              prefix: Icon(Iconsax.direct_right),
              labelText: UTexts.password,
              hintText: "Enter your Password",
              suffixIcon: Icon(Iconsax.eye),
            ),
          ),

          //         Row
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  Checkbox(value: true, onChanged: (value) {}),
                  Text(UTexts.rememberMe),
                ],
              ),

              //  Forget Password
              TextButton(onPressed: () {}, child: Text(UTexts.forgetPassword)),
            ],
          ),

          SizedBox(height: USizes.spaceBtwSections),
          // SignIn
          UElevatedButton(onPressed: () {}, child: Text(UTexts.signIn)),
          SizedBox(height: USizes.spaceBtwItems / 2),
          // Create Account Button
          UElevatedButton(onPressed: () {}, child: Text(UTexts.createAccount)),

          /***************
          * DIVIDER PART *
           ***************/

          /***************
          * FOOTER PART *
           ***************/
        ],
      ),
    );
  }
}
