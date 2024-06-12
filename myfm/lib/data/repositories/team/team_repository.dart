import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:myfm/features/personalization/models/team_model.dart';
import 'package:myfm/utils/exceptions/firebase_exceptions.dart';
import 'package:myfm/utils/exceptions/platform_exceptions.dart';

class TeamRepository extends GetxController {
  static TeamRepository get instance => Get.find();

  final FirebaseFirestore _db = FirebaseFirestore.instance;

  // Function to save team data to Firestore
  Future<void> saveTeamRecord(TeamModel team) async {
    try {
      await _db.collection("Team").doc().set(team.toJson());
    } on FirebaseException catch (e) {
      throw TFirebaseException(e.code).message;
    } on PlatformException catch (e) {
      throw TPlatformException(e.code).message;
    } catch (e) {
      throw 'Something went wrong. Please try again';
    }
  }

  // Get all Teams
  Future<List<TeamModel>> getAllTeams() async {
    try {
      final snapshot = await _db.collection('Team').get();
      final list = snapshot.docs
          .map((document) => TeamModel.fromSnapshot(document))
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

  // Get User Teams
  Future<List<TeamModel>> getUserTeams(String userId) async {
    try {
      final snapshot = await _db
          .collection('Team')
          .where('user_id', isEqualTo: userId)
          .get();
      final list = snapshot.docs
          .map((document) => TeamModel.fromSnapshot(document))
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
