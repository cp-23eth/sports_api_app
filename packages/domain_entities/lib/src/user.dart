import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

class User extends Equatable {
  const User({
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

  @override
  List<Object?> get props => [
        username,
        favoriteTeams,
        favoritePlayers,
        headerFooterColor,
        comingsMatchsColor,
        latestsMatchsColor,
        todaysMatchsColor,
        teamsHeaderColor,
        teamsStadiumColor,
        teamsPlayersColor,
        backgroundColor,
      ];

  @override
  bool? get stringify => true;
}
