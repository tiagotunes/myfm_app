import 'package:flutter/material.dart';
import 'package:myfm/utils/constants/colors.dart';

class TTextButtonTheme {
  TTextButtonTheme._();

  // static TextButtonThemeData lightTextButtonTheme = TextButtonThemeData();

  static TextButtonThemeData darkTextButtonTheme = TextButtonThemeData(
    style: TextButton.styleFrom(
      // elevation: 0,
      foregroundColor: TColors.buttonPrimary,
      // backgroundColor: const Color(0xFFB10398),
      // disabledForegroundColor: Colors.grey,
      // disabledBackgroundColor: Colors.grey,
      // side: const BorderSide(color: Color(0xFFB10398)),
      // padding: const EdgeInsets.symmetric(vertical: 18),
      textStyle: const TextStyle(
        fontSize: 15,
        fontWeight: FontWeight.w600,
      ),
    ),
  );
}
