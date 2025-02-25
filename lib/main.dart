import 'dart:convert';
import 'package:domain_entities/domain_entities.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:sports_list/sports_list.dart';
import 'package:sports_repository/sports_repository.dart';

void main() async {
  runApp(const SportsApiApp());
}

// Future<List<User>> loadUsers() async {
//   try {
//     final String response = await rootBundle.loadString(
//       'packages/sports_repository/lib/src/assets/data/user.json',
//     );
//     final List<dynamic> data = json.decode(response);
//     return data
//         .map((json) => UserModel.fromJson(json).toDomainEntity())
//         .toList();
//   } catch (e) {
//     print('Error reading JSON file: $e');
//     rethrow;
//   }
// }

class SportsApiApp extends StatelessWidget {
  const SportsApiApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        Provider<UserRemoteStorage>(
          create: (context) => UserRemoteStorage(),
        ),
        Provider<GameRemoteStorage>(
          create: (context) => GameRemoteStorage(),
        ),
        Provider<PlayerRemoteStorage>(
          create: (context) => PlayerRemoteStorage(),
        ),
        Provider<StadiumRemoteStorage>(
          create: (context) => StadiumRemoteStorage(),
        ),
        Provider<TeamRemoteStorage>(
          create: (context) => TeamRemoteStorage(),
        ),
        Provider<StatsTeamRemoteStorage>(
          create: (context) => StatsTeamRemoteStorage(),
        ),
        Provider<SportsRepository>(
          create: (context) => SportsRepository(
            userRemoteStorage: context.read<UserRemoteStorage>(),
            storageGame: context.read<GameRemoteStorage>(),
            storagePlayer: context.read<PlayerRemoteStorage>(),
            storageStadium: context.read<StadiumRemoteStorage>(),
            storageTeam: context.read<TeamRemoteStorage>(),
            storageStatsTeam: context.read<StatsTeamRemoteStorage>(),
          ),
        ),
        ChangeNotifierProvider<SportsListProvider>(
          create: (context) => SportsListProvider(
            repository: context.read<SportsRepository>(),
          ),
        ),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'SportsApiApp',
        routes: {
          '/': (context) => const MainNba(),
        },
      ),
    );
  }
}
