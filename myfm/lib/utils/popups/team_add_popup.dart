import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:myfm/features/personalization/models/team_model.dart';
import 'package:myfm/features/personalization/screens/player/edit_player.dart';
import 'package:myfm/utils/helpers/helper_functions.dart';

class TTeamAddPopup {
  static Future<void> selectOption(
    BuildContext context,
    TeamModel team,
  ) async {
    await showModalBottomSheet<dynamic>(
      context: context,
      isScrollControlled: true,
      constraints: BoxConstraints(
        maxHeight: THelperFunctions.screenHeight() * 0.3,
      ),
      builder: (context) {
        return Wrap(
          children: [
            ListTile(
              leading: const Icon(Iconsax.user_add),
              title: const Text('Add Player'),
              onTap: () {
                Navigator.pop(context);
                Get.to(() => TEditPlayerScreen(team: team));
              },
            ),
          ],
        );
      },
    );
  }
}
