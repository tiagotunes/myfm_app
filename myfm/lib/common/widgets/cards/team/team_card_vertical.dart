import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:myfm/common/widgets/custom_shapes/containers/rounded_container.dart';
import 'package:myfm/common/widgets/images/rounded_image.dart';
import 'package:myfm/common/widgets/text/card_title_text.dart';
import 'package:myfm/common/widgets/text/label_text_with_icon.dart';
import 'package:myfm/features/fm/screens/team_details/team_detail.dart';
import 'package:myfm/features/personalization/models/team_model.dart';
import 'package:myfm/utils/constants/colors.dart';
import 'package:myfm/utils/constants/image_strings.dart';
import 'package:myfm/utils/constants/sizes.dart';
import 'package:myfm/utils/helpers/helper_functions.dart';

class TTeamCardVertical extends StatelessWidget {
  const TTeamCardVertical({
    super.key,
    required this.team,
  });

  final TeamModel team;

  @override
  Widget build(BuildContext context) {
    final dark = THelperFunctions.isDarkMode(context);
    return GestureDetector(
      onTap: () => Get.to(() => TeamDetailScreen(team: team)),
      child: Container(
        width: TSizes.teamCardVerticalWidth,
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
              child: team.logo == null
                  ? SizedBox(
                      width: double.infinity,
                      child: FittedBox(
                        child: SvgPicture.asset(
                          TImages.shield,
                          colorFilter: ColorFilter.mode(
                            // team.color.isEmpty ? Colors.white : Colors.green,
                            team.color == null
                                ? Colors.white
                                : Color(team.color!),
                            BlendMode.srcIn,
                          ),
                        ),
                      ),
                    )
                  : TRoundedImage(
                      imageUrl: team.logo!,
                      isNetworkImage: true,
                      applyImageRadius: true,
                      width: double.infinity,
                      fit: BoxFit.contain,
                    ),
            ),
            const SizedBox(height: TSizes.spaceBtwItems / 2),

            // Details
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: TSizes.sm),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Name
                  TCardTitleText(title: team.name),
                  const SizedBox(height: TSizes.spaceBtwItems / 2),

                  // Country
                  TLabelWithIconText(
                    country: true,
                    countryId: int.parse(team.country),
                  ),
                  const SizedBox(height: TSizes.spaceBtwItems / 2),

                  // Year
                  Text(
                    team.season,
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
