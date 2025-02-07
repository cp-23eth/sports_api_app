import 'package:domain_entities/domain_entities.dart';

abstract class SportsGameStorage {
  Future<List<Game>> getAllGames();
}

abstract class SportsPlayerStorage {
  Future<List<Player>> getAllPlayers();
}

abstract class SportsSatdiumStorage {
  Future<List<Stadium>> getAllStadiums();
}

abstract class SportsTeamStorage {
  Future<List<Team>> getAllTeams();
}
