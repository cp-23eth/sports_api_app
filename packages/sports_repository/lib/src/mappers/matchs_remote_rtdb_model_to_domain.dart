import 'package:domain_entities/domain_entities.dart';
import 'package:sports_repository/src/models/matchs_remote_rtdb_model.dart';

extension MatchsRemoteRtdbModelToDomain on MatchsRemoteRtdbModel {
  Matchs toDomainEntity() {
    return Matchs(
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