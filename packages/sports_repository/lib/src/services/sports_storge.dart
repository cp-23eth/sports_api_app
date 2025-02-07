import 'package:domain_entities/domain_entities.dart';

abstract class SportsStorge {
  Future<List<Game>> getAllGames();
}
