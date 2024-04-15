import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:myfm/common/widgets/appbar/appbar.dart';
import 'package:myfm/features/fm/screens/team_details/widgets/team_detail_slider.dart';
import 'package:myfm/utils/constants/colors.dart';
import 'package:myfm/utils/constants/image_strings.dart';
import 'package:myfm/utils/constants/sizes.dart';

class TeamDetailScreen extends StatelessWidget {
  const TeamDetailScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // final dark = THelperFunctions.isDarkMode(context);
    return DefaultTabController(
      length: 6,
      child: Scaffold(
        appBar: TAppBar(
          wDiagonalRect: true,
          diagonalRectColor: const Color(0xFF008057),
          showBackArrow: true,
          title: Text(
            'Sporting CP'.toUpperCase(),
            style: Theme.of(context)
                .textTheme
                .headlineMedium!
                .apply(color: TColors.white),
          ),
          actions: [
            IconButton(
              onPressed: () {},
              icon: const Icon(Iconsax.add),
            ),
          ],
        ),
        body: NestedScrollView(
          // Header
          headerSliverBuilder: (context, innerBoxIsScrolled) {
            return [
              const TTeamDetailSlider(teamLogo: TImages.scp),
            ];
          },

          // Body
          body: TabBarView(
            physics: NeverScrollableScrollPhysics(),
            children: [
              const TTmpTabBarView(),
              DataTable(
                columns: const [
                  DataColumn(
                    label: Text('Name'),
                  ),
                  DataColumn(
                    label: Text('Position'),
                  ),
                  DataColumn(
                    label: Text('Nation'),
                  ),
                  DataColumn(
                    label: Text('Age'),
                  ),
                ],
                rows: const [
                  DataRow(
                    cells: [
                      DataCell(Text('Teste 1')),
                      DataCell(Center(child: Text('DC'))),
                      DataCell(Center(child: Text('PT'))),
                      DataCell(Center(child: Text('21'))),
                    ],
                  ),
                  DataRow(
                    cells: [
                      DataCell(Text('Teste 2')),
                      DataCell(Center(child: Text('DC'))),
                      DataCell(Center(child: Text('PT'))),
                      DataCell(Center(child: Text('22'))),
                    ],
                  ),
                  DataRow(
                    cells: [
                      DataCell(Text('Teste 3')),
                      DataCell(Center(child: Text('DC'))),
                      DataCell(Center(child: Text('PT'))),
                      DataCell(Center(child: Text('23'))),
                    ],
                  ),
                ],
              ),
              const TTmpTabBarView(),
              const TTmpTabBarView(),
              const TTmpTabBarView(),
              const TTmpTabBarView(),
            ],
          ),
        ),
      ),
    );
  }
}

class TTmpTabBarView extends StatelessWidget {
  const TTmpTabBarView({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.all(TSizes.defaultSpace),
      child: Center(
        child: Text('TBD'),
      ),
    );
  }
}
