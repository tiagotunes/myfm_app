import 'package:cloud_firestore/cloud_firestore.dart';

class TeamModel {
  // final values  for those you don't want to update
  final String id, userId, dtCri;
  String name, country, season, color, stadiumName, dtAct;
  int? bankBalance, squadBudget, wageBudget;
  String logo, kit, stadiumImg;

  // Constructor
  TeamModel({
    required this.id,
    required this.userId,
    required this.name,
    required this.country,
    required this.season,
    required this.stadiumName,
    required this.color,
    required this.bankBalance,
    required this.squadBudget,
    required this.wageBudget,
    required this.logo,
    required this.kit,
    required this.stadiumImg,
    required this.dtCri,
    required this.dtAct,
  });

  static TeamModel empty() => TeamModel(
        id: '',
        userId: '',
        name: '',
        country: '',
        season: '',
        stadiumName: '',
        color: '',
        bankBalance: null,
        squadBudget: null,
        wageBudget: null,
        logo: '',
        kit: '',
        stadiumImg: '',
        dtCri: '',
        dtAct: '',
      );

  // Convert model to JSON structure for storing data in Firebase
  Map<String, dynamic> toJson() {
    return {
      'user_id': userId,
      'name': name,
      'country': country,
      'season': season,
      'stadium_name': stadiumName,
      'color': color,
      'bank_balance': bankBalance,
      'squad_budget': squadBudget,
      'wage_budget': wageBudget,
      'logo': logo,
      'kit': kit,
      'stadium_img': stadiumImg,
      'dt_cri': dtCri,
      'dt_act': dtAct,
    };
  }

  // Factory method to create a userModel from a Firebase document snapshot
  factory TeamModel.fromSnapshot(
      DocumentSnapshot<Map<String, dynamic>> document) {
    final data = document.data();
    if (data != null) {
      return TeamModel(
        id: document.id,
        userId: data['user_id'] ?? '',
        name: data['name'] ?? '',
        country: data['country'] ?? '',
        season: data['season'] ?? '',
        stadiumName: data['stadium_name'] ?? '',
        color: data['color'] ?? '',
        bankBalance: data['bank_balance'],
        squadBudget: data['squad_budget'],
        wageBudget: data['wage_budget'],
        logo: data['logo'] ?? '',
        kit: data['kit'] ?? '',
        stadiumImg: data['stadium_img'] ?? '',
        dtCri: data['dt_cri'] ?? '',
        dtAct: data['dt_act'] ?? '',
      );
    }
    return empty();
  }
}
