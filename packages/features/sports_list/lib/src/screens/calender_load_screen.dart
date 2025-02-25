import 'package:component_library/component_library.dart';
import 'package:domain_entities/domain_entities.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:loading_indicator/loading_indicator.dart';
import 'package:sports_list/sports_list.dart';

class CalenderLoad extends StatefulWidget {
  const CalenderLoad(
      {required this.user,
      required this.stateTeams,
      required this.stateStadiums,
      required this.stateGames,
      super.key});

  final User user;
  final List<Team> stateTeams;
  final List<Stadium> stateStadiums;
  final List<Game> stateGames;

  @override
  State<CalenderLoad> createState() => _CalenderLoadState();
}

class _CalenderLoadState extends State<CalenderLoad> {
  late Future<Map<String, List<Game>>> _loadDataFuture;

  @override
  void initState() {
    super.initState();
    _loadDataFuture = _loadData();
  }

  Future<Map<String, List<Game>>> _loadData() async {
    // Simulate a network call or data fetching
    await Future.delayed(const Duration(seconds: 1));

    final games = widget.stateGames.reversed.toList();

    // Group games by date
    final groupedGames = <String, List<Game>>{};
    for (var game in games) {
      final dateTime = DateTime.parse(game.dateTimeUtc);
      final date = DateFormat('yyyy-MM-dd').format(dateTime);
      if (!groupedGames.containsKey(date)) {
        groupedGames[date] = [];
      }
      groupedGames[date]!.add(game);
    }

    return groupedGames;
  }

  @override
  Widget build(BuildContext context) {
    final List<Color> kDefaultRainbowColors = [
      Parameter.headerFooterColor,
    ];
    return FutureBuilder<Map<String, List<Game>>>(
      future: _loadDataFuture,
      builder: (ctx, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return Center(
            child: SizedBox(
              height: 300,
              width: 300,
              child: LoadingIndicator(
                indicatorType: Indicator.ballClipRotateMultiple,
                colors: kDefaultRainbowColors,
              ),
            ),
          );
        } else if (snapshot.connectionState == ConnectionState.done) {
          if (snapshot.hasError) {
            return const Center(
              child: Text('An error occurred!'),
            );
          }

          final groupedGames = snapshot.data!;
          return CalendarScreenLoaded(
            user: widget.user,
            stateTeams: widget.stateTeams,
            stateStadiums: widget.stateStadiums,
            groupedGames: groupedGames,
          );
        } else {
          return const Center(
            child: Text('An error occurred!'),
          );
        }
      },
    );
  }
}

class CalendarScreenLoaded extends StatelessWidget {
  const CalendarScreenLoaded(
      {required this.user,
      required this.stateTeams,
      required this.stateStadiums,
      required this.groupedGames,
      super.key});

  final User user;
  final List<Team> stateTeams;
  final List<Stadium> stateStadiums;
  final Map<String, List<Game>> groupedGames;

  @override
  Widget build(BuildContext context) {
    final today = DateTime.now();

    int initialScrollIndex = 0;
    final games = groupedGames.values.expand((games) => games).toList();
    for (var i = 0; i < games.length; i++) {
      final gameDateTime = DateTime.parse(games[i].dateTimeUtc);
      if (gameDateTime.isAfter(today) || gameDateTime.isAtSameMomentAs(today)) {
        initialScrollIndex = i;
        break;
      }
    }

    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      mainAxisSize: MainAxisSize.max,
      children: [
        Header(
          user: user,
        ),
        Expanded(
          child: ListView.builder(
            itemCount: groupedGames.length,
            itemBuilder: (context, index) {
              final date = groupedGames.keys.elementAt(index);
              final formattedDate =
                  DateFormat('dd MMM yyyy').format(DateTime.parse(date));
              final gamesForDate = groupedGames[date]!;
              return Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SecondaryTitle(text: formattedDate),
                  ...gamesForDate.map(
                    (game) => CalenderMatchList(
                      teams: stateTeams,
                      game: game,
                      stadiums: stateStadiums,
                    ),
                  ),
                ],
              );
            },
            controller: ScrollController(
                initialScrollOffset:
                    initialScrollIndex * 75.0), // Adjust the offset as needed
          ),
        )
      ],
    );
  }
}
