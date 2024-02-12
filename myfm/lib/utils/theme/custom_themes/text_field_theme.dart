import 'package:flutter/material.dart';
import 'package:myfm/utils/constants/colors.dart';
import 'package:myfm/utils/constants/sizes.dart';

class TTextFormFieldTheme {
  TTextFormFieldTheme._();

  // static InputDecorationTheme lightInputDecorationTheme = InputDecorationTheme();

  static InputDecorationTheme darkInputDecorationTheme = InputDecorationTheme(
    errorMaxLines: 3,
    prefixIconColor: Colors.grey,
    suffixIconColor: Colors.grey,
    labelStyle: const TextStyle().copyWith(fontSize: 14, color: Colors.white),
    hintStyle: const TextStyle().copyWith(fontSize: 14, color: Colors.white),
    errorStyle: const TextStyle().copyWith(fontStyle: FontStyle.normal),
    floatingLabelStyle: const TextStyle().copyWith(
      color: Colors.white.withOpacity(0.8),
    ),
    filled: true,
    fillColor: TColors.inputFillColor,
    border: const OutlineInputBorder().copyWith(
      borderRadius: BorderRadius.circular(TSizes.borderRadiusMd),
      borderSide: const BorderSide(width: 0),
    ),
    enabledBorder: const OutlineInputBorder().copyWith(
      borderRadius: BorderRadius.circular(TSizes.borderRadiusMd),
      borderSide: const BorderSide(width: 0),
    ),
    focusedBorder: const OutlineInputBorder().copyWith(
      borderRadius: BorderRadius.circular(TSizes.borderRadiusMd),
      borderSide: const BorderSide(width: 2, color: Colors.grey),
    ),
    errorBorder: const OutlineInputBorder().copyWith(
      borderRadius: BorderRadius.circular(TSizes.borderRadiusMd),
      borderSide: const BorderSide(width: 2, color: Colors.red),
    ),
    focusedErrorBorder: const OutlineInputBorder().copyWith(
      borderRadius: BorderRadius.circular(TSizes.borderRadiusMd),
      borderSide: const BorderSide(width: 2, color: Colors.orange),
    ),
  );
}
