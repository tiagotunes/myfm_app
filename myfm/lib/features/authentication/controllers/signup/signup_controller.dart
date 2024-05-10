import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:myfm/data/repositories/authentication/authentication_repository.dart';
import 'package:myfm/data/repositories/user/user_repository.dart';
import 'package:myfm/features/authentication/screens/signup/verify_email.dart';
import 'package:myfm/features/personalization/models/user_model.dart';
import 'package:myfm/utils/constants/image_strings.dart';
import 'package:myfm/utils/helpers/network_manager.dart';
import 'package:myfm/utils/popups/full_screen_loader.dart';
import 'package:myfm/utils/popups/loaders.dart';

class SignupController extends GetxController {
  static SignupController get instance => Get.find();

  // Variables
  final name = TextEditingController();
  final username = TextEditingController();
  final email = TextEditingController();
  final password = TextEditingController();
  final hidePassword = true.obs;
  final nationality = TextEditingController();
  final dateOfBirth = TextEditingController();
  final checkTermsConditions = false.obs;
  GlobalKey<FormState> signupFormKey = GlobalKey<FormState>();

  // SIGNUP
  void signup() async {
    try {
      // Start Loading
      TFullScreenLoader.openLoadingDialog(
        'We are processing your information...',
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
      if (!signupFormKey.currentState!.validate()) {
        // Remove Loader
        TFullScreenLoader.stopLoading();
        return;
      }

      // Privacy Policy and Terms of use check
      if (!checkTermsConditions.value) {
        // Remove Loader
        TFullScreenLoader.stopLoading();

        TLoaders.warningSnackBar(
          title: 'Accep Privacy Policy and Terms of use',
          message:
              'In order to create account, you must have to read and accept the Privacy Policy and Terms of use.',
        );
        return;
      }

      // Register user in the Firebase Authentication & Save user data in the Firebase
      final userCredential =
          await AuthenticationRepository.instance.registerWithEmailAndPassword(
        email.text.trim(),
        password.text.trim(),
      );

      // Save Authenticated user data in the Firebase Firestore
      final newUser = UserModel(
        id: userCredential.user!.uid,
        name: name.text.trim(),
        username: username.text.trim(),
        email: email.text.trim(),
        nationality: nationality.text.trim(),
        dateOfBirth: dateOfBirth.text.trim(),
        profilePicture: '',
        dtCri: DateTime.now().toString().split('.')[0],
        dtAct: '',
      );
      final userRepository = Get.put(UserRepository());
      await userRepository.saveUserRecord(newUser);

      // Remove Loader
      TFullScreenLoader.stopLoading();

      // Show Success Message
      TLoaders.sucessSnackBar(
        title: 'Success',
        message: 'Your account has been created! Verify email to continue.',
      );

      // Move to Verify Email Screen
      Get.to(() => const VerifyEmailScreen());
    } catch (e) {
      // Remove Loader
      TFullScreenLoader.stopLoading();

      // Show some Generic Error to the user
      TLoaders.errorSnackbar(title: 'Error', message: e.toString());
    }
  }
}
