import 'package:flutter/material.dart';
import 'package:guardly/Utilities/constants/colors.dart';

class UTextTheme {
  UTextTheme._(); //To avoid creating instances

  static TextTheme lightTextTheme = TextTheme(
    headlineLarge: TextStyle(
      fontSize: 28,
      fontWeight: FontWeight.bold,
      color: UColors.dark,
    ),
    headlineMedium: TextStyle(
      fontSize: 24,
      fontWeight: FontWeight.w600,
      color: UColors.dark,
    ),
    headlineSmall: TextStyle(
      fontSize: 18,
      fontWeight: FontWeight.w600,
      color: UColors.dark,
    ),

    titleLarge: TextStyle(
      fontSize: 16,
      fontWeight: FontWeight.w600,
      color: UColors.dark,
    ),
    titleMedium: TextStyle(
      fontSize: 16,
      fontWeight: FontWeight.w500,
      color: UColors.dark,
    ),
    titleSmall: TextStyle(
      fontSize: 16,
      fontWeight: FontWeight.w400,
      color: UColors.dark,
    ),

    bodyLarge: TextStyle(
      fontSize: 14,
      fontWeight: FontWeight.w500,
      color: UColors.dark,
    ),
    bodyMedium: TextStyle(
      fontSize: 14,
      fontWeight: FontWeight.normal,
      color: UColors.dark,
    ),
    bodySmall: TextStyle(
      fontSize: 14,
      fontWeight: FontWeight.w500,
      color: UColors.dark.withValues(alpha: 0.5),
    ),

    labelLarge: TextStyle(
      fontSize: 12,
      fontWeight: FontWeight.normal,
      color: UColors.dark,
    ),
    labelMedium: TextStyle(
      fontSize: 12,
      fontWeight: FontWeight.normal,
      color: UColors.dark.withValues(alpha: 0.5),
    ),
  );

  static TextTheme darkTextTheme = TextTheme(
    headlineLarge: TextStyle(
      fontSize: 28,
      fontWeight: FontWeight.bold,
      color: UColors.light,
    ),
    headlineMedium: TextStyle(
      fontSize: 24,
      fontWeight: FontWeight.w600,
      color: UColors.light,
    ),
    headlineSmall: TextStyle(
      fontSize: 18,
      fontWeight: FontWeight.w600,
      color: UColors.light,
    ),

    titleLarge: TextStyle(
      fontSize: 16,
      fontWeight: FontWeight.w600,
      color: UColors.light,
    ),
    titleMedium: TextStyle(
      fontSize: 16,
      fontWeight: FontWeight.w500,
      color: UColors.light,
    ),
    titleSmall: TextStyle(
      fontSize: 16,
      fontWeight: FontWeight.w400,
      color: UColors.light,
    ),

    bodyLarge: TextStyle(
      fontSize: 14,
      fontWeight: FontWeight.w500,
      color: UColors.light,
    ),
    bodyMedium: TextStyle(
      fontSize: 14,
      fontWeight: FontWeight.normal,
      color: UColors.light,
    ),
    bodySmall: TextStyle(
      fontSize: 14,
      fontWeight: FontWeight.w500,
      color: UColors.light.withValues(alpha: 0.5),
    ),

    labelLarge: TextStyle(
      fontSize: 12,
      fontWeight: FontWeight.normal,
      color: UColors.light,
    ),
    labelMedium: TextStyle(
      fontSize: 12,
      fontWeight: FontWeight.normal,
      color: UColors.light.withValues(alpha: 0.5),
    ),
  );
}
