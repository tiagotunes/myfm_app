import 'package:flutter/material.dart';
import 'package:myfm/utils/constants/colors.dart';

class TNavigationBarTheme {
  TNavigationBarTheme._();

  // static const NavigationBarThemeData lightNavigationBarTheme

  static NavigationBarThemeData darkNavigationBarTheme = NavigationBarThemeData(
    height: 80,
    elevation: 0,
    backgroundColor: TColors.black,
    indicatorColor: TColors.darkGrey.withOpacity(0.3),
  );
}
