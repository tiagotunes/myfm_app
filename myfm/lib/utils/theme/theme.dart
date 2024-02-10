import 'package:flutter/material.dart';
import 'package:myfm/utils/theme/custom_themes/appbar_theme.dart';
import 'package:myfm/utils/theme/custom_themes/bottom_sheet_theme.dart';
import 'package:myfm/utils/theme/custom_themes/checkbox_theme.dart';
import 'package:myfm/utils/theme/custom_themes/chip_theme.dart';
import 'package:myfm/utils/theme/custom_themes/elevated_button_theme.dart';
import 'package:myfm/utils/theme/custom_themes/outlined_button_theme.dart';
import 'package:myfm/utils/theme/custom_themes/text_field_theme.dart';
import 'package:myfm/utils/theme/custom_themes/text_theme.dart';

class TAppTheme {
  TAppTheme._();

  // static ThemeData lightTheme = ThemeData();

  static ThemeData darkTheme = ThemeData(
    useMaterial3: true,
    fontFamily: 'Libre Franklin',
    brightness: Brightness.dark,
    primaryColor: Colors.blue,
    textTheme: TTextTheme.darkTextTheme,
    scaffoldBackgroundColor: const Color(0xFF191919),
    appBarTheme: TAppBarTheme.darkAppBarTheme,
    bottomSheetTheme: TBottomSheetTheme.darkBottomSheetTheme,
    checkboxTheme: TCheckboxTheme.darkCheckboxTheme,
    chipTheme: TChipTheme.darkChipTheme,
    elevatedButtonTheme: TElevatedButtonTheme.darkElevatedButtonTheme,
    outlinedButtonTheme: TOutlinedButtonTheme.darkOutlinedButtonTheme,
    inputDecorationTheme: TTextFormFieldTheme.darkInputDecorationTheme,
  );
}
