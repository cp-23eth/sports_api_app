import 'dart:convert';
import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;

import 'package:domain_entities/domain_entities.dart';
import 'package:http/http.dart';
import 'package:logger/logger.dart';
import 'package:sports_repository/sports_repository.dart';

class PlayerRemoteStorage implements SportsPlayerStorage {
  static const url =
      "https://api.sportsdata.io/v3/nba/scores/json/PlayersActiveBasic?key=e0cc9fd0e6e64ec6934939efa4abd788";

  PlayerRemoteStorage({@visibleForTesting http.Client? client})
      : _client = client ?? http.Client();

  final http.Client _client;

  final logger = Logger();

  @override
  Future<List<Player>> getAllPlayers() async {
    final players = <Player>[];

    try {
      final parsedUrl = Uri.parse(url);

      final response = await _client.get(parsedUrl);
      final statusCode = response.statusCode;

      if (statusCode != 200) {
        logger.e("Failed to get players. Status code: $statusCode");
      }

      final json = response.body;
      final data = jsonDecode(json);

      if (data != null) {
        data.forEach((playerData) {
          players.add(PlayerApiModel.fromJson(playerData).toDomainEntity());
        });
      }

      return players;
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
