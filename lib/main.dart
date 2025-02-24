import 'package:flutter/material.dart';
import 'package:sports_list/sports_list.dart';
import 'package:sports_repository/sports_repository.dart';

void main() {
  runApp(const SportsApiApp());
}

class SportsApiApp extends StatelessWidget {
  const SportsApiApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
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
            storageGame: context.read<GameRemoteStorage>(),
            storagePlayer: context.read<PlayerRemoteStorage>(),
            storageStadium: context.read<StadiumRemoteStorage>(),
            storageTeam: context.read<TeamRemoteStorage>(),
            storageStatsTeam: context.read<StatsTeamRemoteStorage>(),
          ),
        ),
        ChangeNotifierProvider<SportsListProvider>(
          create: (context) =>
              SportsListProvider(repository: context.read<SportsRepository>()),
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
