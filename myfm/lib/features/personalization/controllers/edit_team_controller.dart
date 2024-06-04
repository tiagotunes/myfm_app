import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:myfm/data/repositories/team/team_repository.dart';
import 'package:myfm/features/fm/controllers/teams_controller.dart';
import 'package:myfm/features/personalization/controllers/country_controller.dart';
import 'package:myfm/features/personalization/controllers/user_controller.dart';
import 'package:myfm/features/personalization/models/team_model.dart';
import 'package:myfm/utils/constants/image_strings.dart';
import 'package:myfm/utils/helpers/network_manager.dart';
import 'package:myfm/utils/popups/full_screen_loader.dart';
import 'package:myfm/utils/popups/loaders.dart';

class EditTeamController extends GetxController {
  static EditTeamController get instance => Get.find();

  // Variables
  final userController = Get.put(UserController());
  final name = TextEditingController();
  final countryController = Get.put(CountryController());
  final country = TextEditingController();
  final countryID = TextEditingController();
  final season = TextEditingController();
  final color = TextEditingController();
  final stadiumName = TextEditingController();
  final bankBalance = TextEditingController();
  final squadBudget = TextEditingController();
  final wageBudget = TextEditingController();
  final logo = TextEditingController();
  final kit = TextEditingController();
  final stadiumImg = TextEditingController();
  GlobalKey<FormState> editTeamFormKey = GlobalKey<FormState>();
  final teamRepository = Get.put(TeamRepository());
  final teamsController = Get.put(TeamsController());

  Future<void> saveTeamData() async {
    try {
      // Start Loading
      TFullScreenLoader.openLoadingDialog(
        'We are creating your team...',
        TImages.darkAppLogo,
      );

      // Check Internet Connectivity
      final isConnected = await NetworkManager.instance.isConnected();
      if (!isConnected) {
        // Remove Loader
        TFullScreenLoader.stopLoading();
        return;
      }

      // Form Validation
      if (!editTeamFormKey.currentState!.validate()) {
        // Remove Loader
        TFullScreenLoader.stopLoading();
        return;
      }

      // Save team in the Firebase Firestore
      final newTeam = TeamModel(
        id: '',
        userId: userController.user.value.id,
        name: name.text.trim(),
        country: countryID.text.trim(),
        season: season.text.trim(),
        stadiumName: stadiumName.text.trim(),
        color: color.text.trim(),
        bankBalance: bankBalance.text.trim() != ""
            ? int.parse(bankBalance.text.trim())
            : null,
        squadBudget: squadBudget.text.trim() != ""
            ? int.parse(squadBudget.text.trim())
            : null,
        wageBudget: wageBudget.text.trim() != ""
            ? int.parse(wageBudget.text.trim())
            : null,
        logo: logo.text.trim(),
        kit: kit.text.trim(),
        stadiumImg: stadiumImg.text.trim(),
        dtCri: DateTime.now().toString().split('.')[0],
        dtAct: '',
      );
      await teamRepository.saveTeamRecord(newTeam);

      // Remove Loader
      TFullScreenLoader.stopLoading();

      // Move to previous screen
      Get.back();
      teamsController.refresh();

      // Show Success Message
      TLoaders.sucessSnackBar(
        title: 'Success',
        message: 'Your team has been created.',
      );
    } catch (e) {
      // Remove Loader
      TFullScreenLoader.stopLoading();

      // Show some Generic Error to the user
      TLoaders.errorSnackbar(title: 'Error', message: e.toString());
    }
  }
}
