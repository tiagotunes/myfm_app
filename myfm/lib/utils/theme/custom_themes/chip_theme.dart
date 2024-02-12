import 'package:flutter/material.dart';

class TChipTheme {
  TChipTheme._();

  // static ChipThemeData lightChipTheme = ChipThemeData();

  static ChipThemeData darkChipTheme = const ChipThemeData(
    disabledColor: Colors.grey,
    labelStyle: TextStyle(color: Colors.white),
    selectedColor: Colors.blue,
    padding: EdgeInsets.symmetric(horizontal: 12.0, vertical: 12),
    checkmarkColor: Colors.white,
  );
}