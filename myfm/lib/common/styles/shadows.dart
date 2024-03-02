import 'package:flutter/material.dart';
import 'package:myfm/utils/constants/colors.dart';

class TShadowStyle {
  static final horizontalProductShadow = BoxShadow(
    color: TColors.darkGrey.withOpacity(0.1),
    blurRadius: 50,
    spreadRadius: 7,
    offset: const Offset(0, 2),
  );

  static final verticalProductShadow = BoxShadow(
    color: TColors.darkGrey.withOpacity(0.1),
    blurRadius: 50,
    spreadRadius: 7,
    offset: const Offset(0, 2),
  );

  static List<Shadow> headlineTextShadow = [
    Shadow(
      color: TColors.darkerGrey.withOpacity(0.8),
      offset: const Offset(0, 2),
      blurRadius: 10,
    ),
  ];
}
