import 'package:flutter/material.dart';
import 'package:myfm/utils/constants/colors.dart';

class TChipTheme {
  TChipTheme._();

  // static ChipThemeData lightChipTheme = ChipThemeData();

  static ChipThemeData darkChipTheme = const ChipThemeData(
    disabledColor: TColors.darkerGrey,
    labelStyle: TextStyle(color: TColors.white),
    selectedColor: TColors.primary,
    padding: EdgeInsets.symmetric(horizontal: 12.0, vertical: 12.0),
    checkmarkColor: TColors.white,
  );
}
