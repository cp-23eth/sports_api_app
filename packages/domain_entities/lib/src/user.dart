import 'package:equatable/equatable.dart';

// ignore: must_be_immutable
class User extends Equatable {
  User({
    required this.username,
    required this.favoriteTeams,
    required this.favoritePlayers,
    required this.appColorTeam,
    required this.homeScreenDesign,
  });

  final String username;
  final List<int> favoriteTeams;
  final List<int> favoritePlayers;
  String appColorTeam;
  final String homeScreenDesign;

  @override
  List<Object?> get props => [
        username,
        favoriteTeams,
        favoritePlayers,
        appColorTeam,
        homeScreenDesign,
      ];

  @override
  bool? get stringify => true;
}
