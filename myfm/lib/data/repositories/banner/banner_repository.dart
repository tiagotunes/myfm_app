import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:myfm/features/fm/models/banner_model.dart';
import 'package:myfm/utils/exceptions/firebase_exceptions.dart';
import 'package:myfm/utils/exceptions/platform_exceptions.dart';

class BannerRepository extends GetxController {
  static BannerRepository get instace => Get.find();

  // Variables
  final _db = FirebaseFirestore.instance;

  // Get all order related to current User
  Future<List<BannerModel>> fetchBanners() async {
    try {
      final result =
          await _db.collection('Banner').where('active', isEqualTo: true).get();
      return result.docs.map((b) => BannerModel.fromSnapshot(b)).toList();
    } on FirebaseException catch (e) {
      throw TFirebaseException(e.code).message;
    } on PlatformException catch (e) {
      throw TPlatformException(e.code).message;
    } catch (e) {
      throw 'Something went wrong. Please try again';
    }
  }

  // Upload Banners to the Cloud Firebase
}
