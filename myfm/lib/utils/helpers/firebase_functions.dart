import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/services.dart';
import 'package:myfm/features/fm/models/country_model.dart';
import 'package:myfm/utils/exceptions/firebase_exceptions.dart';
import 'package:myfm/utils/exceptions/format_exceptions.dart';
import 'package:myfm/utils/exceptions/platform_exceptions.dart';

class TFirebaseFunctions {
  static void readCountriesFromJSON() async {
    // Read the JSON file
    final String jsonString =
        await rootBundle.loadString('assets/icons/countries/countries.json');

    // Parse te JSON string to a list of maps
    final List<dynamic> jsonList = jsonDecode(jsonString) as List<dynamic>;

    int i = 0;
    // Convert each map to a CountryModel object
    for (var c in jsonList) {
      i += 1;
      CountryModel country = CountryModel(
        id: i.toString(),
        name: c['name'],
        nationality: c['nationality'],
        cca2: c['cca2'],
        continent: c['continent'],
        confederation: c['confederation'],
        flag: c['flag'],
        active: true,
        dtCri: DateTime.now().toString().split('.')[0],
      );

      final FirebaseFirestore _db = FirebaseFirestore.instance;
      try {
        await _db.collection("Country").doc(country.id).set(country.toJson());
      } on FirebaseException catch (e) {
        throw TFirebaseException(e.code).message;
      } on FormatException catch (_) {
        throw TFormatException();
      } on PlatformException catch (e) {
        throw TPlatformException(e.code).message;
      } catch (e) {
        throw 'Something went wrong. Please try again';
      }
    }
  }

  // static void uploadBanners() async {
  //   final List<BannerModel> banners = [
  //     BannerModel(imageUrl: imageUrl, targetScreen: '/', active: true),
  //     BannerModel(imageUrl: imageUrl, targetScreen: '/', active: true),
  //     BannerModel(imageUrl: imageUrl, targetScreen: '/', active: true),
  //   ];
  // }
}
