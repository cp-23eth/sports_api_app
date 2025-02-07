import 'package:flutter/cupertino.dart';
import 'package:equatable/equatable.dart';
import 'package:domain_entities/domain_entities.dart';
import 'package:sports_repository/sports_repository.dart';

part 'sports_list_state.dart';

class SportsListProvider with ChangeNotifier {
  SportsListState _state = SportsListState.initial();

  SportsListProvider({required this.repository});
  final SportsRepository repository;

  SportsListState get state => _state;

  Future<void> fetchAndSetSports() async {
    _state = _state.copyWith(status: SportsListStatus.loading);
    notifyListeners();

    final datasGames = await repository.getAllGames();
    final datasPlayers = await repository.getAllPlayers();
    final datasTeams = await repository.getAllTeams();
    final datasStadiums = await repository.getAllStadiums();

    _state = _state.copyWith(
      status: SportsListStatus.loaded,
      games: datasGames,
      players: datasPlayers,
      teams: datasTeams,
      stadiums: datasStadiums,
    );
    notifyListeners();
  }
}