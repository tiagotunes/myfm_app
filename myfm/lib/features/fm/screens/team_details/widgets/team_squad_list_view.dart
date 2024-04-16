import 'package:flutter/material.dart';
import 'package:myfm/common/widgets/cards/player/player_card_vertical.dart';
import 'package:myfm/common/widgets/text/section_heading.dart';
import 'package:myfm/utils/constants/sizes.dart';

class TTeamSquadListView extends StatelessWidget {
  const TTeamSquadListView({
    super.key,
    required this.position,
    required this.nPlayers,
  });

  final String position;
  final int nPlayers;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        TSectionHeading(
          title: position,
          // showActionButton: nPlayers > 0 ? true : false,
          // buttonTitle: nPlayers > 1 ? "$nPlayers players" : "$nPlayers player",
        ),
        const SizedBox(height: TSizes.spaceBtwItems / 2),
        nPlayers > 0
            ? SizedBox(
                height: 220,
                child: ListView(
                  shrinkWrap: true,
                  scrollDirection: Axis.horizontal,
                  children: List.generate(
                    nPlayers,
                    (index) => Padding(
                      padding: const EdgeInsets.only(right: TSizes.sm),
                      child: TPlayerCardVertical(
                        name: 'Name Test ${index + 1}',
                        age: 21 + index,
                        position: 'Position',
                        number: index + 1,
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
