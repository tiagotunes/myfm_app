import 'package:flutter/material.dart';
import 'package:myfm/common/widgets/cards/team/team_card_vertical.dart';
import 'package:myfm/common/widgets/custom_shapes/containers/primary_header_container.dart';
import 'package:myfm/common/widgets/custom_shapes/containers/search_container.dart';
import 'package:myfm/common/widgets/layouts/grid_layout.dart';
import 'package:myfm/features/fm/screens/teams/widgets/teams_appbar.dart';
import 'package:myfm/utils/constants/image_strings.dart';
import 'package:myfm/utils/constants/sizes.dart';

class TeamsScreen extends StatelessWidget {
  const TeamsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            // Header
            const TPrimaryHeaderContainer(
              child: Column(
                children: [
                  // Appbar
                  TTeamsAppBar(),
                  SizedBox(height: TSizes.spaceBtwSections),

                  // Search bar
                  TSearchContainer(
                    text: '',
                    showBorder: false,
                  ),
                  SizedBox(height: TSizes.spaceBtwSections * 1.5),
                ],
              ),
            ),

            // Body
            Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: TSizes.defaultSpace),
              child: Column(
                children: [
                  TGridLayout(
                    itemCount: 3,
                    itemBuilder: (_, index) => const TTeamCardVertical(
                      imageUrl: TImages.scp,
                      name: 'Sporting CP',
                      country: 'Portugal',
                      year: '2024',
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
