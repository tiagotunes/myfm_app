import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:myfm/common/widgets/custom_shapes/containers/rounded_container.dart';
import 'package:myfm/common/widgets/images/rounded_image.dart';
import 'package:myfm/common/widgets/text/card_team_title_text.dart';
import 'package:myfm/common/widgets/text/label_text_with_icon.dart';
import 'package:myfm/features/fm/screens/team_details/team_detail.dart';
import 'package:myfm/features/personalization/controllers/country_controller.dart';
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
    final countryController = Get.put(CountryController());
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
              child: team.logo.isEmpty
                  ? SizedBox(
                      width: double.infinity,
                      child: FittedBox(
                        child: SvgPicture.asset(
                          'assets/icons/shield.svg',
                          colorFilter: ColorFilter.mode(
                            team.color.isEmpty ? Colors.white : Colors.green,
                            BlendMode.srcIn,
                          ),
                        ),
                      ),
                    )
                  : const TRoundedImage(
                      imageUrl: TImages.scp,
                      applyImageRadius: true,
                      width: double.infinity,
                      fit: BoxFit.contain,
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
                  TCardTeamTitleText(title: team.name),
                  const SizedBox(height: TSizes.spaceBtwItems / 2),

                  // Country
                  TLabelWithIconText(
                      label: countryController
                          .allCountries[int.parse(team.country) - 1].name),
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
