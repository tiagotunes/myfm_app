import 'package:flutter/material.dart';

class TTextTheme {
  TTextTheme._();

  static String fontFamilyLF = "Libre Franklin";
  static String fontFamilyIBM = "IBM Plex Sans";
  static double fontSizeTitle = 18.0;
  static double fontSizeBody = 16.0;
  static double fontSizeLabel = 14.0;

  // static TextTheme lightTextTheme = TextTheme();

  static TextTheme darkTextTheme = TextTheme(
    // Headline
    headlineLarge: const TextStyle().copyWith(
        fontSize: 32.0, fontWeight: FontWeight.bold, color: Colors.white),
    headlineMedium: const TextStyle().copyWith(
        fontSize: 28.0, fontWeight: FontWeight.w600, color: Colors.white),
    headlineSmall: const TextStyle().copyWith(
        fontSize: 20.0, fontWeight: FontWeight.w600, color: Colors.white),
    // Title
    titleLarge: const TextStyle().copyWith(
      fontSize: fontSizeTitle,
      fontWeight: FontWeight.w600,
      color: Colors.white,
    ),
    titleMedium: const TextStyle().copyWith(
      fontSize: fontSizeTitle,
      fontWeight: FontWeight.w500,
      color: Colors.white,
    ),
    titleSmall: const TextStyle().copyWith(
      fontSize: fontSizeTitle,
      fontWeight: FontWeight.w400,
      color: Colors.white,
    ),
    // Body
    bodyLarge: const TextStyle().copyWith(
      fontSize: fontSizeBody,
      fontWeight: FontWeight.w500,
      color: Colors.white,
    ),
    bodyMedium: const TextStyle().copyWith(
      fontSize: fontSizeBody,
      fontWeight: FontWeight.normal,
      color: Colors.white,
    ),
    bodySmall: const TextStyle().copyWith(
      fontSize: fontSizeBody,
      fontWeight: FontWeight.w500,
      color: Colors.white.withOpacity(0.5),
    ),
    // Label
    labelLarge: const TextStyle().copyWith(
      fontSize: fontSizeLabel,
      fontWeight: FontWeight.normal,
      color: Colors.white,
    ),
    labelMedium: const TextStyle().copyWith(
      fontSize: fontSizeLabel,
      fontWeight: FontWeight.normal,
      color: Colors.white.withOpacity(0.5),
    ),
  );
}
