import 'dart:convert';
import 'package:domain_entities/domain_entities.dart';
import 'package:flutter/services.dart';
import 'package:sports_repository/sports_repository.dart';

class UserRemoteStorage implements SportsUserStorage {
  @override
  Future<User> getUser() async {
    final dataString = await rootBundle.loadString(
      'packages/sports_repository/lib/src/assets/data/user.json',
    );
    final List<dynamic> json = jsonDecode(dataString);
    final user = json
        .map((json) => UserModel.fromJson(json).toDomainEntity())
        .firstWhere((user) => user.username == 'Quentin');
    return user;
  }

  @override
  Future<void> addFavoriteTeam(String username, int teamId) async {
    final dataString = await rootBundle.loadString(
      'packages/sports_repository/lib/src/assets/data/user.json',
    );
    final List<dynamic> json = jsonDecode(dataString);

    for (var user in json) {
      if (user['username'] == username) {
        user['favoriteTeams'].add(teamId);
        break;
      }
    }

    final String updatedJson = jsonEncode(json);
    // final file =
    //     File('packages/sports_repository/lib/src/assets/data/user.json');
    // await file.writeAsString(updatedJson);
  }
}
