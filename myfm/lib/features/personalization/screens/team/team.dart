import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:myfm/common/widgets/appbar/appbar.dart';
import 'package:myfm/features/personalization/screens/team/widgets/team_form_page_view.dart';
import 'package:myfm/utils/constants/colors.dart';
import 'package:myfm/utils/constants/image_strings.dart';
import 'package:myfm/utils/constants/sizes.dart';
import 'package:myfm/utils/constants/text_strings.dart';

class TTeamPersonalizationScreen extends StatelessWidget {
  const TTeamPersonalizationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: TAppBar(
        showBackArrow: true,
        centerTitle: false,
        title: Text(TTexts.teamDetails.capitalize!),
        actions: [
          // Import from Internet
          Container(
            padding: const EdgeInsets.all(TSizes.sm),
            decoration: BoxDecoration(
                color: TColors.darkGrey.withOpacity(0.2),
                borderRadius: BorderRadius.circular(5)),
            child: const Icon(Iconsax.global_search),
          ),
          const SizedBox(width: TSizes.sm),

          // Save
          Container(
            padding: const EdgeInsets.all(TSizes.sm),
            decoration: BoxDecoration(
                color: TColors.buttonPrimary,
                borderRadius: BorderRadius.circular(5)),
            child: const Icon(Iconsax.shield_tick),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Container(
          decoration: const BoxDecoration(
            image: DecorationImage(
              image: AssetImage(TImages.clubOffice),
              fit: BoxFit.fitHeight,
              opacity: 0.5,
            ),
          ),
          child: const TTeamFormPageView(),
        ),
      ),
    );
  }
}
