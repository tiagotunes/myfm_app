import 'package:flutter/material.dart';

class TCheckboxTheme {
  TCheckboxTheme._();

  // static CheckboxThemeData lightCheckboxTheme = CheckboxThemeData();

  static CheckboxThemeData darkCheckboxTheme = CheckboxThemeData(
    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(4)),
    checkColor: MaterialStateProperty.resolveWith((states) {
      if (states.contains(MaterialState.selected)) {
        return Colors.white;
      } else {
        return Colors.black;
      }
    }),
    fillColor: MaterialStateProperty.resolveWith((states) {
      if (states.contains(MaterialState.selected)) {
        return const Color(0xFFB10398);
      } else {
        return Colors.transparent;
      }
    }),
  );
}
