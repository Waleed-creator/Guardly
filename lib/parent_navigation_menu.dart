import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:mindshield/Utilities/constants/colors.dart';
import 'package:mindshield/Utilities/constants/images.dart';

class ParentNavigationMenu extends StatelessWidget {
  const ParentNavigationMenu({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(NavigationController());
    return Scaffold(
      bottomNavigationBar: Obx(
        () => _AnimatedNavBar(
          selectedIndex: controller.selectedIndex.value,
          onIndexChanged: (index) {
            controller.selectedIndex.value = index;
          },
        ),
      ),
    );
  }
}

// ─── Nav Bar ────────────────────────────────────────────────────────────────

class _AnimatedNavBar extends StatelessWidget {
  final int selectedIndex;
  final ValueChanged<int> onIndexChanged;

  const _AnimatedNavBar({
    required this.selectedIndex,
    required this.onIndexChanged,
  });

  static const _items = [
    (image: UImages.home, label: 'Home'),
    (image: UImages.insights, label: 'Insights'),
    (image: UImages.strict, label: 'Strict mode'),
    (image: UImages.noti, label: 'Alerts'),
    (image: UImages.setting, label: 'Settings'),
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: UColors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.07),
            blurRadius: 12,
            offset: const Offset(0, -2),
          ),
        ],
      ),
      child: SafeArea(
        child: SizedBox(
          height: 64,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: List.generate(_items.length, (index) {
              return _NavItem(
                image: _items[index].image,
                label: _items[index].label,
                isSelected: selectedIndex == index,
                onTap: () => onIndexChanged(index),
              );
            }),
          ),
        ),
      ),
    );
  }
}

// ─── Nav Item ───────────────────────────────────────────────────────────────

class _NavItem extends StatelessWidget {
  final String image;
  final String label;
  final bool isSelected;
  final VoidCallback onTap;

  const _NavItem({
    required this.image,
    required this.label,
    required this.isSelected,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    final color = isSelected ? UColors.green_800 : UColors.navigation;

    return GestureDetector(
      onTap: onTap,
      behavior: HitTestBehavior.opaque,
      child: SizedBox(
        width: 70,
        height: 64,
        child: Stack(
          clipBehavior: Clip.hardEdge,
          children: [
            // Icon + Label — center mein
            Positioned.fill(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  // Icon — scale only, easeInOut curve (no overshoot)
                  AnimatedScale(
                    duration: const Duration(milliseconds: 200),
                    curve: Curves.easeInOut, // easeOutBack hata diya
                    scale: isSelected ? 1.12 : 1.0,
                    child: SvgPicture.asset(
                      image,
                      width: 24,
                      height: 24,
                      colorFilter: ColorFilter.mode(color, BlendMode.srcIn),
                    ),
                  ),

                  const SizedBox(height: 4),

                  // Label
                  AnimatedDefaultTextStyle(
                    duration: const Duration(milliseconds: 200),
                    style: TextStyle(
                      fontSize: 10,
                      fontWeight:
                          isSelected ? FontWeight.w700 : FontWeight.w500,
                      color: color,
                    ),
                    child: Text(
                      label,
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                ],
              ),
            ),

            // Underline — bilkul neeche fixed
            Positioned(
              bottom: 5,
              left: 0,
              right: 0,
              child: Center(
                child: AnimatedContainer(
                  duration: const Duration(milliseconds: 250),
                  curve: Curves.easeInOut, // easeOutBack hata diya
                  height: 3,
                  width: isSelected ? 36.0 : 0.0,
                  decoration: BoxDecoration(
                    color: UColors.green_800,
                    borderRadius: const BorderRadius.vertical(
                      top: Radius.circular(2),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// ─── Controller ─────────────────────────────────────────────────────────────

class NavigationController extends GetxController {
  RxInt selectedIndex = 0.obs;
}