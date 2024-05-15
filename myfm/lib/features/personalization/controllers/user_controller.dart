import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:myfm/data/repositories/user/user_repository.dart';
import 'package:myfm/features/personalization/models/user_model.dart';
import 'package:myfm/utils/popups/loaders.dart';

class UserController extends GetxController {
  static UserController get instance => Get.find();

  final userRepository = Get.put(UserRepository());

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
}
