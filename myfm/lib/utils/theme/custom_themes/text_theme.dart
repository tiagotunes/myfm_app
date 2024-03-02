import 'package:flutter/material.dart';
import 'package:myfm/utils/constants/colors.dart';
import 'package:myfm/utils/constants/sizes.dart';

class TTextTheme {
  TTextTheme._();

  static String fontFamilyLF = "Libre Franklin";
  static String fontFamilyIBM = "IBM Plex Sans";

  // static TextTheme lightTextTheme = TextTheme();

  static TextTheme darkTextTheme = TextTheme(
    // Headline
    headlineLarge: const TextStyle().copyWith(
        fontSize: 32.0, fontWeight: FontWeight.bold, color: TColors.textWhite),
    headlineMedium: const TextStyle().copyWith(
        fontSize: 24.0, fontWeight: FontWeight.w600, color: TColors.textWhite),
    headlineSmall: const TextStyle().copyWith(
      fontSize: TSizes.fontSizeLg,
      fontWeight: FontWeight.w600,
      color: TColors.textWhite,
    ),
    // Title
    titleLarge: const TextStyle().copyWith(
      fontSize: TSizes.fontSizeMd,
      fontWeight: FontWeight.w600,
      color: TColors.textWhite,
    ),
    titleMedium: const TextStyle().copyWith(
      fontSize: TSizes.fontSizeMd,
      fontWeight: FontWeight.w500,
      color: TColors.textWhite,
    ),
    titleSmall: const TextStyle().copyWith(
      fontSize: TSizes.fontSizeMd,
      fontWeight: FontWeight.w400,
      color: TColors.textWhite,
    ),
    // Body
    bodyLarge: const TextStyle().copyWith(
      fontSize: TSizes.fontSizeSm,
      fontWeight: FontWeight.w500,
      color: TColors.textWhite,
    ),
    bodyMedium: const TextStyle().copyWith(
      fontSize: TSizes.fontSizeSm,
      fontWeight: FontWeight.normal,
      color: TColors.textWhite,
    ),
    bodySmall: const TextStyle().copyWith(
      fontSize: TSizes.fontSizeSm,
      fontWeight: FontWeight.w500,
      color: TColors.textWhite.withOpacity(0.5),
    ),
    // Label
    labelLarge: const TextStyle().copyWith(
      fontSize: TSizes.fontSizeXs,
      fontWeight: FontWeight.normal,
      color: TColors.textWhite,
    ),
    labelMedium: const TextStyle().copyWith(
      fontSize: TSizes.fontSizeXs,
      fontWeight: FontWeight.normal,
      color: TColors.textWhite.withOpacity(0.5),
    ),
  );
}
