import 'package:flutter/material.dart';
import 'package:myfm/utils/constants/colors.dart';
import 'package:myfm/utils/constants/sizes.dart';

class TBottomSheetTheme {
  TBottomSheetTheme._();

  // static BottomSheetThemeData lightBottomSheetTheme = BottomSheetThemeData();

  static BottomSheetThemeData darkBottomSheetTheme = BottomSheetThemeData(
    showDragHandle: true,
    backgroundColor: TColors.black,
    modalBackgroundColor: TColors.black,
    constraints: const BoxConstraints(minWidth: double.infinity),
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(TSizes.bottomSheetRadius),
    ),
  );
}
