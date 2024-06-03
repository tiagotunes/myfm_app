import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:myfm/data/repositories/user/user_repository.dart';
import 'package:myfm/features/personalization/controllers/country_controller.dart';
import 'package:myfm/utils/constants/image_strings.dart';
import 'package:myfm/utils/helpers/network_manager.dart';
import 'package:myfm/utils/popups/full_screen_loader.dart';
import 'package:myfm/utils/popups/loaders.dart';

class EditTeamController extends GetxController {
  static EditTeamController get instance => Get.find();

  // Variables
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
  final userRepository = Get.put(UserRepository());

  Future<void> saveTeamData() async {
    try {
      // Start Loading
      TFullScreenLoader.openLoadingDialog(
        'We are updating your information...',
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

      // Remove Loader
      TFullScreenLoader.stopLoading();
    } catch (e) {
      // Remove Loader
      TFullScreenLoader.stopLoading();

      // Show some Generic Error to the user
      TLoaders.errorSnackbar(title: 'Error', message: e.toString());
    }
  }
}
