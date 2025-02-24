class StatsTeamApiModel {
  const StatsTeamApiModel({
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

  factory StatsTeamApiModel.fromJson(Map<String, dynamic> json) {
    int? teamId = json['TeamId'];
    teamId ??= 0;
    int? season = json['Season'];
    season ??= 0;
    String? name = json['Name'];
    name ??= '';
    String? team = json['Team'];
    team ??= '';
    int? wins = json['Wins'];
    wins ??= 0;
    int? losses = json['Losses'];
    losses ??= 0;
    int? games = json['Games'];
    games ??= 0;
    int? minutes = json['Minutes'];
    minutes ??= 0;
    int? seconds = json['Seconds'];
    seconds ??= 0;
    double? fieldGoalsMade = json['FieldGoalsMade'];
    fieldGoalsMade ??= 0;
    double? fieldGoalsAttempted = json['FieldGoalsAttempted'];
    fieldGoalsAttempted ??= 0;
    double? fieldGoalsPercentage = json['FieldGoalsPercentage'];
    fieldGoalsPercentage ??= 0;
    double? twoPointersMade = json['TwoPointersMade'];
    twoPointersMade ??= 0;
    double? twoPointersAttempted = json['TwoPointersAttempted'];
    twoPointersAttempted ??= 0;
    double? twoPointersPercentage = json['TwoPointersPercentage'];
    twoPointersPercentage ??= 0;
    double? threePointersMade = json['ThreePointersMade'];
    threePointersMade ??= 0;
    double? threePointersAttempted = json['ThreePointersAttempted'];
    threePointersAttempted ??= 0;
    double? threePointersPercentage = json['ThreePointersPercentage'];
    threePointersPercentage ??= 0;
    double? rebounds = json['Rebounds'];
    rebounds ??= 0;
    double? assists = json['Assists'];
    assists ??= 0;
    double? steals = json['Steals'];
    steals ??= 0;
    double? blockedShot = json['BlockedShots'];
    blockedShot ??= 0;
    double? points = json['Points'];
    points ??= 0;


    return StatsTeamApiModel(
        teamId: teamId,
        season: season,
        name: name,
        team: team,
        wins: wins,
        losses: losses,
        games: games,
        minutes: minutes,
        seconds: seconds,
        fieldGoalsMade: fieldGoalsMade,
        fieldGoalsAttempted: fieldGoalsAttempted,
        fieldGoalsPercentage: fieldGoalsPercentage,
        twoPointersMade: twoPointersMade,
        twoPointersAttempted: twoPointersAttempted,
        twoPointersPercentage: twoPointersPercentage,
        threePointersMade: threePointersMade,
        threePointersAttempted: threePointersAttempted,
        threePointersPercentage: threePointersPercentage,
        rebounds: rebounds,
        assists: assists,
        steals: steals,
        blockedShot: blockedShot,
        points: points,
      );
  }

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
}