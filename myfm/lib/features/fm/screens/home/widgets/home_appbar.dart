import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:myfm/common/widgets/appbar/appbar.dart';
import 'package:myfm/common/widgets/icons/counter_icon.dart';
import 'package:myfm/utils/constants/colors.dart';

class THomeAppBar extends StatelessWidget {
  const THomeAppBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return TAppBar(
      centerTitle: false,
      title: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Subtitle',
            style: Theme.of(context)
                .textTheme
                .labelMedium!
                .apply(color: TColors.grey),
          ),
          Text(
            'Title',
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
          icon: Iconsax.message_text_15,
          count: '2',
        )
      ],
    );
  }
}
