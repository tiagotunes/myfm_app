import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:myfm/common/widgets/appbar/appbar.dart';
import 'package:myfm/common/widgets/cards/team/team_card_vertical.dart';
import 'package:myfm/common/widgets/icons/counter_icon.dart';
import 'package:myfm/common/widgets/layouts/grid_layout.dart';
import 'package:myfm/common/widgets/loaders/shimmer.dart';
import 'package:myfm/common/widgets/text/appbar_title_text.dart';
import 'package:myfm/features/fm/controllers/team_controller.dart';
import 'package:myfm/features/personalization/screens/team/edit_team.dart';
import 'package:myfm/utils/constants/colors.dart';
import 'package:myfm/utils/constants/sizes.dart';
import 'package:myfm/utils/constants/text_strings.dart';

class TeamsScreen extends StatelessWidget {
  const TeamsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final teamsController = Get.put(TeamController());
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
      body: Obx(
        () {
          if (teamsController.isLoading.value) {
            return const Padding(
              padding: EdgeInsets.all(TSizes.defaultSpace),
              child: TShimmerEffect(
                width: TSizes.teamCardVerticalWidth,
                height: TSizes.gridMainAxisExtent,
              ),
            );
          }

          if (teamsController.userTeams.isEmpty) {
            return Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Icon(
                  Iconsax.shield_slash,
                  size: TSizes.iconLg * 2,
                  color: TColors.darkGrey,
                ),
                const SizedBox(height: TSizes.spaceBtwItems),
                Center(
                  child: Text(
                    'No teams found',
                    style: Theme.of(context).textTheme.labelMedium!.apply(
                          fontSizeFactor: 2.0,
                          fontWeightDelta: 1,
                        ),
                  ),
                ),
              ],
            );
          }
          return SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(TSizes.defaultSpace),
              child: Column(
                children: [
                  TGridLayout(
                      itemCount: teamsController.userTeams.length,
                      itemBuilder: (_, index) {
                        final team = teamsController.userTeams[index];
                        return TTeamCardVertical(team: team);
                      }),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
