import 'package:domain_entities/domain_entities.dart';
import 'package:sports_repository/sports_repository.dart';

extension PlayerRemoteRtdbModelToDomain on PlayerRemoteRtdbModel {
  Player toDomainEntity() {
    return Player(
      playerId: playerId,
      status: status,
      teamId: teamId,
      team: team,
      jersey: jersey,
      position: position,
      firstName: firstName,
      lastName: lastName,
      birthDate: birthDate,
      birthCity: birthCity,
      birthCountry: birthCountry,
      height: height,
      weight: weight,
    );
  }
}
