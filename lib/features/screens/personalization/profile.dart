import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:mindshield/Utilities/constants/colors.dart';
import 'package:mindshield/Utilities/constants/images.dart';
import 'package:mindshield/features/screens/forgotpassword/widgets/forgotelevatedbutton.dart';
// import 'package:line_awesome_flutter/line_awesome_flutter.dart';

class Profile extends StatelessWidget {
  const Profile({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: UColors.black,
      body: SafeArea(
        child: ListView(
          padding: EdgeInsets.symmetric(horizontal: 9, vertical: 12),
          children: [
            // row for Back Button
            Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Row(
                  children: [
                    Align(alignment: Alignment.centerLeft, child: BackButton()),
                  ],
                ),

                SizedBox(height: 20,),

                Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    SizedBox(
                      width: 120,
                      height: 120,
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(100),
                        child:Image.asset(
                        UImages.defaultProfile,
                        fit: BoxFit.cover,
                      ),
                      )
                    ),
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class BackButton extends StatelessWidget {
  const BackButton({super.key});

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
