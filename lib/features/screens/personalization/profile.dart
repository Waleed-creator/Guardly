import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:mindshield/Utilities/constants/colors.dart';
import 'package:mindshield/Utilities/constants/images.dart';
import 'package:mindshield/Utilities/constants/sizes.dart';
import 'package:mindshield/Utilities/constants/texts.dart';
import 'package:mindshield/common/widgets/button/u_elevated_button.dart';
import 'package:mindshield/features/screens/Child_Dashboard/child_dashboard.dart';
// import 'package:mindshield/features/screens/forgotpassword/widgets/forgotbutton.dart';
// import 'package:line_awesome_flutter/line_awesome_flutter.dart';

class ProfileBodySection extends StatefulWidget {
  const ProfileBodySection({super.key});

  @override
  State<ProfileBodySection> createState() => _PBState();
}

enum UserType { male, female, other }

class _PBState extends State<ProfileBodySection> {
  UserType? selectedUser;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: UColors.white,
      body: SafeArea(
        child: ListView(
          // padding: EdgeInsets.symmetric(horizontal: 9, vertical: 5),
          children: [
            // row for Back Button
            Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                // Back Button **************************
                Padding(
                  padding: EdgeInsets.only(left: 16, right: 16, top: 16),
                  child: Row(
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
                            onPressed: () => Get.to(() => CDashboard()),
                            text: "Skip>>",
                            textColor: UColors.iconPrimary,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),

                Center(
                  child: Column(
                    children: [
                      SizedBox(
                        width: 120,
                        height: 120,
                        child: Container(
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            border: Border.all(
                              color: UColors.borderPrimary,
                              width: 2,
                            ),
                          ),
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(100),
                            child: Image.asset(
                              UImages.defaultProfile,
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                      ),
                      //Spacing
                      SizedBox(height: 6),
                      // Profile Title
                      Text(
                        UTexts.addProfileTitle,
                        style: TextStyle(
                          fontSize: 22,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                      // Profile SubTitle
                      Text(
                        UTexts.tapToAddprofileSubtitle,
                        style: TextStyle(
                          fontSize: 13,
                          fontWeight: FontWeight.w700,
                          color: UColors.subtextSecondaryBold,
                        ),
                      ),
                    ],
                  ),
                ),
                // Mian Body Section
                bodySection(
                  title: UTexts.childName,
                  hintText: UTexts.enterChildName,
                ),
                bodySection(
                  title: UTexts.nickname,
                  hintText: UTexts.enterNickName,
                ),
                bodySection(title: UTexts.age, hintText: UTexts.selectAge),
                bodySection(title: UTexts.dOB, hintText: UTexts.enterDOB),
                // Spacing
                SizedBox(height: 5),
                // Spacing
                //  Gender Section ********************************************
                Padding(
                  padding: EdgeInsetsGeometry.only(
                    left: USizes.defaultSpace,
                    right: USizes.defaultSpace,
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      //  Text
                      Text(
                        UTexts.gender,
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                      // Spacing
                      SizedBox(height: 5),
                      // Gender Selection
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          genderSelection(
                            type: UserType.male,
                            icon: Icons.person_2_outlined,
                            genderTitle: UTexts.male,
                          ),
                          // Spacing
                          SizedBox(width: 5),
                          genderSelection(
                            type: UserType.female,
                            icon: Icons.person_3_outlined,
                            genderTitle: UTexts.female,
                          ),
                          // Spacing
                          SizedBox(width: 5),
                          genderSelection(
                            type: UserType.other,
                            icon: Icons.people_outline_outlined,
                            genderTitle: UTexts.other,
                          ),
                        ],
                      ),
                    ],
                  ),
                ),

                // Image Section ****************************
                SizedBox(height: 3),

                Center(
                  child: SizedBox(
                    height: 160,
                    width: 320, // image height adjust karo yahan
                    child: Image.asset(
                      UImages.whyProfileNeed,
                      fit: BoxFit.contain,
                    ),
                  ),
                ),

                // Continue Section *****************************
                SizedBox(height: 10),

                UElevatedButton.rectangle(
                  text: UTexts.continueButton,
                  onPressed: () => Get.to(() => CDashboard()),
                  backgroundColor: UColors.bprimary,
                  elevation: 2,
                  horizontalMargin: 18,
                ),

                SizedBox(height: 20),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget bodySection({required String title, required String hintText}) {
    return Container(
      margin: const EdgeInsets.only(top: 10),
      padding: const EdgeInsets.only(
        right: USizes.defaultSpace,
        left: USizes.defaultSpace,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Input Header Text
          Text(
            title,
            style: TextStyle(fontSize: 15, fontWeight: FontWeight.w700),
            textAlign: TextAlign.center,
          ),
          // Spacing
          SizedBox(height: 5),
          // Input Field Text
          TextFormField(
            decoration: InputDecoration(
              labelText: hintText,
              fillColor: UColors.white,
              filled: true,
            ),
          ),
        ],
      ),
    );
  }

  Widget genderSelection({
    required UserType type,
    required IconData icon,
    required String genderTitle,
  }) {
    final isSelected = selectedUser == type;
    return GestureDetector(
      onTap: () {
        setState(() {
          selectedUser = type;
        });
      },
      // Gender Selection
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 300),
        padding: EdgeInsets.symmetric(vertical: 16, horizontal: 16),
        decoration: BoxDecoration(
          color: isSelected ? UColors.green_600 : UColors.white,
          borderRadius: BorderRadius.circular(16),
          border: Border.all(
            color: isSelected ? UColors.black : UColors.grey_400,
            width: 1,
          ),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              icon,
              size: 20,
              color: isSelected ? UColors.white : UColors.grey_400,
            ),
            SizedBox(width: 6),
            Text(
              genderTitle,
              style: TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.bold,
                color: isSelected ? UColors.white : UColors.grey_400,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
