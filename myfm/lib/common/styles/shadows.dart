import 'package:flutter/material.dart';
import 'package:myfm/utils/constants/colors.dart';

class TShadowStyle {
  static List<Shadow> headlineTextShadow = [
    Shadow(
      color: TColors.darkerGrey.withOpacity(0.8),
      offset: const Offset(0, 2),
      blurRadius: 10,
    ),
  ];
}
