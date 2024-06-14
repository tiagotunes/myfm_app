import 'package:flutter/material.dart';
import 'package:myfm/common/widgets/appbar/tabbar.dart';
import 'package:myfm/features/fm/screens/team_details/widgets/team_image_slider.dart';
import 'package:myfm/features/personalization/models/team_model.dart';
import 'package:myfm/utils/constants/colors.dart';
import 'package:myfm/utils/constants/text_strings.dart';
import 'package:myfm/utils/helpers/helper_functions.dart';

class TTeamDetailSlider extends StatelessWidget {
  const TTeamDetailSlider({
    super.key,
    required this.team,
  });

  final TeamModel team;

  @override
  Widget build(BuildContext context) {
    final dark = THelperFunctions.isDarkMode(context);
    return SliverAppBar(
      automaticallyImplyLeading: false,
      pinned: true,
      floating: true,
      backgroundColor: dark ? TColors.dark : TColors.light,
      expandedHeight: 280,
      flexibleSpace: TTeamImageSlider(team: team),

      // Tabs
      bottom: TTabBar(
        indicatorColor: team.color.isEmpty ? TColors.primary : Colors.green,
        tabs: List.generate(TTexts.teamTabbar.length,
            (index) => Tab(child: Text(TTexts.teamTabbar[index]))),
      ),
    );
  }
}
