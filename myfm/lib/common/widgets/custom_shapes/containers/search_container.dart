import 'package:flutter/material.dart';
import 'package:myfm/utils/constants/colors.dart';
import 'package:myfm/utils/constants/sizes.dart';
import 'package:myfm/utils/device/device_utility.dart';
import 'package:myfm/utils/helpers/helper_functions.dart';

class TSearchContainer extends StatelessWidget {
  const TSearchContainer({
    super.key,
    required this.text,
    this.icon = Icons.search_outlined,
    this.showBackground = true,
    this.showBorder = true,
  });

  final String text;
  final IconData? icon;
  final bool showBackground, showBorder;

  @override
  Widget build(BuildContext context) {
    final dark = THelperFunctions.isDarkMode(context);
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: TSizes.defaultSpace,
      ),
      child: Container(
        width: TDeviceUtils.getScreenWidth(),
        padding: const EdgeInsets.all(TSizes.md),
        decoration: BoxDecoration(
          color: showBackground
              ? dark
                  ? TColors.dark
                  : TColors.light
              : Colors.transparent,
          borderRadius: BorderRadius.circular(TSizes.borderRadiusLg),
          border: showBorder ? Border.all(color: TColors.grey) : null,
        ),
        child: Row(
          children: [
            Icon(
              icon,
              color: TColors.grey,
            ),
            const SizedBox(width: TSizes.spaceBtwItems),
            Text(
              text,
              style: Theme.of(context).textTheme.bodySmall,
            ),
          ],
        ),
      ),
    );
  }
}
