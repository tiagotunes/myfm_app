import 'package:flutter/material.dart';
import 'package:myfm/common/widgets/custom_shapes/containers/rounded_container.dart';
import 'package:myfm/common/widgets/images/rounded_images.dart';
import 'package:myfm/common/widgets/text/team_title_text.dart';
import 'package:myfm/utils/constants/colors.dart';
import 'package:myfm/utils/constants/sizes.dart';
import 'package:myfm/utils/helpers/helper_functions.dart';

class TTeamCardVertical extends StatelessWidget {
  const TTeamCardVertical({
    super.key,
    required this.imageUrl,
    required this.name,
    required this.country,
    required this.year,
  });

  final String imageUrl, name, country, year;

  @override
  Widget build(BuildContext context) {
    final dark = THelperFunctions.isDarkMode(context);
    return GestureDetector(
      onTap: () {},
      child: Container(
        padding: const EdgeInsets.all(TSizes.xs),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(TSizes.teamImageRadius),
          color: dark ? TColors.darkerGrey : TColors.white,
        ),
        child: Column(
          children: [
            // Logo
            TRoundedContainer(
              height: TSizes.teamImageHeight,
              padding: const EdgeInsets.all(TSizes.sm),
              backgroundColor: dark ? TColors.dark : TColors.light,
              child: Stack(
                children: [
                  TRoundedImage(
                    imageUrl: imageUrl,
                    applyImageRadius: true,
                    backgroundColor: Colors.transparent,
                    width: double.infinity,
                    fit: BoxFit.contain,
                  ),
                ],
              ),
            ),
            const SizedBox(height: TSizes.spaceBtwItems / 2),

            Padding(
              padding: const EdgeInsets.only(left: TSizes.sm),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Name
                  TTeamTitleText(title: name),
                  const SizedBox(height: TSizes.spaceBtwItems / 2.5),

                  // Country
                  Row(
                    children: [
                      Text(
                        country,
                        maxLines: 1,
                        style: Theme.of(context).textTheme.labelMedium,
                      ),
                      const SizedBox(width: TSizes.xs),
                      const Icon(
                        Icons.flag,
                        size: TSizes.iconXs,
                      ),
                    ],
                  ),
                  const SizedBox(height: TSizes.spaceBtwItems / 2.5),

                  // Year
                  Text(
                    year,
                    maxLines: 1,
                    style: Theme.of(context).textTheme.labelSmall,
                  ),
                  const SizedBox(height: TSizes.spaceBtwItems / 2),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
