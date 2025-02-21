import 'package:domain_entities/domain_entities.dart';
import 'package:sports_repository/src/models/stats_team_api_model.dart';

extension StatsTeamApiModelToDomain on StatsTeamApiModel {
  StatsTeam toDomainEntity() {
    return StatsTeam(
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
}