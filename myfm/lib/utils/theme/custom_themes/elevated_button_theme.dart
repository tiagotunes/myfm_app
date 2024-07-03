import 'package:flutter/material.dart';
import 'package:myfm/utils/constants/colors.dart';
import 'package:myfm/utils/constants/sizes.dart';

class TElevatedButtonTheme {
  TElevatedButtonTheme._();

  // static ElevatedButtonThemeData lightElevatedButtonTheme = ElevatedButtonThemeData();

  static ElevatedButtonThemeData darkElevatedButtonTheme =
      ElevatedButtonThemeData(
    style: ElevatedButton.styleFrom(
      elevation: 0,
      foregroundColor: TColors.white,
      backgroundColor: TColors.buttonPrimary,
      disabledForegroundColor: TColors.darkGrey,
      disabledBackgroundColor: TColors.darkGrey,
      side: const BorderSide(color: TColors.buttonPrimary),
      padding: const EdgeInsets.symmetric(vertical: 16),
      textStyle: const TextStyle(
        fontSize: TSizes.fontSizeMd,
        color: TColors.white,
        fontWeight: FontWeight.w600,
      ),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(TSizes.buttonRadius),
      ),
    ),
  );
}
