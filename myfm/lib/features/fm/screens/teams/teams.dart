import 'package:flutter/material.dart';
import 'package:myfm/common/widgets/cards/team/team_card_vertical.dart';
import 'package:myfm/common/widgets/custom_shapes/containers/primary_header_container.dart';
import 'package:myfm/common/widgets/custom_shapes/containers/search_container.dart';
import 'package:myfm/features/fm/screens/teams/widgets/teams_appbar.dart';
import 'package:myfm/utils/constants/sizes.dart';
import 'package:myfm/utils/constants/text_strings.dart';

class TeamsScreen extends StatelessWidget {
  const TeamsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            // Header
            TPrimaryHeaderContainer(
              child: Column(
                children: [
                  // Appbar
                  TTeamsAppBar(),
                  SizedBox(height: TSizes.spaceBtwSections),

                  // Search bar
                  TSearchContainer(
                    text: TTexts.search,
                    showBorder: false,
                  ),
                  SizedBox(height: TSizes.spaceBtwSections * 1.5),
                ],
              ),
            ),

            // Body
            Padding(
              padding: EdgeInsets.all(TSizes.defaultSpace),
              child: Column(
                children: [TTeamCardVertical()],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
