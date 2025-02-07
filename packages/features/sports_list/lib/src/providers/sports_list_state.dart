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
  });

  factory SportsListState.initial() {
    return SportsListState(
      status: SportsListStatus.initial,
      teams: List<Team>.empty(),
      players: List<Player>.empty(),
      stadiums: List<Team>.empty(),
      games: List<Player>.empty(),
    );
  }

  final SportsListStatus status;
  final List<Team> teams;
  final List<Player> players;
  final List<Team> stadiums;
  final List<Player> games;

  @override
  List<Object> get props => [status, teams, players, stadiums, games];

  @override
  bool get stringify => true;

  SportsListState copyWith({
    SportsListStatus? status,
    List<Team>? teams,
    List<Player>? players,
    List<Team>? stadiums,
    List<Player>? games,
  }) {
    return SportsListState(
      status: status ?? this.status,
      teams: teams ?? this.teams,
      players: players ?? this.players,
      stadiums: stadiums ?? this.stadiums,
      games: games ?? this.games,
    );
  }
}
