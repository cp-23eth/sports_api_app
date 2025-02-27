import 'package:equatable/equatable.dart';

// ignore: must_be_immutable
class User extends Equatable {
  User({
    required this.username,
    required this.favoriteTeams,
    required this.appColorTeam,
    required this.homeScreenDesign,
    required this.teamScreenDesign,
  });

  final String username;
  final List<int> favoriteTeams;
  String appColorTeam;
  String homeScreenDesign;
  String teamScreenDesign;

  @override
  List<Object?> get props => [
        username,
        favoriteTeams,
        appColorTeam,
        homeScreenDesign,
        teamScreenDesign,
      ];

  @override
  bool? get stringify => true;
}
