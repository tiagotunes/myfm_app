import 'package:flutter/material.dart';
import 'package:myfm/utils/constants/colors.dart';

class TOutlinedButtonTheme {
  TOutlinedButtonTheme._();

  // static final lightOutlinedButtonTheme = OutlinedButtonThemeData();

  static final darkOutlinedButtonTheme = OutlinedButtonThemeData(
    style: OutlinedButton.styleFrom(
      elevation: 0,
      foregroundColor: Colors.white,
      side: const BorderSide(color: TColors.buttonPrimary, width: 2.0),
      textStyle: const TextStyle(
        fontSize: 16,
        color: Colors.white,
        fontWeight: FontWeight.w600,
      ),
      padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 20),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5)),
    ),
  );
}
