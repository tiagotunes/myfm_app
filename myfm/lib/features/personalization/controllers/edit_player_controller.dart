import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:myfm/data/repositories/player/player_repository.dart';
import 'package:myfm/data/repositories/user/user_repository.dart';
import 'package:myfm/features/fm/controllers/players_controller.dart';
import 'package:myfm/features/personalization/controllers/country_controller.dart';
import 'package:myfm/features/personalization/controllers/user_controller.dart';
import 'package:myfm/features/personalization/models/player_model.dart';
import 'package:myfm/features/personalization/models/team_model.dart';
import 'package:myfm/utils/constants/image_strings.dart';
import 'package:myfm/utils/helpers/network_manager.dart';
import 'package:myfm/utils/popups/full_screen_loader.dart';
import 'package:myfm/utils/popups/loaders.dart';

class EditPlayerController extends GetxController {
  static EditPlayerController get instance => Get.find();

  // Variables
  final userController = Get.put(UserController());
  var team = TeamModel.empty();
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
  final footL = false.obs;
  final footR = false.obs;
  final number = TextEditingController();
  final freeAgent = 0;
  final value = TextEditingController();
  final wage = TextEditingController();
  final releaseClause = TextEditingController();
  final onLoan = false.obs;
  final loanFrom = TextEditingController();
  final loaned = false.obs;
  final loanedTo = TextEditingController();
  final ca = TextEditingController();
  final pa = TextEditingController();
  GlobalKey<FormState> editPlayerFormKey = GlobalKey<FormState>();
  final teamID = "";
  final playersController = Get.put(PlayersController());
  final playerRepository = Get.put(PlayerRepository());
  final userRepository = Get.put(UserRepository());

  Future<void> savePlayerData() async {
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

      // Save player in the Firebase Firestore
      final newPlayer = PlayerModel(
        id: '',
        userId: userController.user.value.id,
        teamId: team.id,
        name: name.text.trim(),
        nationality: nationalityID.text.trim(),
        dateOfBirth: dateOfBirth.text.trim(),
        function: function.text.trim(),
        position: position.text.trim(),
        role: role.text.trim(),
        height: height.text != "" ? int.parse(height.text.trim()) : null,
        footL: footL.value,
        footR: footR.value,
        number: number.text != "" ? int.parse(number.text.trim()) : null,
        freeAgent: false,
        value: value.text != "" ? int.parse(value.text.trim()) : 0,
        wage: wage.text != "" ? int.parse(wage.text.trim()) : 0,
        releaseClause: releaseClause.text != ""
            ? int.parse(releaseClause.text.trim())
            : null,
        onLoan: onLoan.value,
        loanFrom: loanFrom.text.trim(),
        loaned: loaned.value,
        loanedTo: loanedTo.text.trim(),
        ca: ca.text != "" ? int.parse(ca.text.trim()) : null,
        pa: pa.text != "" ? int.parse(pa.text.trim()) : null,
        dtCri: DateTime.now().toString().split('.')[0],
        dtAct: '',
      );
      await playerRepository.savePlayerRecord(newPlayer);

      // Remove Loader
      TFullScreenLoader.stopLoading();

      // Move to previous screen
      Get.back();
      playersController.refreshTeamPlayers(team.id);

      // Show Success Message
      TLoaders.sucessSnackBar(
        title: 'Success',
        message: 'Your player has been created.',
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
