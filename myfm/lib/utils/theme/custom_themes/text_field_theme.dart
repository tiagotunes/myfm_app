import 'package:flutter/material.dart';
import 'package:myfm/utils/constants/colors.dart';
import 'package:myfm/utils/constants/sizes.dart';

class TTextFormFieldTheme {
  TTextFormFieldTheme._();

  // static InputDecorationTheme lightInputDecorationTheme = InputDecorationTheme();

  static InputDecorationTheme darkInputDecorationTheme = InputDecorationTheme(
    errorMaxLines: 3,
    prefixIconColor: TColors.darkGrey,
    suffixIconColor: TColors.darkGrey,
    labelStyle: const TextStyle()
        .copyWith(fontSize: TSizes.fontSizeSm, color: TColors.white),
    hintStyle: const TextStyle()
        .copyWith(fontSize: TSizes.fontSizeSm, color: TColors.white),
    errorStyle: const TextStyle().copyWith(fontStyle: FontStyle.normal),
    floatingLabelStyle: const TextStyle().copyWith(
      color: TColors.white.withOpacity(0.8),
    ),
    filled: true,
    fillColor: TColors.inputFieldBackground,
    border: const OutlineInputBorder().copyWith(
      borderRadius: BorderRadius.circular(TSizes.borderRadiusMd),
      borderSide: const BorderSide(
        width: 1,
        color: TColors.inputFieldBackground,
      ),
    ),
    enabledBorder: const OutlineInputBorder().copyWith(
      borderRadius: BorderRadius.circular(TSizes.borderRadiusMd),
      borderSide: const BorderSide(
        width: 1,
        color: TColors.inputFieldBackground,
      ),
    ),
    disabledBorder: const OutlineInputBorder().copyWith(
      borderRadius: BorderRadius.circular(TSizes.borderRadiusMd),
      borderSide: BorderSide(
        width: 1,
        color: TColors.inputFieldBackground.withOpacity(0.4),
      ),
    ),
    focusedBorder: const OutlineInputBorder().copyWith(
      borderRadius: BorderRadius.circular(TSizes.borderRadiusMd),
      borderSide: const BorderSide(width: 1, color: TColors.white),
    ),
    errorBorder: const OutlineInputBorder().copyWith(
      borderRadius: BorderRadius.circular(TSizes.borderRadiusMd),
      borderSide: const BorderSide(width: 2, color: TColors.error),
    ),
    focusedErrorBorder: const OutlineInputBorder().copyWith(
      borderRadius: BorderRadius.circular(TSizes.borderRadiusMd),
      borderSide: const BorderSide(width: 2, color: TColors.warning),
    ),
  );
}
