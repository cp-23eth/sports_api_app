import 'package:domain_entities/domain_entities.dart';
import 'package:sports_repository/sports_repository.dart';

extension UserModelToDomain on UserModel {
  User toDomainEntity() {
    return User(
      username: username,
      favoriteTeams: favoriteTeams,
      favoritePlayers: favoritePlayers,
      appColorTeam: appColorTeam,
      homeScreenDesign: homeScreenDesign,
      teamScreenDesign: teamScreenDesign,
    );
  }
}
