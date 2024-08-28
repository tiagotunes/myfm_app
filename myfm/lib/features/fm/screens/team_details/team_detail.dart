import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:myfm/common/widgets/appbar/appbar.dart';
import 'package:myfm/features/fm/controllers/players_controller.dart';
import 'package:myfm/features/fm/screens/team_details/widgets/team_detail_slider.dart';
import 'package:myfm/features/fm/screens/team_details/widgets/team_squad_tab.dart';
import 'package:myfm/features/fm/screens/team_details/widgets/team_transfers_tab.dart';
import 'package:myfm/features/personalization/models/team_model.dart';
import 'package:myfm/utils/constants/colors.dart';
import 'package:myfm/utils/constants/sizes.dart';
import 'package:myfm/utils/constants/text_strings.dart';
import 'package:myfm/utils/popups/team_add_popup.dart';

class TeamDetailScreen extends StatelessWidget {
  const TeamDetailScreen({super.key, required this.team});

  final TeamModel team;

  @override
  Widget build(BuildContext context) {
    final playersController = Get.put(PlayersController());
    playersController.getTeamPlayers(team.id);
    return DefaultTabController(
      length: TTexts.teamTabbar.length,
      child: Scaffold(
        appBar: TAppBar(
          wDiagonalRect: true,
          diagonalRectColor:
              team.color == null ? TColors.primary : Color(team.color!),
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
              onPressed: () => TTeamAddPopup.selectOption(context, team),
              icon: const Icon(Iconsax.add),
            ),
          ],
        ),
        body: NestedScrollView(
          // Header
          headerSliverBuilder: (context, innerBoxIsScrolled) {
            return [
              TTeamDetailSlider(team: team),
            ];
          },

          // Body
          body: Padding(
            padding: const EdgeInsets.all(TSizes.defaultSpace),
            child: TabBarView(
              physics: const NeverScrollableScrollPhysics(),
              children: [
                // Home
                const TTmpTabBarView(),
                // Squad
                TTeamSquadTab(team: team),
                // Competitions
                const TTmpTabBarView(),
                // Transfers
                const TTeamTransfersTab(),
                // Club
                const TTmpTabBarView(),
                // Finances
                const TTmpTabBarView(),
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
