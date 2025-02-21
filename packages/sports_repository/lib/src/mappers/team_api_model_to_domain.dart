import 'package:domain_entities/domain_entities.dart';
import 'package:sports_repository/src/models/team_api_model.dart';

extension TeamApiModelToDomain on TeamApiModel {
  Team toDomainEntity() {
    return Team(
      teamId: teamId,
      active: active,
      key: key,
      city: city,
      name: name,
      headCoach: headCoach,
      logo: logo,
      primaryColor: primaryColor,
      secondaryColor: secondaryColor,
      tertiaryColor: tertiaryColor,
    );
  }
}
