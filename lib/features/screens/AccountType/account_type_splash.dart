import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:mindshield/Utilities/constants/colors.dart';
import 'package:mindshield/Utilities/constants/images.dart';
import 'package:mindshield/Utilities/constants/sizes.dart';
import 'package:mindshield/Utilities/constants/texts.dart';
import 'package:mindshield/features/screens/AccountType/widgets/Parent/parent.dart';
import 'package:mindshield/features/screens/AccountType/widgets/child/child.dart';
import 'package:get/get.dart';

import '../../../common/widgets/button/u_elevated_button.dart'
    show UElevatedButton;

// /*************************
//  * //   MAIN BRAIN CLASS *
//  *************************/

class ChooseAccount extends StatefulWidget {
  const ChooseAccount({super.key});

  @override
  State<ChooseAccount> createState() => _ChooseAccountState();
}

enum UserType { parent, child }

class _ChooseAccountState extends State<ChooseAccount> {
  UserType? selectedUser;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Padding(
            padding: EdgeInsets.only(
              right: USizes.defaultSpace,
              left: USizes.defaultSpace,
              top: 140,
            ),
            child: Column(
              children: [
                Text(
                  UTexts.accountTypeTitle,
                  textAlign: TextAlign.center,
                  style: const TextStyle(
                    fontSize: 28,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 30),

                buildUserCard(
                  type: UserType.parent,
                  title: UTexts.parentTitle,
                  subtitle: UTexts.parentSubTitle,
                  image: UImages.parent1,
                ),

                const SizedBox(height: 16),

                buildUserCard(
                  type: UserType.child,
                  title: UTexts.childTitle,
                  subtitle: UTexts.childSubTitle,
                  image: UImages.child1,
                ),
              ],
            ),
          ),

          // const Positioned(top: 40, left: 15, child: ForgotBackButton()),

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
            bottom: 25,
            left: 15,
            right: 15,
            child: UElevatedButton.rectangle(
              onPressed: () {
                if (selectedUser == UserType.parent) {
                  Get.to(() => const ParentScreen());
                } else if (selectedUser == UserType.child) {
                  Get.to(() => const ChildScreen());
                }
              },
              text: UTexts.continueButton,
              backgroundColor: UColors.bprimary,
              horizontalMargin: 8,
            ),
          ),
        ],
      ),
    );
  }

  // 🔥 USER CARD
  Widget buildUserCard({
    required UserType type,
    required String title,
    required String subtitle,
    required String image,
  }) {
    final bool isSelected = selectedUser == type;

    return GestureDetector(
      onTap: () {
        setState(() {
          selectedUser = type;
        });
      },
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 600),
        padding: const EdgeInsets.fromLTRB(16, 16, 16, 5),
        decoration: BoxDecoration(
          color: isSelected ? Colors.teal : Colors.white,
          borderRadius: BorderRadius.circular(16),
          border: Border.all(
            color: isSelected ? Colors.teal : Colors.grey.shade300,
            width: 1.2,
          ),
          boxShadow: const [BoxShadow(color: Colors.black12, blurRadius: 6)],
        ),
        child: Stack(
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          title,
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                            color: isSelected ? Colors.white : Colors.black,
                          ),
                        ),
                        const SizedBox(height: 4),
                        Text(
                          subtitle,
                          style: TextStyle(
                            fontSize: 12,
                            color: isSelected ? Colors.white70 : Colors.black54,
                          ),
                        ),
                      ],
                    ),
                    Icon(
                      isSelected
                          ? Icons.radio_button_checked
                          : Icons.radio_button_off,
                      color: isSelected ? Colors.white : Colors.grey,
                    ),
                  ],
                ),

                if (isSelected) const SizedBox(height: 170),
              ],
            ),

            if (isSelected)
              Positioned(
                bottom: 0,
                left: 0,
                right: 0,
                child: Image.asset(image, height: 160, fit: BoxFit.contain),
              ),
          ],
        ),
      ),
    );
  }
}
