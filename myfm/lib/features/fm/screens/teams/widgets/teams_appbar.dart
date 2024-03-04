import 'package:flutter/material.dart';
import 'package:myfm/common/widgets/appbar/appbar.dart';
import 'package:myfm/common/widgets/icons/counter_icon.dart';
import 'package:myfm/utils/constants/colors.dart';
import 'package:myfm/utils/constants/text_strings.dart';

class TTeamsAppBar extends StatelessWidget {
  const TTeamsAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return TAppBar(
      centerTitle: false,
      title: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            '${TTexts.teams} Subtitle',
            style: Theme.of(context)
                .textTheme
                .labelMedium!
                .apply(color: TColors.grey),
          ),
          Text(
            '${TTexts.teams} Title',
            style: Theme.of(context)
                .textTheme
                .headlineSmall!
                .apply(color: TColors.white),
          ),
        ],
      ),
      actions: [
        TCounterIcon(
          onPressed: () {},
          iconColor: TColors.white,
          icon: Icons.add_rounded,
        )
      ],
    );
  }
}
