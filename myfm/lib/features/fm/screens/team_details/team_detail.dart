import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:myfm/common/widgets/appbar/appbar.dart';
import 'package:myfm/features/fm/screens/team_details/widgets/team_detail_slider.dart';
import 'package:myfm/features/fm/screens/team_details/widgets/team_squad_tab.dart';
import 'package:myfm/features/fm/screens/team_details/widgets/team_transfers_tab.dart';
import 'package:myfm/features/personalization/models/team_model.dart';
import 'package:myfm/utils/constants/colors.dart';
import 'package:myfm/utils/constants/image_strings.dart';
import 'package:myfm/utils/constants/sizes.dart';
import 'package:myfm/utils/constants/text_strings.dart';

class TeamDetailScreen extends StatelessWidget {
  const TeamDetailScreen({super.key, required this.team});

  final TeamModel team;

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: TTexts.teamTabbar.length,
      child: Scaffold(
        appBar: TAppBar(
          wDiagonalRect: true,
          diagonalRectColor: const Color(0xFF008057),
          showBackArrow: true,
          title: Text(
            team.name.toUpperCase(),
            style: Theme.of(context)
                .textTheme
                .headlineMedium!
                .apply(color: TColors.white),
          ),
          actions: [
            IconButton(
              onPressed: () {},
              icon: const Icon(Iconsax.add),
            ),
          ],
        ),
        body: NestedScrollView(
          // Header
          headerSliverBuilder: (context, innerBoxIsScrolled) {
            return [
              const TTeamDetailSlider(
                teamLogo: TImages.scp,
                teamKit: TImages.scpKit,
                teamStadium: TImages.scpStadium,
                indicatorColor: Color(0xFF008057),
              ),
            ];
          },

          // Body
          body: const Padding(
            padding: EdgeInsets.all(TSizes.defaultSpace),
            child: TabBarView(
              physics: NeverScrollableScrollPhysics(),
              children: [
                // Home
                TTmpTabBarView(),
                // Squad
                TTeamSquadTab(),
                // Competitions
                TTmpTabBarView(),
                // Transfers
                TTeamTransfersTab(),
                // Club
                TTmpTabBarView(),
                // Finances
                TTmpTabBarView(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class TTmpTabBarView extends StatelessWidget {
  const TTmpTabBarView({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.all(TSizes.defaultSpace),
      child: Center(
        child: Text('TBD'),
      ),
    );
  }
}
