import 'package:cloud_firestore/cloud_firestore.dart';

class UserModel {
  // final values  for those you don't want to update
  final String id, email, dtCri;
  String name, username, nationality, dateOfBirth, profilePicture, dtAct;

  // Constructor
  UserModel({
    required this.id,
    required this.name,
    required this.username,
    required this.email,
    required this.nationality,
    required this.dateOfBirth,
    required this.profilePicture,
    required this.dtCri,
    required this.dtAct,
  });

  static UserModel empty() => UserModel(
        id: '',
        name: '',
        username: '',
        email: '',
        nationality: '',
        dateOfBirth: '',
        profilePicture: '',
        dtCri: '',
        dtAct: '',
      );

  // Convert model to JSON structure for storing data in Firebase
  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'username': username,
      'email': email,
      'nationality': nationality,
      'date_of_birth': dateOfBirth,
      'profile_picture': profilePicture,
      'dt_cri': dtCri,
      'dt_act': dtAct,
    };
  }

  // Factory method to create a userModel from a Firebase document snapshot
  factory UserModel.fromSnapshot(
      DocumentSnapshot<Map<String, dynamic>> document) {
    final data = document.data();
    if (data != null) {
      return UserModel(
        id: document.id,
        name: data['name'] ?? '',
        username: data['username'] ?? '',
        email: data['email'] ?? '',
        nationality: data['nationality'] ?? '',
        dateOfBirth: data['date_of_birth'] ?? '',
        profilePicture: data['profile_picture'] ?? '',
        dtCri: data['dt_cri'] ?? '',
        dtAct: data['dt_act'] ?? '',
      );
    }
    return empty();
  }
}
