import 'package:flutter/material.dart';
import 'package:myfm/utils/constants/colors.dart';
import 'package:myfm/utils/theme/custom_themes/appbar_theme.dart';
import 'package:myfm/utils/theme/custom_themes/bottom_sheet_theme.dart';
import 'package:myfm/utils/theme/custom_themes/checkbox_theme.dart';
import 'package:myfm/utils/theme/custom_themes/chip_theme.dart';
import 'package:myfm/utils/theme/custom_themes/elevated_button_theme.dart';
import 'package:myfm/utils/theme/custom_themes/navigation_bar_theme.dart';
import 'package:myfm/utils/theme/custom_themes/outlined_button_theme.dart';
import 'package:myfm/utils/theme/custom_themes/switch_theme.dart';
import 'package:myfm/utils/theme/custom_themes/text_button_theme.dart';
import 'package:myfm/utils/theme/custom_themes/text_field_theme.dart';
import 'package:myfm/utils/theme/custom_themes/text_theme.dart';

class TAppTheme {
  TAppTheme._();

  // static ThemeData lightTheme = ThemeData();

  static ThemeData darkTheme = ThemeData(
    useMaterial3: true,
    fontFamily: TTextTheme.fontFamilyLF,
    brightness: Brightness.dark,
    primaryColor: TColors.primary,
    textTheme: TTextTheme.darkTextTheme,
    scaffoldBackgroundColor: TColors.dark,
    appBarTheme: TAppBarTheme.darkAppBarTheme,
    bottomSheetTheme: TBottomSheetTheme.darkBottomSheetTheme,
    checkboxTheme: TCheckboxTheme.darkCheckboxTheme,
    switchTheme: TSwitchTheme.darkTheme,
    chipTheme: TChipTheme.darkChipTheme,
    elevatedButtonTheme: TElevatedButtonTheme.darkElevatedButtonTheme,
    outlinedButtonTheme: TOutlinedButtonTheme.darkOutlinedButtonTheme,
    textButtonTheme: TTextButtonTheme.darkTextButtonTheme,
    inputDecorationTheme: TTextFormFieldTheme.darkInputDecorationTheme,
    navigationBarTheme: TNavigationBarTheme.darkNavigationBarTheme,
  );
}
