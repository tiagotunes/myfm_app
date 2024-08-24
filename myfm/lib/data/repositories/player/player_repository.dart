import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:myfm/features/personalization/models/player_det_model.dart';
import 'package:myfm/features/personalization/models/player_model.dart';
import 'package:myfm/utils/exceptions/firebase_exceptions.dart';
import 'package:myfm/utils/exceptions/platform_exceptions.dart';

class PlayerRepository extends GetxController {
  static PlayerRepository get instance => Get.find();

  final FirebaseFirestore _db = FirebaseFirestore.instance;

  // Get User Team Players
  Future<List<PlayerModel>> getUserTeamPlayers(String teamId) async {
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

  // Get Players Details
  Future<List<PlayerDetModel>> getPlayersDetails(List<int> playerIds) async {
    try {
      final snapshot = await _db
          .collection('Player')
          .where('team_id', whereIn: playerIds)
          .get();
      final list = snapshot.docs
          .map((document) => PlayerDetModel.fromSnapshot(document))
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

  // Save Player
  Future<void> savePlayer(PlayerDetModel player) async {
    try {
      await _db.collection("Player Detail").doc().set(player.toJson());
    } on FirebaseException catch (e) {
      throw TFirebaseException(e.code).message;
    } on PlatformException catch (e) {
      throw TPlatformException(e.code).message;
    } catch (e) {
      throw 'Something went wrong. Please try again';
    }
  }

  // Add Player to User Team
  Future<void> addPlayerTeam(PlayerModel player) async {
    try {
      await _db.collection("Player").doc().set(player.toJson());
    } on FirebaseException catch (e) {
      throw TFirebaseException(e.code).message;
    } on PlatformException catch (e) {
      throw TPlatformException(e.code).message;
    } catch (e) {
      throw 'Something went wrong. Please try again';
    }
  }
}
