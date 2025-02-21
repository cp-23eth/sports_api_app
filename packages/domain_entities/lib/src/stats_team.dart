import 'package:equatable/equatable.dart';

class StatsTeam extends Equatable {
  const StatsTeam({
    required this.teamId,
    required this.season,
    required this.name,
    required this.team,
    required this.wins,
    required this.losses,
    required this.games,
    required this.minutes,
    required this.seconds,
    required this.fieldGoalsMade,
    required this.fieldGoalsAttempted,
    required this.fieldGoalsPercentage,
    required this.twoPointersMade,
    required this.twoPointersAttempted,
    required this.twoPointersPercentage,
    required this.threePointersMade,
    required this.threePointersAttempted,
    required this.threePointersPercentage,
    required this.rebounds,
    required this.assists,
    required this.steals,
    required this.blockedShot,
    required this.points,
  });

  final int teamId;
  final int season;
  final String name;
  final String team;
  final int wins;
  final int losses;
  final int games;
  final int minutes;
  final int seconds; 
  final double fieldGoalsMade;
  final double fieldGoalsAttempted;
  final double fieldGoalsPercentage;
  final double twoPointersMade;
  final double twoPointersAttempted;
  final double twoPointersPercentage;
  final double threePointersMade;
  final double threePointersAttempted;
  final double threePointersPercentage;
  final double rebounds;
  final double assists;
  final double steals;
  final double blockedShot;
  final double points;

  @override
  List<Object?> get props => [
    teamId,
    season,
    name,
    team,
    wins,
    losses,
    games,
    minutes,
    seconds,
    fieldGoalsMade,
    fieldGoalsAttempted,
    fieldGoalsPercentage,
    twoPointersMade,
    twoPointersAttempted,
    twoPointersPercentage,
    threePointersMade,
    threePointersAttempted,
    threePointersPercentage,
    rebounds,
    assists,
    steals,
    blockedShot,
    points,
  ];

  @override
  bool? get stringify => true;
}
