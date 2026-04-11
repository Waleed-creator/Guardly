import 'package:flutter/material.dart';
import 'package:guardly/Utilities/constants/colors.dart';

class UChipTheme {
  UChipTheme._(); //To avoid creating instances

  static ChipThemeData lightChipTheme = ChipThemeData(
    disabledColor: Colors.grey.withValues(),
    labelStyle: TextStyle(color: Colors.white),
    selectedColor: UColors.light,
    padding: const EdgeInsets.symmetric(horizontal: 12.0, vertical: 8.0),
    checkmarkColor: UColors.light,
  );


  static ChipThemeData darkChipTheme = ChipThemeData(
    disabledColor: Colors.grey.withValues(),
    labelStyle: TextStyle(color: Colors.white),
    selectedColor: UColors.light,
    padding: const EdgeInsets.symmetric(horizontal: 12.0, vertical: 8.0),
    checkmarkColor: UColors.light,
  );

}


