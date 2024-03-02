import 'package:flutter/material.dart';
import 'package:myfm/utils/constants/colors.dart';
import 'package:myfm/utils/constants/sizes.dart';

class TTextButtonTheme {
  TTextButtonTheme._();

  // static TextButtonThemeData lightTextButtonTheme = TextButtonThemeData();

  static TextButtonThemeData darkTextButtonTheme = TextButtonThemeData(
    style: TextButton.styleFrom(
      foregroundColor: TColors.buttonPrimary,
      textStyle: const TextStyle(
        fontSize: TSizes.fontSizeSm,
        fontWeight: FontWeight.w600,
      ),
    ),
  );
}
