import 'package:domain_entities/domain_entities.dart';
import 'package:sports_repository/src/models/game_api_model.dart';

extension GameApiModelToDomain on GameApiModel {
  Game toDomainEntity() {
    return Game(
      gameId: gameId,
      season: season,
      status: status,
      isClosed: isClosed,
      dateTime: dateTime,
      dateTimeUtc: dateTimeUtc,
      awayTeam: awayTeam,
      awayTeamId: awayTeamId,
      homeTeam: homeTeam,
      homeTeamId: homeTeamId,
      awayTeamScore: awayTeamScore,
      homeTeamScore: homeTeamScore,
      stadiumId: stadiumId,
      refereeId: refereeId,
    );
  }
}
