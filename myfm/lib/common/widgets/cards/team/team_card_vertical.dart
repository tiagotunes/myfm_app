import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:myfm/common/widgets/custom_shapes/containers/rounded_container.dart';
import 'package:myfm/common/widgets/images/rounded_image.dart';
import 'package:myfm/common/widgets/text/card_team_title_text.dart';
import 'package:myfm/common/widgets/text/label_text_with_icon.dart';
import 'package:myfm/features/fm/screens/team_details/team_detail.dart';
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
      onTap: () => Get.to(() => const TeamDetailScreen()),
      child: Container(
        width: 180,
        padding: const EdgeInsets.all(TSizes.xs),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(TSizes.teamImageRadius),
          color: dark ? TColors.darkerGrey : TColors.white,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
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
                    width: double.infinity,
                    fit: BoxFit.contain,
                  ),
                ],
              ),
            ),
            const SizedBox(height: TSizes.spaceBtwItems / 2),

            // Details
            Padding(
              padding: const EdgeInsets.only(left: TSizes.sm),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Name
                  TCardTeamTitleText(title: name),
                  const SizedBox(height: TSizes.spaceBtwItems / 2),

                  // Country
                  TLabelWithIconText(label: country),
                  const SizedBox(height: TSizes.spaceBtwItems / 2),

                  // Year
                  Text(
                    year,
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
