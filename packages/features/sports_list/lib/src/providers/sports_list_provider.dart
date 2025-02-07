import 'package:flutter/cupertino.dart';
import 'package:equatable/equatable.dart';
import 'package:domain_entities/domain_entities.dart';

part 'sports_list_state.dart';

class SportsListProvider with ChangeNotifier {
  SportsListState _state = SportsListState.initial();

  // SportsListProvider({required this.repository});
  // final SportsRepository repository;

  SportsListState get state => _state;

  Future<void> fetchAndSetTomes() async {
    _state = _state.copyWith(status: SportsListStatus.loading);
  }
}