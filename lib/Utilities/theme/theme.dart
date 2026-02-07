import 'package:flutter/material.dart';
import 'package:mindshield/Utilities/theme/widgets_theme/text_theme.dart';
import 'package:mindshield/Utilities/theme/widgets_theme/chip_theme.dart';
import 'package:mindshield/Utilities/theme/widgets_theme/appbar_theme.dart';
import 'package:mindshield/Utilities/theme/widgets_theme/bottem_sheet_theme.dart';
import 'package:mindshield/Utilities/theme/widgets_theme/checkbox_theme.dart';
import 'package:mindshield/Utilities/theme/widgets_theme/elevatedbutton_theme.dart';
import 'package:mindshield/Utilities/theme/widgets_theme/outline_button_theme.dart';
import 'package:mindshield/Utilities/theme/widgets_theme/text_field_theme.dart';

/// ---------------- COLORS ----------------
class UColors {
  static const Color dark = Color(0xFF1F2937);
  static const Color light = Color(0xFFFFFFFF);

  // Screen Background Colors
  static const Color primary_600 = Color.fromARGB(255, 205, 255, 250);
  static const Color primary_800 = Color.fromARGB(255, 77, 182, 172);
  static const Color secondary = Color(0xFFFFFFFF);

  // Text colors
  static const Color textPrimary500 = Color.fromARGB(255, 24, 24, 24);
  static const Color textPrimary600 = Color.fromARGB(31, 41, 55, 0);
  static const Color textPrimary800 = Color.fromARGB(255, 31, 41, 55);
  static const Color textSecondary = Color.fromARGB(255, 121, 120, 120);
  static const Color textWhite = Color(0xFFF6F6F6);
  static const Color green_600 = Color.fromRGBO(77, 182, 172, 1);
  static const Color grey_400 = Color.fromRGBO(189, 189, 189, 1);

  // Indicator Colors
  static const Color iPrimary = Color(0xFF4DB6AC);
  static const Color iSecondary = Colors.grey;

  // Theme color Dark/White Mode

  static const Color dark_500 = Color.fromARGB(75, 39, 39, 39);

  // Button Colors
  static const Color bprimary = Color(0xFF4DB6AC);
  static const Color bSecondary = Color.fromARGB(207, 176, 226, 224);
  static const Color secondaryBlack = Color.fromARGB(255, 37, 36, 36);
  static const Color secondaryWhite = Color(0xFFF6F6F6);

  // URL Link
  static const Color lprimary = Colors.teal;
}

/// ---------------- APP THEME ----------------
class UAppTheme {
  // private constructor
  UAppTheme._();

  // ---------------- LIGHT THEME ----------------
  static ThemeData lightTheme = ThemeData(
    useMaterial3: true,
    brightness: Brightness.light,
    textTheme: UTextTheme.lightTextTheme, // Light Text Theme
    scaffoldBackgroundColor:
        UColors.light, // All Screens Background Color Means Root Ui
    chipTheme: UChipTheme
        .lightChipTheme, // Button , container , image background color
    appBarTheme: UAppbarTheme.lightAppbarTheme, // App Bar Theme
    checkboxTheme: UCheckboxTheme.lightCheckboxTheme,
    bottomSheetTheme: UBottemSheetTheme.lightBottemSheetTheme,
    elevatedButtonTheme: UElevatedButtonTheme.lightElevatedButtonTheme,
    // fontFamily: ,
    outlinedButtonTheme: UOutlineButtonTheme.lightOutlineButtonTheme,
    inputDecorationTheme: UTextFormFieldTheme.lightInputDecorationTheme,
    //  Light BackGround Themes
    colorScheme: const ColorScheme.light(
      surface: Colors.white, // Backgroung Color
      onSurface: Colors.black, // Text Theme Color
    ),
  );

  // ---------------- DARK THEME ----------------
  static ThemeData darkTheme = ThemeData(
    useMaterial3: true,
    brightness: Brightness.dark,
    textTheme: UTextTheme.darkTextTheme, // Dark Text Theme
    scaffoldBackgroundColor: Colors.black,
    chipTheme: UChipTheme.darkChipTheme,
    appBarTheme: UAppbarTheme.darkAppbarTheme,
    checkboxTheme: UCheckboxTheme.darkCheckboxTheme,
    bottomSheetTheme: UBottemSheetTheme.darkBottemSheetTheme,
    elevatedButtonTheme: UElevatedButtonTheme.darkElevatedButtonTheme,
    // fontFamily: ,
    outlinedButtonTheme: UOutlineButtonTheme.darkOutlineButtonTheme,
    inputDecorationTheme: UTextFormFieldTheme.darkInputDecorationTheme,
    //  Dark BackGround Themes
    colorScheme: const ColorScheme.dark(
      surface: Colors.black,
      onSurface: Colors.white,
    ),
  );
}
