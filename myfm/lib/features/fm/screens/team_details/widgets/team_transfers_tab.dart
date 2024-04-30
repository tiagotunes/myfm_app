import 'package:flutter/material.dart';
import 'package:myfm/features/fm/screens/team_details/widgets/team_transfer_container.dart';
import 'package:myfm/features/fm/screens/team_details/widgets/team_transfer_season_indicator.dart';
import 'package:myfm/utils/constants/sizes.dart';

class TTeamTransfersTab extends StatelessWidget {
  const TTeamTransfersTab({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: const [
        TTransferSeasonIndicator(),
        SizedBox(height: TSizes.spaceBtwSections),
        TTransferContainer(
          flgInOrOut: true,
          nTransfers: 3,
        ),
        SizedBox(height: TSizes.spaceBtwSections),
        TTransferContainer(
          flgInOrOut: false,
          nTransfers: 0,
        ),
      ],
    );
  }
}
