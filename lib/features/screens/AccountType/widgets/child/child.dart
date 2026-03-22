import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:mindshield/Utilities/constants/images.dart';
import 'package:mindshield/Utilities/constants/texts.dart';
import 'package:mindshield/Utilities/theme/theme.dart';
import 'package:mindshield/common/widgets/button/rounded_rectangle_forward_elevated_button.dart';
import 'package:mindshield/features/screens/AccountType/account_type_splash.dart';
import 'package:mindshield/features/screens/AccountType/widgets/child/Scan&ReferCode/refer.dart';
import 'package:mindshield/features/screens/AccountType/widgets/child/Scan&ReferCode/scan.dart';
import 'package:mindshield/features/screens/forgotpassword/widgets/forgotbackbutton.dart';

// /*************************
//  * //   MAIN BRAIN CLASS *
//  *************************/

class ChildScreen extends StatefulWidget {
  const ChildScreen({super.key});

  @override
  State<ChildScreen> createState() => _ChildHelperScreenState();
}

enum UserType { scan, urf }

class _ChildHelperScreenState extends State<ChildScreen> {
  UserType? selectedUser;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Padding(
            padding: EdgeInsets.only(right: 40, left: 40, top: 160),
            child: Column(
              children: [
                //  Text
                Text(
                  UTexts.sHTP,
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 27,
                    fontWeight: FontWeight.bold,
                    color: UColors.textPrimary800,
                  ),
                ),

                const SizedBox(height: 90),

                buildUserCard(
                  type: UserType.scan,
                  bSubtitle: UTexts.sQRCode,
                  bImage: UImages.scan,
                ),

                buildUserCard(
                  type: UserType.urf,
                  bSubtitle: UTexts.uRF,
                  bImage: UImages.otpPass,
                ),
              ],
            ),
          ),

          ForgotBackButton(),

          Positioned(
            bottom: 25,
            left: 15,
            right: 15,
            child: UElevatedButton(
              onPressed: () {
                if (selectedUser == UserType.scan) {
                  Get.to(() => ChildScan());
                } else if (selectedUser == UserType.urf) {
                  Get.to(() => CReferCode());
                }
              },
              child: Text(UTexts.continueButton),
            ),
          ),
        ],
      ),
    );
  }

  Widget buildUserCard({
    required UserType type,
    required bSubtitle,
    required bImage,
  }) {
    final bool isSelected = selectedUser == type;
    return GestureDetector(
      onTap: () {
        setState(() {
          selectedUser = type;
        });
      },
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 300),
        padding: const EdgeInsets.all(16),
        margin: const EdgeInsets.only(top: 5),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(16),
          border: Border(
            bottom: BorderSide(
              color: isSelected ? UColors.bprimary : Colors.white,
              width: 5,
            ),
          ),
          // boxShadow: [
          //   BoxShadow(
          //     color: Colors.black12,
          //     blurRadius: 6,
          //     offset: Offset(0, 4),
          //     spreadRadius: -2, // sides kam karta hai
          //   ),
          // ],
        ),
        child: Stack(
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  // mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        SvgPicture.asset(
                          bImage,
                          width: 34,
                          height: 34,
                          colorFilter: ColorFilter.mode(
                            isSelected ? UColors.bprimary : UColors.dark_500,
                            BlendMode.srcIn,
                          ),
                        ),

                        // OTP Text
                        Padding(
                          padding: EdgeInsets.only(left: 10),
                          child: Text(
                            bSubtitle,
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                              letterSpacing: 2,
                              color: isSelected
                                  ? UColors.bprimary
                                  : UColors.dark_500,
                            ),
                          ),
                        ),
                        if (isSelected) const SizedBox(height: 0),
                      ],
                    ),
                  ],
                ),
                // Scan Button
              ],
            ),
          ],
        ),
      ),
    );
  }
}
