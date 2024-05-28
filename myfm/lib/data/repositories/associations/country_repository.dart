import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:myfm/features/fm/models/country_model.dart';
import 'package:myfm/utils/exceptions/firebase_exceptions.dart';
import 'package:myfm/utils/exceptions/platform_exceptions.dart';

class CountryRepository extends GetxController {
  static CountryRepository get instance => Get.find();

  // Variables
  final _db = FirebaseFirestore.instance;

  // Get all Countries
  Future<List<CountryModel>> getAllCountries() async {
    try {
      final snapshot = await _db.collection('Country').get();
      final list = snapshot.docs
          .map((document) => CountryModel.fromSnapshot(document))
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

  // Upload Countries to the Cloud Firebase
}
