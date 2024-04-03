import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:myfm/utils/constants/colors.dart';

class TSwitchTheme {
  TSwitchTheme._();

  // static SwitchThemeData lightTheme = SwitchThemeData()

  static SwitchThemeData darkTheme = SwitchThemeData(
    thumbIcon: MaterialStateProperty.resolveWith(
      (states) => states.contains(MaterialState.selected)
          ? const Icon(
              Icons.check_rounded,
              color: TColors.white,
            )
          : const Icon(
              Iconsax.minus,
              color: TColors.white,
            ),
    ),
    thumbColor: MaterialStateProperty.resolveWith(
      (states) => states.contains(MaterialState.selected)
          ? TColors.primary.withOpacity(0.7)
          : TColors.darkerGrey.withOpacity(0.7),
    ),
    trackOutlineColor: MaterialStateProperty.resolveWith(
      (states) => states.contains(MaterialState.selected)
          ? TColors.primary.withOpacity(0.7)
          : TColors.darkerGrey.withOpacity(0.7),
    ),
    trackColor: MaterialStateProperty.resolveWith((states) =>
        states.contains(MaterialState.selected)
            ? TColors.primary
            : TColors.darkerGrey),
  );
}
