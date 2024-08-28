import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:myfm/common/widgets/loaders/shimmer.dart';
import 'package:myfm/features/fm/controllers/players_controller.dart';
import 'package:myfm/features/fm/screens/team_details/widgets/team_squad_list_view.dart';
import 'package:myfm/features/personalization/models/team_model.dart';
import 'package:myfm/utils/constants/sizes.dart';

class TTeamSquadTab extends StatelessWidget {
  const TTeamSquadTab({
    super.key,
    required this.team,
  });

  final TeamModel team;

  @override
  Widget build(BuildContext context) {
    final playersController = Get.put(PlayersController());
    return Obx(() {
      if (playersController.isLoading.value) {
        return const Padding(
          padding: EdgeInsets.all(TSizes.defaultSpace),
          child: TShimmerEffect(
            width: double.infinity,
            height: TSizes.gridMainAxisExtent,
          ),
        );
      }
      return ListView(
        shrinkWrap: true,
        // physics: const NeverScrollableScrollPhysics(),
        children: [
          Column(
            children: [
              TTeamSquadListView(
                position: 'Goalkeepers',
                players: playersController.teamPlayers
                    .where((p) => p.position == 'GK')
                    .toList(),
              ),
              TTeamSquadListView(
                position: 'Defenders',
                players: playersController.teamPlayers
                    .where((p) => p.position == 'D')
                    .toList(),
              ),
              TTeamSquadListView(
                position: 'Midfielders',
                players: playersController.teamPlayers
                    .where((p) => p.position == 'M')
                    .toList(),
              ),
              TTeamSquadListView(
                position: 'Forwards',
                players: playersController.teamPlayers
                    .where((p) => p.position == 'F')
                    .toList(),
              ),
            ],
          ),
        ],
      );
    });
  }
}
