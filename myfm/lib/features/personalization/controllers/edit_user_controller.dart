import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:myfm/data/repositories/user/user_repository.dart';
import 'package:myfm/features/personalization/controllers/country_controller.dart';
import 'package:myfm/features/personalization/controllers/user_controller.dart';
import 'package:myfm/features/personalization/models/user_model.dart';
import 'package:myfm/utils/constants/image_strings.dart';
import 'package:myfm/utils/helpers/network_manager.dart';
import 'package:myfm/utils/popups/full_screen_loader.dart';
import 'package:myfm/utils/popups/loaders.dart';

class EditUserController extends GetxController {
  static EditUserController get instance => Get.find();

  // Variables
  final userController = Get.put(UserController());
  final name = TextEditingController();
  final username = TextEditingController();
  final countryController = Get.put(CountryController());
  final nationality = TextEditingController();
  final nationalityID = TextEditingController();
  final dateOfBirth = TextEditingController();
  GlobalKey<FormState> editUserFormKey = GlobalKey<FormState>();
  final userRepository = Get.put(UserRepository());

  // Init User Data when Home Screen appears
  @override
  void onInit() {
    initializeUserData();
    super.onInit();
  }

  // Fetch user record
  Future<void> initializeUserData() async {
    name.text = userController.user.value.name;
    username.text = userController.user.value.username;
    if (userController.user.value.nationality != null) {
      nationality.text = countryController
          .allCountries[int.parse(userController.user.value.nationality!) - 1]
          .nationality;
      nationalityID.text = userController.user.value.nationality!;
    }
    dateOfBirth.text = userController.user.value.dateOfBirth ?? "";
  }

  Future<void> updateUserData() async {
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
      if (!editUserFormKey.currentState!.validate()) {
        // Remove Loader
        TFullScreenLoader.stopLoading();
        return;
      }

      // Update user in the Firebase Firestore
      final updateduser = UserModel(
        id: userController.user.value.id,
        name: name.text.trim(),
        username: username.text.trim(),
        email: userController.user.value.email,
        nationality:
            nationalityID.text.trim() != "" ? nationalityID.text.trim() : null,
        dateOfBirth:
            dateOfBirth.text.trim() != "" ? dateOfBirth.text.trim() : null,
        profilePicture: userController.user.value.profilePicture,
        dtCri: userController.user.value.dtCri,
        dtAct: DateTime.now().toString().split('.')[0],
      );
      await userRepository.updateUserDetails(updateduser);

      // Update the Rx User value
      userController.user.value.name = name.text.trim();
      userController.user.value.username = username.text.trim();
      if (nationalityID.text.trim() != "") userController.user.value.nationality = nationalityID.text.trim();
      if (dateOfBirth.text.trim() != "") userController.user.value.dateOfBirth = dateOfBirth.text.trim();

      // Remove Loader
      TFullScreenLoader.stopLoading();

      // Move to previous screen
      // Get.off(() => const ProfileScreen());
      Get.back();
      userController.user.refresh();

      // Show Success Message
      TLoaders.sucessSnackBar(
        title: 'Success',
        message: 'Your profile has been updated.',
      );
    } catch (e) {
      // Remove Loader
      TFullScreenLoader.stopLoading();

      // Show some Generic Error to the user
      TLoaders.errorSnackbar(title: 'Error', message: e.toString());
    }
  }
}
