import 'dart:convert';
import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;

import 'package:domain_entities/domain_entities.dart';
import 'package:http/http.dart';
import 'package:logger/logger.dart';
import 'package:sports_repository/sports_repository.dart';

class GameRemoteStorage implements SportsStorage {
  static const url =
      "https://api.sportsdata.io/v3/nba/scores/json/Games/2025?key=baec8b74561642bb974d3b5bc0091f65";

  GameRemoteStorage({@visibleForTesting http.Client? client})
      : _client = client ?? http.Client();

  final http.Client _client;

  final logger = Logger();

  @override
  Future<List<Game>> getAllGames() async {
    final games = <Game>[];

    try {
      final parsedUrl = Uri.parse(url);

      final response = await http.get(parsedUrl);
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
