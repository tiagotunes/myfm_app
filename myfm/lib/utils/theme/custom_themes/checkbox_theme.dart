import 'package:flutter/material.dart';
import 'package:myfm/utils/constants/colors.dart';
import 'package:myfm/utils/constants/sizes.dart';

class TCheckboxTheme {
  TCheckboxTheme._();

  // static CheckboxThemeData lightCheckboxTheme = CheckboxThemeData();

  static CheckboxThemeData darkCheckboxTheme = CheckboxThemeData(
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(TSizes.borderRadiusSm),
    ),
    checkColor: MaterialStateProperty.resolveWith((states) {
      if (states.contains(MaterialState.selected)) {
        return TColors.white;
      } else {
        return TColors.black;
      }
    }),
    fillColor: MaterialStateProperty.resolveWith((states) {
      if (states.contains(MaterialState.selected)) {
        return TColors.primary;
      } else {
        return Colors.transparent;
      }
    }),
  );
}
