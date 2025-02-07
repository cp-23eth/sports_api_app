import 'package:domain_entities/domain_entities.dart';

abstract class SportsStorage {
  Future<List<Game>> getAllGames();
}
