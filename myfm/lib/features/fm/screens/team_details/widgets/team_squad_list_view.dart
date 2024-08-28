import 'package:flutter/material.dart';
import 'package:myfm/common/widgets/cards/player/player_card_vertical.dart';
import 'package:myfm/common/widgets/text/section_heading.dart';
import 'package:myfm/features/personalization/models/player_model.dart';
import 'package:myfm/utils/constants/sizes.dart';

class TTeamSquadListView extends StatelessWidget {
  const TTeamSquadListView({
    super.key,
    required this.position,
    required this.players,
  });

  final String position;
  final List<PlayerModel> players;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        TSectionHeading(
          title: position,
          showActionButton: players.isNotEmpty ? true : false,
          buttonTitle: players.length == 1 ? "${players.length} player" : "${players.length} players",
        ),
        const SizedBox(height: TSizes.spaceBtwItems / 2),
        players.isNotEmpty
            ? SizedBox(
                height: 220,
                child: ListView(
                  shrinkWrap: true,
                  scrollDirection: Axis.horizontal,
                  children: List.generate(
                    players.length,
                    (index) => Padding(
                      padding: const EdgeInsets.only(right: TSizes.sm),
                      child: TPlayerCardVertical(
                        name: players[index].name,
                        age: 21 + index,
                        position: players[index].position,
                        number: players[index].number,
                      ),
                    ),
                  ),
                ),
              )
            : Text(
                'No players found for this position',
                style: Theme.of(context).textTheme.labelMedium,
              ),
        SizedBox(height: position != 'Forwards' ? TSizes.spaceBtwSections : 0),
      ],
    );
  }
}
