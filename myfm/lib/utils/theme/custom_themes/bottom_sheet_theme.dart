import 'package:flutter/material.dart';

class TBottomSheetTheme {
  TBottomSheetTheme._();

  // static BottomSheetThemeData lightBottomSheetTheme = BottomSheetThemeData();

  static BottomSheetThemeData darkBottomSheetTheme = BottomSheetThemeData(
    showDragHandle: true,
    backgroundColor: Colors.black,
    modalBackgroundColor: Colors.black,
    constraints: const BoxConstraints(minWidth: double.infinity),
    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5)),
  );
}
