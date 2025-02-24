import 'dart:convert';
import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;

import 'package:domain_entities/domain_entities.dart';
import 'package:http/http.dart';
import 'package:logger/logger.dart';
import 'package:sports_repository/sports_repository.dart';

class GameRemoteStorage implements SportsGameStorage {
  static const url =
      "https://api.sportsdata.io/v3/nba/scores/json/Games/2025?key=f4feab5250c84378afa7a68b738177bf";

  GameRemoteStorage({@visibleForTesting http.Client? client})
      : _client = client ?? http.Client();

  final http.Client _client;

  final logger = Logger();

  @override
  Future<List<Game>> getAllGames() async {
    final games = <Game>[];

    try {
      final parsedUrl = Uri.parse(url);

      final response = await _client.get(parsedUrl);
      final statusCode = response.statusCode;

      if (statusCode != 200) {
        logger.e("Failed to get games. Status code: $statusCode");
      }

      final json = response.body;
      final data = jsonDecode(json);

      if (data != null) {
        data.forEach((gameData) {
          games.add(GameApiModel.fromJson(gameData).toDomainEntity());
        });
      }

      return games;
    } on HttpException catch (_) {
      logger.w('Ressources introuvables');
      rethrow;
    } on ClientException catch (_) {
      logger.w('Problème de connexion au serveur');
      rethrow;
    } catch (e) {
      logger.w(e.toString());
      rethrow;
    }
  }
}
