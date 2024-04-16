import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:myfm/common/widgets/custom_shapes/containers/rounded_container.dart';
import 'package:myfm/common/widgets/images/rounded_image.dart';
import 'package:myfm/common/widgets/text/card_team_title_text.dart';
import 'package:myfm/common/widgets/text/label_text.dart';
import 'package:myfm/utils/constants/colors.dart';
import 'package:myfm/utils/constants/image_strings.dart';
import 'package:myfm/utils/constants/sizes.dart';
import 'package:myfm/utils/helpers/helper_functions.dart';

class TPlayerCardVertical extends StatelessWidget {
  const TPlayerCardVertical({
    super.key,
    required this.name,
    required this.position,
    required this.age,
    this.number,
  });

  final String name, position;
  final int age;
  final int? number;

  @override
  Widget build(BuildContext context) {
    final dark = THelperFunctions.isDarkMode(context);
    return GestureDetector(
      onTap: () {},
      child: Container(
        width: TSizes.playerCardVerticalWidth,
        padding: const EdgeInsets.all(TSizes.xs),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(
            TSizes.teamImageRadius,
          ),
          color: dark ? TColors.darkerGrey : TColors.white,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Player Image
            TRoundedContainer(
              height: TSizes.playerImageHeight,
              backgroundColor: dark ? TColors.dark : TColors.light,
              child: Stack(
                children: [
                  const TRoundedImage(
                    imageUrl: TImages.player,
                    applyImageRadius: true,
                    width: double.infinity,
                    padding: EdgeInsets.fromLTRB(
                      TSizes.lg,
                      TSizes.lg,
                      TSizes.lg,
                      0,
                    ),
                    fit: BoxFit.contain,
                  ),

                  // Nation Flag
                  const Positioned(
                    top: TSizes.sm,
                    right: TSizes.sm,
                    child: Icon(
                      Iconsax.flag,
                      color: TColors.darkGrey,
                      size: TSizes.iconMd,
                    ),
                  ),

                  // Shirt Number
                  Positioned(
                    top: TSizes.sm + TSizes.spaceBtwSections,
                    right: TSizes.sm,
                    child: SizedBox(
                      height: TSizes.iconMd,
                      width: TSizes.iconMd,
                      child: Center(
                        child: Text(
                          number == null ? '' : number.toString(),
                          style: const TextStyle(color: TColors.darkGrey),
                        ),
                      ),
                    ),
                  )
                ],
              ),
            ),
            const SizedBox(
              height: TSizes.spaceBtwItems / 2,
            ),

            // Details
            Padding(
              padding: const EdgeInsets.only(
                left: TSizes.sm,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Name
                  TCardTeamTitleText(title: name),
                  const SizedBox(
                    height: TSizes.spaceBtwItems / 2,
                  ),

                  // Age
                  TLabelText(
                    label: '$age years',
                  ),
                  const SizedBox(
                    height: TSizes.spaceBtwItems / 2,
                  ),

                  // Position
                  // Later we can put ability stars here instead
                  Text(
                    position,
                    maxLines: 1,
                    style: Theme.of(context).textTheme.labelSmall,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
