part of 'sports_list_provider.dart';

enum SportsListStatus {
  initial,
  loading,
  loaded,
}

class SportsListState extends Equatable {
  const SportsListState({
    required this.status,
    required this.teams,
    required this.players,
    required this.stadiums,
    required this.games,
    required this.preGames,
    required this.regularGames,
    required this.postGames,
    required this.statsTeam,
    required this.user,
  });

  factory SportsListState.initial() {
    return SportsListState(
      status: SportsListStatus.initial,
      teams: List<Team>.empty(),
      players: List<Player>.empty(),
      stadiums: List<Stadium>.empty(),
      games: List<Game>.empty(),
      preGames: List<Game>.empty(),
      regularGames: List<Game>.empty(),
      postGames: List<Game>.empty(),
      statsTeam: List<StatsTeam>.empty(),
      user: User(
        username: '',
        favoriteTeams: List<int>.empty(),
        appColorTeam: '',
        homeScreenDesign: '',
        teamScreenDesign: '',
      ),
    );
  }

  final SportsListStatus status;
  final List<Team> teams;
  final List<Player> players;
  final List<Stadium> stadiums;
  final List<Game> games;
  final List<Game> preGames;
  final List<Game> regularGames;
  final List<Game> postGames;
  final List<StatsTeam> statsTeam;
  final User user;

  @override
  List<Object> get props =>
      [status, teams, players, stadiums, games, preGames, regularGames, postGames, statsTeam, user];

  @override
  bool get stringify => true;

  SportsListState copyWith({
    SportsListStatus? status,
    List<Team>? teams,
    List<Player>? players,
    List<Stadium>? stadiums,
    List<Game>? games,
    List<Game>? preGames,
    List<Game>? regularGames,
    List<Game>? postGames,
    List<StatsTeam>? statsTeam,
    User? user,
  }) {
    return SportsListState(
      status: status ?? this.status,
      teams: teams ?? this.teams,
      players: players ?? this.players,
      stadiums: stadiums ?? this.stadiums,
      games: games ?? this.games,
      preGames: preGames ?? this.preGames,
      regularGames: regularGames ?? this.regularGames,
      postGames: postGames ?? this.postGames,
      statsTeam: statsTeam ?? this.statsTeam,
      user: user ?? this.user,
    );
  }
}
