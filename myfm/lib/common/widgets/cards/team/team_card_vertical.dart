import 'package:flutter/material.dart';
import 'package:myfm/common/widgets/custom_shapes/containers/rounded_container.dart';
import 'package:myfm/common/widgets/images/rounded_images.dart';
import 'package:myfm/utils/constants/colors.dart';
import 'package:myfm/utils/constants/image_strings.dart';
import 'package:myfm/utils/constants/sizes.dart';
import 'package:myfm/utils/helpers/helper_functions.dart';

class TTeamCardVertical extends StatelessWidget {
  const TTeamCardVertical({super.key});

  @override
  Widget build(BuildContext context) {
    final dark = THelperFunctions.isDarkMode(context);
    return Container(
      width: 180,
      padding: const EdgeInsets.all(4),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(TSizes.teamImageRadius),
        color: dark ? TColors.darkerGrey : TColors.white,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Logo
          TRoundedContainer(
            height: 180,
            padding: const EdgeInsets.all(TSizes.sm),
            backgroundColor: dark ? TColors.dark : TColors.light,
            child: const Stack(
              children: [
                TRoundedImage(
                  imageUrl: TImages.scp,
                  applyImageRadius: true,
                  backgroundColor: Colors.transparent,
                  width: double.infinity,
                  fit: BoxFit.contain,
                ),
              ],
            ),
          ),

          const Padding(
            padding: EdgeInsets.only(left: TSizes.sm, top: TSizes.xs),
            child: Column(
              children: [
                // Name
                Text('Sporting'),

                // Country

                // Year
              ],
            ),
          )
        ],
      ),
    );
  }
}
