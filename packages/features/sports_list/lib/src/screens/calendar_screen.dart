import 'package:component_library/component_library.dart';
import 'package:domain_entities/domain_entities.dart';
import 'package:flutter/material.dart';
import 'package:sports_list/sports_list.dart';
import 'package:intl/intl.dart';

class CalendarScreen extends StatefulWidget {
  const CalendarScreen({super.key});

  @override
  State<CalendarScreen> createState() => _CalendarScreenState();
}

class _CalendarScreenState extends State<CalendarScreen> {
  late Future<void> _loadDataFuture;

  @override
  void initState() {
    super.initState();
    _loadDataFuture = _loadData();
  }

  Future<void> _loadData() async {
    // Simulate a delay for loading data
    await Future.delayed(const Duration(seconds: 2));
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<void>(
      future: _loadDataFuture,
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(child: CircularProgressIndicator());
        } else if (snapshot.hasError) {
          return const Center(child: Text('Error loading data'));
        } else {
          final state = context.watch<SportsListProvider>().state;
          final games = state.games.reversed.toList();
          final today = DateTime.now();

          final groupedGames = <String, List<Game>>{};
          for (var game in games) {
            final dateTime = DateTime.parse(game.dateTimeUtc);
            final date = DateFormat('yyyy-MM-dd').format(dateTime);
            if (!groupedGames.containsKey(date)) {
              groupedGames[date] = [];
            }
            groupedGames[date]!.add(game);
          }

          int initialScrollIndex = 0;
          for (var i = 0; i < games.length; i++) {
            final gameDateTime = DateTime.parse(games[i].dateTimeUtc);
            if (gameDateTime.isAfter(today) ||
                gameDateTime.isAtSameMomentAs(today)) {
              initialScrollIndex = i;
              break;
            }
          }

          return Column(
            mainAxisAlignment: MainAxisAlignment.start,
            mainAxisSize: MainAxisSize.max,
            children: [
              const Header(),
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
                        ...gamesForDate.map((game) =>
                            CalenderMatchList(teams: state.teams, game: game)),
                      ],
                    );
                  },
                  controller: ScrollController(
                      initialScrollOffset: initialScrollIndex *
                          75.0), // Adjust the offset as needed
                ),
              )
            ],
          );
        }
      },
    );
  }
}
