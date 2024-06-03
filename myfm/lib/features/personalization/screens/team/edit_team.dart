import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:myfm/common/widgets/appbar/appbar.dart';
import 'package:myfm/common/widgets/icons/action_icon.dart';
import 'package:myfm/features/personalization/screens/team/widgets/edit_team_form_page_view.dart';
import 'package:myfm/utils/constants/image_strings.dart';
import 'package:myfm/utils/constants/sizes.dart';
import 'package:myfm/utils/constants/text_strings.dart';

class TEditTeamScreen extends StatelessWidget {
  const TEditTeamScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: TAppBar(
        showBackArrow: true,
        centerTitle: false,
        title: Text(TTexts.teamDetails.capitalize!),
        actions: [
          // Import from Internet
          ActionIcon(
            onPressed: () {},
            icon: Iconsax.global_search,
            primaryColor: false,
          ),
          const SizedBox(width: TSizes.sm),

          // Save
          ActionIcon(
            onPressed: () {},
            icon: Iconsax.shield_tick,
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
          child: const TEditTeamFormPageView(),
        ),
      ),
    );
  }
}
