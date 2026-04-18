import 'package:flutter/material.dart';
import 'package:guardly/Utilities/constants/colors.dart';

class TabSection extends StatelessWidget {
  final int selectedIndex;
  final Function(int) onTap;

  const TabSection({
    required this.selectedIndex,
    required this.onTap,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final tabs = ["Daily", "Weekly", "Monthly"];

    return Padding(
      // Screen ke left aur right se margin yahan apply hoga
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Row(
        children: List.generate(tabs.length, (index) {
          return Expanded(
            child: GestureDetector(
              onTap: () => onTap(index),
              child: Container(
                padding: const EdgeInsets.symmetric(vertical: 15),
                // Yahan se horizontal margin khatam kar dein
                decoration: BoxDecoration(
                  color: selectedIndex == index
                      ? UColors.dButtonPrimary
                      : Colors.transparent,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Center(
                  child: Text(
                    tabs[index],
                    style: TextStyle(
                      color: selectedIndex == index
                          ? Colors.white
                          : UColors.dButtonSecondary,
                      fontWeight: selectedIndex == index
                          ? FontWeight.bold
                          : FontWeight.normal,
                    ),
                  ),
                ),
              ),
            ),
          );
        }),
      ),
    );
  }
}
