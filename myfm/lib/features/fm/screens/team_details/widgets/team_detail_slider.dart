import 'package:flutter/material.dart';
import 'package:myfm/common/widgets/appbar/tabbar.dart';
import 'package:myfm/features/fm/screens/team_details/widgets/team_image_slider.dart';
import 'package:myfm/utils/constants/colors.dart';
import 'package:myfm/utils/constants/text_strings.dart';
import 'package:myfm/utils/helpers/helper_functions.dart';

class TTeamDetailSlider extends StatelessWidget {
  const TTeamDetailSlider({
    super.key,
    required this.teamLogo,
    this.indicatorColor = TColors.primary,
  });

  final String teamLogo;
  final Color indicatorColor;

  @override
  Widget build(BuildContext context) {
    final dark = THelperFunctions.isDarkMode(context);
    return SliverAppBar(
      automaticallyImplyLeading: false,
      pinned: true,
      floating: true,
      backgroundColor: dark ? TColors.dark : TColors.light,
      expandedHeight: 280,
      flexibleSpace: TTeamImageSlider(
        teamLogo: teamLogo,
        teamKit: teamLogo,
        teamStadium: teamLogo,
      ),

      // Tabs
      bottom: TTabBar(
        indicatorColor: indicatorColor,
        tabs: List.generate(TTexts.teamTabbar.length,
            (index) => Tab(child: Text(TTexts.teamTabbar[index]))),
      ),
    );
  }
}
