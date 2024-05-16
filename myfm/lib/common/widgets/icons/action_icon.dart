import 'package:flutter/material.dart';
import 'package:myfm/utils/constants/colors.dart';
import 'package:myfm/utils/constants/sizes.dart';

class ActionIcon extends StatelessWidget {
  const ActionIcon({
    super.key,
    required this.onPressed,
    this.primaryColor = true,
    required this.icon,
  });

  final VoidCallback onPressed;
  final bool primaryColor;
  final IconData icon;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Container(
        padding: const EdgeInsets.all(TSizes.sm),
        decoration: BoxDecoration(
          color: primaryColor
              ? TColors.buttonPrimary
              : TColors.darkGrey.withOpacity(0.2),
          borderRadius: BorderRadius.circular(5),
        ),
        child: Icon(icon),
      ),
    );
  }
}
