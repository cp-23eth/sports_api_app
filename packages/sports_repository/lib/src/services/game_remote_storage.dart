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
      "https://api.sportsdata.io/v3/nba/scores/json/Games/2025?key=0febfae05c3d44d5acb4e53e2b022b39";

  static const urlPre =
      "https://api.sportsdata.io/v3/nba/scores/json/Games/2025PRE?key=0febfae05c3d44d5acb4e53e2b022b39";

  static const urlPost =
      "https://api.sportsdata.io/v3/nba/scores/json/Games/2025POST?key=0febfae05c3d44d5acb4e53e2b022b39";

  GameRemoteStorage({@visibleForTesting http.Client? client})
      : _client = client ?? http.Client();

  final http.Client _client;

  final logger = Logger();

  @override
  Future<List<Game>> getAllGames() async {
    final games = <Game>[];

    try {
      final parsedUrl = Uri.parse(url);
      final parsedPreUrl = Uri.parse(urlPre);
      final parsedPostUrl = Uri.parse(urlPost);

      final response = await _client.get(parsedUrl);
      final statusCode = response.statusCode;

      final responsePre = await _client.get(parsedPreUrl);
      final statusCodePre = responsePre.statusCode;

      final responsePost = await _client.get(parsedPostUrl);
      final statusCodePost = responsePost.statusCode;

      if (statusCode != 200) {
        logger.e("Failed to get games. Status code: $statusCode");
      }

      if (statusCodePre != 200) {
        logger.e("Failed to get games. Status code: $statusCodePre");
      }

      if (statusCodePost != 200) {
        logger.e("Failed to get games. Status code: $statusCodePost");
      }

      final json = response.body;
      final data = jsonDecode(json);

      final jsonPre = responsePre.body;
      final dataPre = jsonDecode(jsonPre);

      final jsonPost = responsePost.body;
      final dataPost = jsonDecode(jsonPost);

      if (data != null) {
        data.forEach((gameData) {
          games.add(GameApiModel.fromJson(gameData).toDomainEntity());
        });
      }

      if (dataPre != null) {
        dataPre.forEach((gameData) {
          games.add(GameApiModel.fromJson(gameData).toDomainEntity());
        });
      }

      if (dataPost != null) {
        dataPost.forEach((gameData) {
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
