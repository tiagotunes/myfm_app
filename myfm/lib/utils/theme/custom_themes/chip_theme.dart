import 'package:flutter/material.dart';
import 'package:myfm/utils/constants/colors.dart';

class TChipTheme {
  TChipTheme._();

  // static ChipThemeData lightChipTheme = ChipThemeData();

  static ChipThemeData darkChipTheme = const ChipThemeData(
    disabledColor: Colors.grey,
    labelStyle: TextStyle(color: Colors.white),
    selectedColor: TColors.primary,
    padding: EdgeInsets.symmetric(horizontal: 12.0, vertical: 12.0),
    checkmarkColor: Colors.white,
  );
}
