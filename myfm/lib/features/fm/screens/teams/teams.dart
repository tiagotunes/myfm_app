import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:myfm/common/widgets/appbar/appbar.dart';
import 'package:myfm/common/widgets/cards/team/team_card_vertical.dart';
import 'package:myfm/common/widgets/icons/counter_icon.dart';
import 'package:myfm/common/widgets/layouts/grid_layout.dart';
import 'package:myfm/common/widgets/text/appbar_title_text.dart';
import 'package:myfm/features/personalization/screens/team/edit_team.dart';
import 'package:myfm/utils/constants/colors.dart';
import 'package:myfm/utils/constants/image_strings.dart';
import 'package:myfm/utils/constants/sizes.dart';
import 'package:myfm/utils/constants/text_strings.dart';

class TeamsScreen extends StatelessWidget {
  const TeamsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: TAppBar(
        centerTitle: false,
        title: const TAppBarTitleText(title: TTexts.teams),
        actions: [
          TCounterIcon(
            onPressed: () => Get.to(() => const TEditTeamScreen()),
            iconColor: TColors.white,
            icon: Icons.add_rounded,
          )
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(TSizes.defaultSpace),
          child: Column(
            children: [
              TGridLayout(
                itemCount: 3,
                itemBuilder: (_, index) => const TTeamCardVertical(
                  imageUrl: TImages.scp,
                  name: 'Sporting CP',
                  country: 'Portugal',
                  year: '2024',
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
