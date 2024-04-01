import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:myfm/common/widgets/appbar/appbar.dart';
import 'package:myfm/common/widgets/icons/counter_icon.dart';
import 'package:myfm/common/widgets/text/appbar_title_text.dart';
import 'package:myfm/utils/constants/colors.dart';
import 'package:myfm/utils/constants/text_strings.dart';

class THomeAppBar extends StatelessWidget {
  const THomeAppBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return TAppBar(
      centerTitle: false,
      title: const TAppBarTitleText(
        title: TTexts.home,
        // subtitle: '${TTexts.home} Subtitle',
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
