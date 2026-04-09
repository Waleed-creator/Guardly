import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:mindshield/Utilities/constants/colors.dart';
import 'package:mindshield/Utilities/constants/images.dart';
// import 'package:iconsax/iconsax.dart';

class ParentNavigationMenu extends StatelessWidget {
  const ParentNavigationMenu({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: NavigationBar(
        elevation: 0,
        backgroundColor: UColors.white,
        indicatorColor: UColors.white.withValues(alpha: 0.1),
        destinations: [
          NavigationDestination(
            icon: SvgPicture.asset(
              UImages.home,
              width: 24,
              height: 24,
              colorFilter: ColorFilter.mode(UColors.black, BlendMode.darken),
            ),
            label: 'Home',
          ),
          NavigationDestination(
            icon: SvgPicture.asset(
              UImages.insights,
              width: 24,
              height: 24,
              colorFilter: ColorFilter.mode(UColors.black, BlendMode.darken),
            ),
            label: 'Insights',
          ),
          NavigationDestination(
            icon: SvgPicture.asset(
              UImages.strict,
              width: 24,
              height: 24,
              colorFilter: ColorFilter.mode(UColors.black, BlendMode.darken),
            ),
            label: 'Strict mode',
          ),
          NavigationDestination(
            icon: SvgPicture.asset(
              UImages.noti,
              width: 24,
              height: 24,
              colorFilter: ColorFilter.mode(UColors.black, BlendMode.darken),
            ),
            label: 'Alerts',
          ),
          NavigationDestination(
            icon: SvgPicture.asset(
              UImages.setting,
              width: 24,
              height: 24,
              colorFilter: ColorFilter.mode(UColors.black, BlendMode.darken),
            ),
            label: 'Settings',
          ),
        ],
      ),
    );
  }
}
