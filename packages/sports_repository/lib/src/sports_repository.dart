import 'package:domain_entities/domain_entities.dart';
import 'package:sports_repository/sports_repository.dart';

class SportsRepository {
  const SportsRepository({required this.storageGame, required this.storagePlayer, required this.storageTeam, required this.storageStadium, required this.storageStatsTeam});

  final SportsGameStorage storageGame;
  final SportsPlayerStorage storagePlayer;
  final SportsTeamStorage storageTeam;
  final SportsSatdiumStorage storageStadium;
  final SportsStatsTeamStorage storageStatsTeam;

  Future<List<Game>> getAllGames() async {
    return storageGame.getAllGames();
  }

  Future<List<Player>> getAllPlayers() async {
    return storagePlayer.getAllPlayers();
  }

  Future<List<Team>> getAllTeams() async {
    return storageTeam.getAllTeams();
  }

  Future<List<Stadium>> getAllStadiums() async {
    return storageStadium.getAllStadiums();
  }

  Future<List<StatsTeam>> getAllStatsTeams() async {
    return storageStatsTeam.getAllStatsTeams();
  }
}