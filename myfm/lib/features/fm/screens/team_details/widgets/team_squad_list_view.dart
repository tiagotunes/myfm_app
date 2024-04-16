import 'package:flutter/material.dart';
import 'package:myfm/common/widgets/cards/player/player_card_vertical.dart';
import 'package:myfm/common/widgets/text/section_heading.dart';
import 'package:myfm/utils/constants/sizes.dart';

class TTeamSquadListView extends StatelessWidget {
  const TTeamSquadListView({
    super.key,
    required this.position,
  });

  final String position;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        TSectionHeading(title: position),
        const SizedBox(height: TSizes.spaceBtwItems / 2),
        SizedBox(
          height: 220,
          child: ListView(
            shrinkWrap: true,
            scrollDirection: Axis.horizontal,
            children: List.generate(
              3,
              (index) => Padding(
                padding: const EdgeInsets.only(right: TSizes.sm),
                child: TPlayerCardVertical(
                  name: 'Name Test $index',
                  age: 21 + index,
                  position: 'Position',
                  number: index + 1,
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
