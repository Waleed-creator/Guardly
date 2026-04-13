import 'package:flutter/material.dart';

class TabSection extends StatelessWidget {
  
  final int selectedIndex;
  final Function(int) onTap;

  const TabSection({required this.selectedIndex, required this.onTap,super.key});

  @override
  Widget build(BuildContext context) {
    final tabs = ["Daily", "Weekly", "Monthly"];

    return Row(
      children: List.generate(tabs.length, (index) {
        return Expanded(
          child: GestureDetector(
            onTap: () => onTap(index),
            child: Container(
              padding: EdgeInsets.all(10),
              color: selectedIndex == index ? Colors.green : Colors.grey[200],
              child: Center(child: Text(tabs[index])),
            ),
          ),
        );
      }),
    );
  }
}
