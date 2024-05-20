import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:myfm/data/repositories/authentication/authentication_repository.dart';
import 'package:myfm/data/repositories/user/user_repository.dart';
import 'package:myfm/features/authentication/screens/login/login.dart';
import 'package:myfm/features/personalization/models/user_model.dart';
import 'package:myfm/features/personalization/screens/profile/widgets/re_authenticate_user_login_form.dart';
import 'package:myfm/utils/constants/colors.dart';
import 'package:myfm/utils/constants/image_strings.dart';
import 'package:myfm/utils/constants/sizes.dart';
import 'package:myfm/utils/helpers/network_manager.dart';
import 'package:myfm/utils/popups/full_screen_loader.dart';
import 'package:myfm/utils/popups/loaders.dart';

class UserController extends GetxController {
  static UserController get instance => Get.find();

  final profileLoading = false.obs;
  Rx<UserModel> user = UserModel.empty().obs;

  final hidePassword = true.obs;
  final verifyEmail = TextEditingController();
  final verifyPassword = TextEditingController();
  final userRepository = Get.put(UserRepository());
  GlobalKey<FormState> reAuthFormKey = GlobalKey<FormState>();

  @override
  void onInit() {
    super.onInit();
    fetchUserRecord();
  }

  // Fetch user record
  Future<void> fetchUserRecord() async {
    try {
      profileLoading.value = true;
      final user = await userRepository.fetchUserDetails();
      this.user(user);
    } catch (e) {
      user(UserModel.empty());
    } finally {
      profileLoading.value = false;
    }
  }

  // Save user record from any registration provider
  Future<void> saveUserRecord(UserCredential? userCredentials) async {
    try {
      if (userCredentials != null) {
        // Generate Username
        final username =
            UserModel.generateUsername(userCredentials.user!.displayName ?? '');

        // Map Data
        final user = UserModel(
          id: userCredentials.user!.uid,
          name: userCredentials.user!.displayName ?? '',
          username: username,
          email: userCredentials.user!.email ?? '',
          nationality: '',
          dateOfBirth: '',
          profilePicture: userCredentials.user!.photoURL ?? '',
          dtCri: DateTime.now().toString().split('.')[0],
          dtAct: '',
        );

        // Save User Data
        await userRepository.saveUserRecord(user);
      }
    } catch (e) {
      TLoaders.warningSnackBar(
        title: 'Data not saved',
        message:
            'Something wnet wrong while saving your information. You can re-save your data in your Profile.',
      );
    }
  }

  // Delete account warning
  void deleteAccountWarningPopup() {
    Get.defaultDialog(
      contentPadding: const EdgeInsets.all(TSizes.md),
      title: 'Delete Account',
      middleText:
          'Are you sure you want to delete your account permantely? This action is not reversible and all of your data will be removed permanently.',
      confirm: ElevatedButton(
        onPressed: () async => deleteUserAccount(),
        style: ElevatedButton.styleFrom(
          backgroundColor: Colors.red,
          side: const BorderSide(color: Colors.red),
        ),
        child: const Padding(
          padding: EdgeInsets.symmetric(horizontal: TSizes.lg),
          child: Text('Delete'),
        ),
      ),
      cancel: ElevatedButton(
        onPressed: () async => Navigator.of(Get.overlayContext!).pop(),
        style: ElevatedButton.styleFrom(
          backgroundColor: TColors.darkerGrey,
          side: const BorderSide(color: TColors.darkerGrey),
        ),
        child: const Padding(
          padding: EdgeInsets.symmetric(horizontal: TSizes.lg),
          child: Text('Cancel'),
        ),
      ),
      // cancel: OutlinedButton(
      //   onPressed: () => Navigator.of(Get.overlayContext!).pop(),
      //   child: const Text('Cancel'),
      // ),
    );
  }

  // Delete user account
  void deleteUserAccount() async {
    try {
      TFullScreenLoader.openLoadingDialog(
        'We are updating your information...',
        TImages.darkAppLogo,
      );

      // First re-authenticate user
      final auth = AuthenticationRepository.instance;
      final provider =
          auth.authUser!.providerData.map((e) => e.providerId).first;
      if (provider.isNotEmpty) {
        // Re Verify Auth Email
        if (provider == 'google.com') {
          await auth.signInWithGoogle();
          await auth.deleteAccount();
          TFullScreenLoader.stopLoading();
          Get.offAll(() => const LoginScreen());
        } else if (provider == 'password') {
          TFullScreenLoader.stopLoading();
        }
        Get.to(() => const ReAuthLoginForm());
      }
    } catch (e) {
      TFullScreenLoader.stopLoading();
      TLoaders.warningSnackBar(title: 'Error', message: e.toString());
    }
  }

  // Re-Authenticate before deleting
  Future<void> reAuthenticateEmailAndPassword() async {
    try {
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
      if (!reAuthFormKey.currentState!.validate()) {
        // Remove Loader
        TFullScreenLoader.stopLoading();
        return;
      }

      await AuthenticationRepository.instance
          .reAuthenticateWithEmailAndPassword(
        verifyEmail.text.trim(),
        verifyPassword.text.trim(),
      );
      await AuthenticationRepository.instance.deleteAccount();
      TFullScreenLoader.stopLoading();
      Get.offAll(() => const LoginScreen());
    } catch (e) {
      TFullScreenLoader.stopLoading();
      TLoaders.warningSnackBar(title: 'Error', message: e.toString());
    }
  }
}
