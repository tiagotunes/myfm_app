import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:myfm/data/repositories/player/player_repository.dart';
import 'package:myfm/data/repositories/user/user_repository.dart';
import 'package:myfm/features/personalization/controllers/country_controller.dart';
import 'package:myfm/features/personalization/controllers/user_controller.dart';
import 'package:myfm/utils/constants/image_strings.dart';
import 'package:myfm/utils/helpers/network_manager.dart';
import 'package:myfm/utils/popups/full_screen_loader.dart';
import 'package:myfm/utils/popups/loaders.dart';

class EditPlayerController extends GetxController {
  static EditPlayerController get instance => Get.find();

  // Variables
  final userController = Get.put(UserController());
  final name = TextEditingController();
  final countryController = Get.put(CountryController());
  final nationality = TextEditingController();
  final nationalityID = TextEditingController();
  final dateOfBirth = TextEditingController();
  final function = TextEditingController();
  final position = TextEditingController();
  final positionEnable = false.obs;
  final role = TextEditingController();
  final roleEnable = false.obs;
  final height = TextEditingController();
  final foot = null;
  final number= TextEditingController();
  final freeAgent = 0;
  final value = TextEditingController();
  final wage = TextEditingController();
  final releaseClause = TextEditingController();
  final onLoan = 0;
  final loanFrom = TextEditingController();
  final loaned = 0;
  final loanedTo = TextEditingController();
  final ca = TextEditingController();
  final pa = TextEditingController();
  GlobalKey<FormState> editPlayerFormKey = GlobalKey<FormState>();
  final teamID = "";
  final userRepository = Get.put(UserRepository());
  final playerRepository = Get.put(PlayerRepository()); 

  Future<void> saveTeamData() async {
    try {
      // Start Loading
      TFullScreenLoader.openLoadingDialog(
        'We are creating your player...',
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
      if (!editPlayerFormKey.currentState!.validate()) {
        // Remove Loader
        TFullScreenLoader.stopLoading();
        return;
      }

      /*if (stadiumImgPath.text != '') {
        stadiumImgPath.text = await userRepository.uploadImage(
          'Users/Images/Team',
          XFile(stadiumImgPath.text),
        );
      }*/

      // Save team in the Firebase Firestore
      // final newPlayer = PlayerModel(
        
      // await teamRepository.saveTeamRecord(newPlayer);

      // Remove Loader
      TFullScreenLoader.stopLoading();

      // Move to previous screen
      // Get.back();
      // teamsController.refresh();

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

  String getFileName(String path) {
    var splitStr = path.split('/');
    return splitStr[splitStr.length - 1];
  }

  chooseImage(String img) async {
    try {
      final image = await ImagePicker().pickImage(
        source: ImageSource.gallery,
        // imageQuality: 70,
        // maxHeight: 512,
        // maxWidth: 512,
      );
      if (image != null) {
        // print(image.path);
        // print(getFileName(image.path));

        // if (img == 'logo') {
        //   logoImgPath.text = image.path;
        //   logoImg.text = getFileName(image.path);
        // }
      }
    } catch (e) {
      TLoaders.errorSnackbar(
          title: 'Error', message: 'Something went wrong: $e');
    }
  }
}