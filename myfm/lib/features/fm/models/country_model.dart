import 'package:cloud_firestore/cloud_firestore.dart';

class CountryModel {
  final String id, dtCri;
  String name, nationality, cca2, continent, confederation, flag, dtAct;

  // Constructor
  CountryModel({
    required this.id,
    required this.name,
    required this.nationality,
    required this.cca2,
    required this.continent,
    required this.confederation,
    required this.flag,
    required this.dtCri,
    required this.dtAct,
  });

  static CountryModel empty() => CountryModel(
        id: '',
        name: '',
        nationality: '',
        cca2: '',
        continent: '',
        confederation: '',
        flag: '',
        dtCri: '',
        dtAct: '',
      );

  // Convert model to JSON structure for storing data in Firebase
  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'nationality': nationality,
      'cca2': cca2,
      'continent': continent,
      'confederation': confederation,
      'flag': flag,
      'dt_cri': dtCri,
      'dt_act': dtAct,
    };
  }

  // Factory method to create a userModel from a Firebase document snapshot
  factory CountryModel.fromSnapshot(
      DocumentSnapshot<Map<String, dynamic>> document) {
    final data = document.data();
    if (data != null) {
      return CountryModel(
        id: document.id,
        name: data['name'],
        nationality: data['nationality'],
        cca2: data['cca2'],
        continent: data['continent'],
        confederation: data['confederation'],
        flag: data['flag'],
        dtCri: data['dt_cri'],
        dtAct: data['dt_act'],
      );
    }
    return empty();
  }
}
