import 'package:flutter/material.dart';
import 'package:myfm/utils/constants/sizes.dart';

class TSpacingStyles {
  static const EdgeInsetsGeometry paddingWithAppBarHeight = EdgeInsets.fromLTRB(
    TSizes.defaultSpace,
    TSizes.appBarHeight,
    TSizes.defaultSpace,
    TSizes.defaultSpace,
  );

  static const EdgeInsetsGeometry paddingFormContainer = EdgeInsets.fromLTRB(
    TSizes.defaultSpace / 2,
    TSizes.defaultSpace * 2,
    TSizes.defaultSpace / 2,
    TSizes.defaultSpace * 3,
  );
}
