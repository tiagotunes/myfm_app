import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:myfm/utils/constants/colors.dart';

class TFormDivider extends StatelessWidget {
  const TFormDivider({
    super.key,
    required this.dark,
  });

  final bool dark;
  static double outIndent = 30.0;
  static double inIndent = 10.0;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Flexible(
          child: Divider(
            color: dark ? TColors.darkGrey : TColors.grey,
            thickness: 2,
            indent: outIndent,
            endIndent: inIndent,
          ),
        ),
        Text(
          "Or Sign in with".capitalize!,
          style: Theme.of(context).textTheme.labelMedium,
        ),
        Flexible(
          child: Divider(
            color: dark ? TColors.darkGrey : TColors.grey,
            thickness: 2,
            indent: inIndent,
            endIndent: outIndent,
          ),
        ),
      ],
    );
  }
}
