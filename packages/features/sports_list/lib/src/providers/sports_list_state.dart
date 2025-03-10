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
    required this.regularGames,
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
      regularGames: List<Game>.empty(),
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
  final List<Game> regularGames;
  final List<StatsTeam> statsTeam;
  final User user;

  @override
  List<Object> get props =>
      [status, teams, players, stadiums, games, regularGames, statsTeam, user];

  @override
  bool get stringify => true;

  SportsListState copyWith({
    SportsListStatus? status,
    List<Team>? teams,
    List<Player>? players,
    List<Stadium>? stadiums,
    List<Game>? games,
    List<Game>? regularGames,
    List<StatsTeam>? statsTeam,
    User? user,
  }) {
    return SportsListState(
      status: status ?? this.status,
      teams: teams ?? this.teams,
      players: players ?? this.players,
      stadiums: stadiums ?? this.stadiums,
      games: games ?? this.games,
      regularGames: regularGames ?? this.regularGames,
      statsTeam: statsTeam ?? this.statsTeam,
      user: user ?? this.user,
    );
  }
}
