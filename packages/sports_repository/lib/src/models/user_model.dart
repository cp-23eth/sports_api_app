import 'package:flutter/material.dart';

class UserModel {
  UserModel({
    required this.username,
    required this.favoriteTeams,
    required this.favoritePlayers,
    required this.headerFooterColor,
    required this.comingsMatchsColor,
    required this.latestsMatchsColor,
    required this.todaysMatchsColor,
    required this.teamsHeaderColor,
    required this.teamsStadiumColor,
    required this.teamsPlayersColor,
    required this.backgroundColor,
  });

  final String username;
  final List<int> favoriteTeams;
  final List<int> favoritePlayers;
  final Color headerFooterColor;
  final Color comingsMatchsColor;
  final Color latestsMatchsColor;
  final Color todaysMatchsColor;
  final Color teamsHeaderColor;
  final Color teamsStadiumColor;
  final Color teamsPlayersColor;
  final Color backgroundColor;

  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
      username: json['username'],
      favoriteTeams: List<int>.from(json['favoriteTeams']),
      favoritePlayers: List<int>.from(json['favoritePlayers']),
      headerFooterColor: Color(json['headerFooterColor']),
      comingsMatchsColor: Color(json['comingsMatchsColor']),
      latestsMatchsColor: Color(json['latestsMatchsColor']),
      todaysMatchsColor: Color(json['todaysMatchsColor']),
      teamsHeaderColor: Color(json['teamsHeaderColor']),
      teamsStadiumColor: Color(json['teamsStadiumColor']),
      teamsPlayersColor: Color(json['teamsPlayersColor']),
      backgroundColor: Color(json['backgroundColor']),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'username': username,
      'favoriteTeams': favoriteTeams,
      'favoritePlayers': favoritePlayers,
      // ignore: deprecated_member_use
      'headerFooterColor': headerFooterColor.value,
      // ignore: deprecated_member_use
      'comingsMatchsColor': comingsMatchsColor.value,
      // ignore: deprecated_member_use
      'latestsMatchsColor': latestsMatchsColor.value,
      // ignore: deprecated_member_use
      'todaysMatchsColor': todaysMatchsColor.value,
      // ignore: deprecated_member_use
      'teamsHeaderColor': teamsHeaderColor.value,
      // ignore: deprecated_member_use
      'teamsStadiumColor': teamsStadiumColor.value,
      // ignore: deprecated_member_use
      'teamsPlayersColor': teamsPlayersColor.value,
      // ignore: deprecated_member_use
      'backgroundColor': backgroundColor.value,
    };
  }
}
