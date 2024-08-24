import 'package:cloud_firestore/cloud_firestore.dart';

class PlayerDetModel {
  // final values  for those you don't want to update
  final String id, userId, dtCri;
  String name, nationality, dateOfBirth, position, role, dtAct;
  int? height;
  String? foot;

  // Constructor
  PlayerDetModel({
    required this.id,
    required this.userId,
    required this.name,
    required this.nationality,
    required this.dateOfBirth,
    required this.position,
    required this.role,
    required this.height,
    required this.foot,
    required this.dtCri,
    required this.dtAct,
  });

  static PlayerDetModel empty() => PlayerDetModel(
        id: '',
        userId: '',
        name: '',
        nationality: '',
        dateOfBirth: '',
        position: '',
        role: '',
        height: null,
        foot: null,
        dtCri: '',
        dtAct: '',
      );

  // Convert model to JSON structure for storing data in Firebase
  Map<String, dynamic> toJson() {
    return {
      'user_id': userId,
      'name': name,
      'nationality': nationality,
      'date_of_birth': dateOfBirth,
      'position': position,
      'role': role,
      'height': height,
      'foot': foot,
      'dt_cri': dtCri,
      'dt_act': dtAct,
    };
  }

  // Factory method to create a userModel from a Firebase document snapshot
  factory PlayerDetModel.fromSnapshot(
      DocumentSnapshot<Map<String, dynamic>> document) {
    final data = document.data();
    if (data != null) {
      return PlayerDetModel(
        id: document.id,
        userId: data['user_id'] ?? '',
        name: data['name'] ?? '',
        nationality: data['nationality'] ?? '',
        dateOfBirth: data['date_of_birth'] ?? '',
        position: data['position'] ?? '',
        role: data['role'],
        height: data['height'],
        foot: data['foot'],
        dtCri: data['dt_cri'] ?? '',
        dtAct: data['dt_act'] ?? '',
      );
    }
    return empty();
  }
}
