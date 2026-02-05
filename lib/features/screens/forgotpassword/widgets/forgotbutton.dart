import 'package:flutter/material.dart';
import 'package:mindshield/Utilities/constants/sizes.dart';
// import 'package:flutter_svg/flutter_svg.dart';
// import 'package:mindshield/features/authentication/controllers/onboarding/onboarding_controller.dart';
import 'package:mindshield/Utilities/constants/colors.dart';
import 'package:mindshield/common/widgets/button/rounded_rectangle_forward_elevated_button.dart';

class ForgotButtonContainer extends StatelessWidget {
  const ForgotButtonContainer({super.key, required this.text});
   final String text;

  @override
  Widget build(BuildContext context) {
    return Container(
      // Yahan margin define kar sakte ho
      margin: EdgeInsets.symmetric(
        horizontal: USizes.spaceBtwItems,
        vertical: 0,
      ),
      padding: EdgeInsets.only(bottom: 10), // existing padding
      child: UElevatedButton(
        onPressed: () {},
        child: Text(
          text,
          style: TextStyle(
            color: UColors.textWhite,
            fontWeight: FontWeight.bold,
            fontSize: 18,
          ),
        ),
      ),
    );
  }
}








// import 'package:flutter/material.dart';
// import 'package:mindshield/Utilities/constants/sizes.dart';
// // import 'package:flutter_svg/flutter_svg.dart';
// // import 'package:mindshield/features/authentication/controllers/onboarding/onboarding_controller.dart';
// import 'package:mindshield/Utilities/constants/colors.dart';
// import 'package:mindshield/common/widgets/button/rounded_rectangle_forward_elevated_button.dart';


// class OTPButton extends StatelessWidget {
//   const OTPButton({super.key});

// @override
// Widget build(BuildContext context) {
//   return Align(
//     alignment: Alignment.bottomCenter,
//     child: Container(
//       // Yahan margin define kar sakte ho
//       margin: EdgeInsets.symmetric(horizontal: USizes.spaceBtwItems, vertical: 0),
//       padding: EdgeInsets.only(bottom: 10), // existing padding
//       child: UElevatedButton(
//         onPressed: () {},
//         child: const Text(
//           "Get OTP",
//           style: TextStyle(
//             color: UColors.textWhite,
//             fontWeight: FontWeight.bold,
//             fontSize: 18,
//           ),
//         ),
//       ),
//     ),
//   );
// }

// }













































