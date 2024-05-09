import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';
import 'package:myfm/features/personalization/models/user_model.dart';

class UserRepository extends GetxController {
  static UserRepository get instance => Get.find();

  final FirebaseFirestore _db = FirebaseFirestore.instance;

  // Function to save user data to Firestore
  Future<void> saveUserRecord(UserModel user) async {
    try {
      await _db.collection("User").doc(user.id).set(user.toJson());
    } /*on FirebaseAuthException catch (e) {
      throw '';
    } on FirebaseException catch (e) {
      throw '';
    } on FormatException catch (e) {
      throw '';
    } on PlatformException catch (e) {
    }*/
    catch (e) {
      throw 'Something went wrong. Please try again';
    }
  }
}
