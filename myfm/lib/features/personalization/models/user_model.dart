import 'package:cloud_firestore/cloud_firestore.dart';

class UserModel {
  // final values  for those you don't want to update
  final String id, email;
  String name, username, nationality, dateOfBirth, profilePicture;

  // Constructor
  UserModel({
    required this.id,
    required this.name,
    required this.username,
    required this.email,
    required this.nationality,
    required this.dateOfBirth,
    required this.profilePicture,
  });

  static UserModel empty() => UserModel(
        id: '',
        name: '',
        username: '',
        email: '',
        nationality: '',
        dateOfBirth: '',
        profilePicture: '',
      );

  // Convert model to JSON structure for storing data in Firebase
  Map<String, dynamic> toJson() {
    return {
      'Name': name,
      'Username': username,
      'Email': email,
      'Nationality': nationality,
      'DateOfBirth': dateOfBirth,
      'ProfilePicture': profilePicture,
    };
  }

  // Factory method to create a userModel from a Firebase document snapshot
  factory UserModel.fromSnapshot(
      DocumentSnapshot<Map<String, dynamic>> document) {
    final data = document.data();
    if (data != null) {
      return UserModel(
        id: document.id,
        name: data['Name'] ?? '',
        username: data['Username'] ?? '',
        email: data['Email'] ?? '',
        nationality: data['Nationality'] ?? '',
        dateOfBirth: data['DateOfBirth'] ?? '',
        profilePicture: data['ProfilePicture'] ?? '',
      );
    }
    return empty();
  }
}
