import 'package:cloud_firestore/cloud_firestore.dart';

class PlayerModel {
  // final values  for those you don't want to update
  final String id, userId, teamId, dtCri;
  int value, wage, onLoan, loaned, freeAgent;
  String? role, foot,loanFrom, loanedTo;
  int? releaseClause, height, ca, pa, number;
  String name, nationality, dateOfBirth, function, position, dtAct;

  // Constructor
  PlayerModel({
    required this.id,
    required this.userId,
    required this.teamId,
    required this.name,
    required this.nationality,
    required this.dateOfBirth,
    required this.function,
    required this.position,
    required this.role,
    required this.height,
    required this.foot,
    required this.number,
    required this.freeAgent,
    required this.value,
    required this.wage,
    required this.releaseClause,
    required this.onLoan,
    required this.loanFrom,
    required this.loaned,
    required this.loanedTo,
    required this.ca,
    required this.pa,
    required this.dtCri,
    required this.dtAct,
  });

  static PlayerModel empty() => PlayerModel(
        id: '',
        userId: '',
        teamId: '',
        name: '',
        nationality: '',
        dateOfBirth: '',
        function: '',
        position: '',
        role: null,
        height: null,
        foot: null,
        number: null,
        freeAgent: 1,
        value: 0,
        wage: 0,
        releaseClause: null,
        onLoan: 0,
        loanFrom: '',
        loaned: 0,
        loanedTo: '',
        ca: 0,
        pa: 0,
        dtCri: '',
        dtAct: '',
      );

  // Convert model to JSON structure for storing data in Firebase
  Map<String, dynamic> toJson() {
    return {
      'user_id': userId,
      'team_id': teamId,
      'name': name,
      'nationality': nationality,
      'date_of_birth': dateOfBirth,
      'function': function,
      'position': position,
      'role': role,
      'height': height,
      'foot': foot,
      'number': number,
      'free_agent': freeAgent,
      'value': value,
      'wage': wage,
      'release_clause': releaseClause,
      'on_loan': onLoan,
      'loan_from': loanFrom,
      'loaned': loaned,
      'loaned_to': loanedTo,
      'ca': ca,
      'pa': pa,
      'dt_cri': dtCri,
      'dt_act': dtAct,
    };
  }

  // Factory method to create a userModel from a Firebase document snapshot
  factory PlayerModel.fromSnapshot(
      DocumentSnapshot<Map<String, dynamic>> document) {
    final data = document.data();
    if (data != null) {
      return PlayerModel(
        id: document.id,
        userId: data['user_id'] ?? '',
        teamId: data['team_id'] ?? '',
        name: data['name'] ?? '',
        nationality: data['nationality'] ?? '',
        dateOfBirth: data['date_of_birth'] ?? '',
        function: data['function'] ?? '',
        position: data['position'] ?? '',
        role: data['role'],
        height: data['height'],
        foot: data['foot'],
        number: data['number'],
        freeAgent: data['free_agent'] ?? 0,
        value: data['value'] ?? 0,
        wage: data['wage'] ?? 0,
        releaseClause: data['release_clause'],
        onLoan: data['on_loan'],
        loanFrom: data['loan_from'],
        loaned: data['loaned'],
        loanedTo: data['loaned_to'],
        ca: data['ca'],
        pa: data['pa'],
        dtCri: data['dt_cri'] ?? '',
        dtAct: data['dt_act'] ?? '',
      );
    }
    return empty();
  }
}
