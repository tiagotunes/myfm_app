import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:myfm/features/personalization/models/player_model.dart';
import 'package:myfm/utils/exceptions/firebase_exceptions.dart';
import 'package:myfm/utils/exceptions/platform_exceptions.dart';

class PlayerRepository extends GetxController {
  static PlayerRepository get instance => Get.find();

  final FirebaseFirestore _db = FirebaseFirestore.instance;

  // Get User Players
  Future<List<PlayerModel>> getUserPlayers(String userId) async {
    try {
      final snapshot = await _db
          .collection('Player')
          .where('user_id', isEqualTo: userId)
          .get();
      final list = snapshot.docs
          .map((document) => PlayerModel.fromSnapshot(document))
          .toList();
      return list;
    } on FirebaseException catch (e) {
      throw TFirebaseException(e.code).message;
    } on PlatformException catch (e) {
      throw TPlatformException(e.code).message;
    } catch (e) {
      throw 'Something went wrong. Please try again';
    }
  }

  // Get Team Players
  Future<List<PlayerModel>> getTeamPlayers(String teamId) async {
    try {
      final snapshot = await _db
          .collection('Player')
          .where('team_id', isEqualTo: teamId)
          .get();
      final list = snapshot.docs
          .map((document) => PlayerModel.fromSnapshot(document))
          .toList();
      return list;
    } on FirebaseException catch (e) {
      throw TFirebaseException(e.code).message;
    } on PlatformException catch (e) {
      throw TPlatformException(e.code).message;
    } catch (e) {
      throw 'Something went wrong. Please try again';
    }
  }
}
