import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:myfm/common/widgets/custom_shapes/containers/rounded_container.dart';
import 'package:myfm/utils/constants/colors.dart';
import 'package:myfm/utils/constants/sizes.dart';

class TTransferSeasonIndicator extends StatelessWidget {
  const TTransferSeasonIndicator({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        buildArrowBtn(true, false, true, () {}),
        const TRoundedContainer(
            height: 40,
            showBorder: true,
            borderColor: TColors.dark,
            radius: TSizes.cardRadiusSm,
            radiusLeft: false,
            radiusRight: false,
            padding: EdgeInsets.symmetric(horizontal: TSizes.md),
            backgroundColor: TColors.darkerGrey,
            child: Center(child: Text('2023'))),
        buildArrowBtn(false, true, false, () {})
      ],
    );
  }

  GestureDetector buildArrowBtn(
      bool left, bool right, bool disable, VoidCallback onTap) {
    return GestureDetector(
      onTap: onTap,
      child: TRoundedContainer(
        height: 40,
        width: 40,
        showBorder: true,
        borderColor: TColors.dark,
        radius: TSizes.cardRadiusSm,
        radiusLeft: left,
        radiusRight: right,
        backgroundColor:
            disable ? TColors.darkerGrey.withOpacity(0.5) : TColors.darkerGrey,
        child: Icon(
          left
              ? Iconsax.arrow_left_2
              : right
                  ? Iconsax.arrow_right_3
                  : Iconsax.arrow_up_2,
          color: disable ? TColors.white.withOpacity(0.5) : TColors.white,
          size: TSizes.iconMd,
        ),
      ),
    );
  }
}
