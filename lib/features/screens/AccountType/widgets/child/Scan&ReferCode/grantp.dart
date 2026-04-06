import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:mindshield/Utilities/constants/colors.dart';
import 'package:mindshield/Utilities/constants/images.dart';
import 'package:mindshield/Utilities/constants/texts.dart';
import 'package:mindshield/features/screens/AccountType/widgets/child/Scan&ReferCode/grantWidget/grantpermission.dart';
import 'package:mindshield/features/screens/personalization/profile.dart';
import '../../../../../../common/widgets/button/u_elevated_button.dart';

class GrantPermission extends StatelessWidget {
  const GrantPermission({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: ListView(
          padding: EdgeInsets.symmetric(horizontal: 9, vertical: 12),
          children: [
            // Top Row
            Row(
              children: [
                Expanded(
                  child: Align(
                    alignment: Alignment.centerLeft,
                    child: //  BackWard Button
                    UElevatedButton.svgOnly(
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
                ),

                Expanded(
                  child: Align(
                    alignment: Alignment.centerRight,
                    child: UElevatedButton.textButton(
                      onPressed: () => Get.to(() => ProfileBodySection()), 
                      text: "Skip>>",
                      textColor: UColors.iconPrimary,

                      ),
                  ),
                ),
              ],
            ),

            // Title
            Text(
              UTexts.grantPermission,
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 28, fontWeight: FontWeight.w600),
            ),

            // Subtitle
            Text(
              UTexts.grantPermissionSubtitle,
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 13, color: UColors.textSecondary),
            ),

            SizedBox(height: 20),

            // Permission List
            PermissionHandler(),
          ],
        ),
      ),
    );
  }
}
