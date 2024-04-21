import 'package:flutter/material.dart';
import 'package:myfm/features/fm/screens/team_details/widgets/team_squad_list_view.dart';

class TTeamSquadTab extends StatelessWidget {
  const TTeamSquadTab({
    super.key,
  });

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
              nPlayers: 2,
            ),
            TTeamSquadListView(
              position: 'Defenders',
              nPlayers: 4,
            ),
            TTeamSquadListView(
              position: 'Midfielders',
              nPlayers: 6,
            ),
            TTeamSquadListView(
              position: 'Forwards',
              nPlayers: 1,
            ),
          ],
        ),
      ],
    );
  }
}
