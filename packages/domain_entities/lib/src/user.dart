import 'package:equatable/equatable.dart';

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
  final String headerFooterColor;
  final String comingsMatchsColor;
  final String latestsMatchsColor;
  final String todaysMatchsColor;
  final String teamsHeaderColor;
  final String teamsStadiumColor;
  final String teamsPlayersColor;
  final String backgroundColor;

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
