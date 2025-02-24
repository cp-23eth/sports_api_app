import 'package:domain_entities/domain_entities.dart';
import 'package:sports_repository/sports_repository.dart';

extension UserModelToDomain on UserModel {
  User toDomainEntity() {
    return User(
      username: username,
      favoriteTeams: favoriteTeams,
      favoritePlayers: favoritePlayers,
      headerFooterColor: headerFooterColor,
      comingsMatchsColor: comingsMatchsColor,
      latestsMatchsColor: latestsMatchsColor,
      todaysMatchsColor: todaysMatchsColor,
      teamsHeaderColor: teamsHeaderColor,
      teamsStadiumColor: teamsStadiumColor,
      teamsPlayersColor: teamsPlayersColor,
      backgroundColor: backgroundColor,
    );
  }
}
