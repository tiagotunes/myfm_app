import 'package:flutter/material.dart';
import 'package:myfm/features/fm/screens/team_details/widgets/team_squad_list_view.dart';
import 'package:myfm/features/personalization/models/team_model.dart';

class TTeamSquadTab extends StatelessWidget {
  const TTeamSquadTab({
    super.key, required this.team,
  });

  final TeamModel team;

  @override
  Widget build(BuildContext context) {
    return ListView(
      shrinkWrap: true,
      // physics: const NeverScrollableScrollPhysics(),
      children: const [
        Column(
          children: [
            TTeamSquadListView(
              position: 'Goalkeepers',
              nPlayers: 0,
            ),
            TTeamSquadListView(
              position: 'Defenders',
              nPlayers: 0,
            ),
            TTeamSquadListView(
              position: 'Midfielders',
              nPlayers: 0,
            ),
            TTeamSquadListView(
              position: 'Forwards',
              nPlayers: 0,
            ),
          ],
        ),
      ],
    );
  }
}
