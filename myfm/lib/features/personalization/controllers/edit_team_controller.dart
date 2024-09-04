import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:myfm/data/repositories/team/team_repository.dart';
import 'package:myfm/data/repositories/user/user_repository.dart';
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
  Rxn<int> color = Rxn<int>();
  final stadiumName = TextEditingController();
  final bankBalance = TextEditingController();
  final squadBudget = TextEditingController();
  final wageBudget = TextEditingController();
  final logoImg = TextEditingController();
  final logoImgPath = TextEditingController();
  final kitImg = TextEditingController();
  final kitImgPath = TextEditingController();
  final stadiumImg = TextEditingController();
  final stadiumImgPath = TextEditingController();
  GlobalKey<FormState> editTeamFormKey = GlobalKey<FormState>();
  final teamsController = Get.put(TeamsController());
  final teamRepository = Get.put(TeamRepository());
  final userRepository = Get.put(UserRepository());

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

      if (logoImgPath.text != '') {
        logoImgPath.text = await userRepository.uploadImage(
          'Users/Images/Team',
          XFile(logoImgPath.text),
        );
      }
      if (kitImgPath.text != '') {
        kitImgPath.text = await userRepository.uploadImage(
          'Users/Images/Team',
          XFile(kitImgPath.text),
        );
      }
      if (stadiumImgPath.text != '') {
        stadiumImgPath.text = await userRepository.uploadImage(
          'Users/Images/Team',
          XFile(stadiumImgPath.text),
        );
      }

      // Save team in the Firebase Firestore
      final newTeam = TeamModel(
        id: '',
        userId: userController.user.value.id,
        name: name.text.trim(),
        country: countryID.text.trim(),
        season: int.parse(season.text.trim()),
        stadiumName:
            stadiumName.text.trim() != "" ? stadiumName.text.trim() : null,
        color: color.value,
        bankBalance: bankBalance.text.trim() != ""
            ? int.parse(bankBalance.text.trim())
            : null,
        squadBudget: squadBudget.text.trim() != ""
            ? int.parse(squadBudget.text.trim())
            : null,
        wageBudget: wageBudget.text.trim() != ""
            ? int.parse(wageBudget.text.trim())
            : null,
        logo: logoImgPath.text.trim() != "" ? logoImgPath.text.trim() : null,
        kit: kitImgPath.text.trim() != "" ? kitImgPath.text.trim() : null,
        stadiumImg: stadiumImgPath.text.trim() != ""
            ? stadiumImgPath.text.trim()
            : null,
        dtCri: DateTime.now().toString().split('.')[0],
        dtAct: null,
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

        if (img == 'logo') {
          logoImgPath.text = image.path;
          logoImg.text = getFileName(image.path);
        }

        if (img == 'kit') {
          kitImgPath.text = image.path;
          kitImg.text = getFileName(image.path);
        }

        if (img == 'stadium') {
          stadiumImgPath.text = image.path;
          stadiumImg.text = getFileName(image.path);
        }
      }
    } catch (e) {
      TLoaders.errorSnackbar(
          title: 'Error', message: 'Something went wrong: $e');
    }
  }
}
