import 'dart:convert';
import 'dart:io';

import 'package:domain_entities/domain_entities.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:sports_repository/sports_repository.dart';
import 'package:logger/logger.dart';

class StatsTeamRemoteStorage implements SportsStatsTeamStorage {
  static const url =
      'https://api.sportsdata.io/v3/nba/scores/json/TeamSeasonStats/2025?key=f4feab5250c84378afa7a68b738177bf';

  StatsTeamRemoteStorage({@visibleForTesting http.Client? client})
      : _client = client ?? http.Client();

  final http.Client _client;

  final logger = Logger();

  @override
  Future<List<StatsTeam>> getAllStatsTeams() async {
    final statsTeams = <StatsTeam>[];

    try {
      final parsedUrl = Uri.parse(url);
      final response = await _client.get(parsedUrl);
      final statusCode = response.statusCode;

      if (statusCode != 200) {
        debugPrint('Failed to get stats team. Status code: $statusCode');
      }

      final json = response.body;
      final data = jsonDecode(json);

      if (data != null) {
        data.forEach((statsTeamData) {
          statsTeams
              .add(StatsTeamApiModel.fromJson(statsTeamData).toDomainEntity());
        });
      }

      return statsTeams;
    } on HttpException catch (_) {
      logger.w('Ressources introuvables');
      rethrow;
    } on http.ClientException catch (_) {
      logger.w('Problème de connexion au serveur');
      rethrow;
    } catch (e) {
      logger.w(e.toString());
      rethrow;
    }
  }
}
