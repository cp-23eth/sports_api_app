import 'package:domain_entities/domain_entities.dart';
import 'package:sports_repository/src/models/team_remote_rtdb_model.dart';

extension TeamRemoteRtdbModelToDomain on TeamRemoteRtdbModel{
  Team toDomainEntity() {
    return Team(
      teamId: teamId,
      active: active,
      key: key,
      city: city,
      name: name,
      headCoach: headCoach,
      wikipediaLogoUrl: wikipediaLogoUrl,
    );
  }
}