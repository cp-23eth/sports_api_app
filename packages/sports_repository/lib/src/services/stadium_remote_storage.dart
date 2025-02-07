import 'dart:convert';
import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;

import 'package:domain_entities/domain_entities.dart';
import 'package:http/http.dart';
import 'package:logger/logger.dart';
import 'package:sports_repository/sports_repository.dart';

class StadiumRemoteStorage implements SportsSatdiumStorage {
  static const url =
      "https://api.sportsdata.io/v3/nba/scores/json/Stadiums?key=baec8b74561642bb974d3b5bc0091f65";

  StadiumRemoteStorage({@visibleForTesting http.Client? client})
      : _client = client ?? http.Client();

  final http.Client _client;

  final logger = Logger();

  @override
  Future<List<Stadium>> getAllStadiums() async {
    final stadiums = <Stadium>[];

    try {
      final parsedUrl = Uri.parse(url);

      final response = await _client.get(parsedUrl);
      final statusCode = response.statusCode;

      if (statusCode != 200) {
        logger.e("Failed to get stadiums. Status code: $statusCode");
      }

      final json = response.body;
      final data = jsonDecode(json);

      if (data != null) {
        data.forEach((stadiumData) {
          stadiums.add(StadiumApiModel.fromJson(stadiumData).toDomainEntity());
        });
      }

      return stadiums;
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
