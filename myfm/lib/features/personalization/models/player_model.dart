import 'package:cloud_firestore/cloud_firestore.dart';

class PlayerModel {
  // final values  for those you don't want to update
  final String id, playerId, teamId, dtCri;
  int value, wage, releaseClause, onLoan, loaned;
  String? loanFrom, loanedTo;
  int? ca, pa, number;
  String dtAct;

  // Constructor
  PlayerModel({
    required this.id,
    required this.playerId,
    required this.teamId,
    required this.value,
    required this.wage,
    required this.releaseClause,
    required this.onLoan,
    required this.loanFrom,
    required this.loaned,
    required this.loanedTo,
    required this.ca,
    required this.pa,
    required this.number,
    required this.dtCri,
    required this.dtAct,
  });

  static PlayerModel empty() => PlayerModel(
        id: '',
        playerId: '',
        teamId: '',
        value: 0,
        wage: 0,
        releaseClause: 0,
        onLoan: 0,
        loanFrom: '',
        loaned: 0,
        loanedTo: '',
        ca: 0,
        pa: 0,
        number: 0,
        dtCri: '',
        dtAct: '',
      );

  // Convert model to JSON structure for storing data in Firebase
  Map<String, dynamic> toJson() {
    return {
      'player_id': playerId,
      'team_id': teamId,
      'value': value,
      'wage': wage,
      'releaseClause': releaseClause,
      'onLoan': onLoan,
      'loanFrom': loanFrom,
      'loaned': loaned,
      'loanedTo': loanedTo,
      'ca': ca,
      'pa': pa,
      'number': number,
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
        playerId: data['player_id'] ?? '',
        teamId: data['team_id'] ?? '',
        value: data['value'] ?? '',
        wage: data['wage'] ?? '',
        releaseClause: data['releaseClause'] ?? '',
        onLoan: data['onLoan'],
        loanFrom: data['loanFrom'],
        loaned: data['loaned'],
        loanedTo: data['loanedTo'],
        ca: data['ca'],
        pa: data['pa'],
        number: data['number'],
        dtCri: data['dt_cri'] ?? '',
        dtAct: data['dt_act'] ?? '',
      );
    }
    return empty();
  }
}
