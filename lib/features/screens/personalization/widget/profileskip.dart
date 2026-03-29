import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:mindshield/features/screens/forgotpassword/widgets/forgotelevatedbutton.dart';
import 'package:mindshield/Utilities/constants/colors.dart';


class ProfileBackButton extends StatelessWidget {
  const ProfileBackButton({super.key});

  @override
  Widget build(BuildContext context) {
    return UForgotElevatedButton(
      onPressed: () {
        Get.back();
      },
      child: SvgPicture.asset(
        "assets/notification/backward.svg",
        width: 34,
        height: 34,
        colorFilter: const ColorFilter.mode(
          UColors.secondaryBlack,
          BlendMode.srcIn,
        ),
      ),
    );
  }
}