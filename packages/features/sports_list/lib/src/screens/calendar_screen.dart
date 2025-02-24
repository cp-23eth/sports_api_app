import 'package:component_library/component_library.dart';
import 'package:domain_entities/domain_entities.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class CalendarScreen extends StatefulWidget {
  const CalendarScreen(
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
  State<CalendarScreen> createState() => _CalendarScreenState();
}

class _CalendarScreenState extends State<CalendarScreen> {
  // @override
  // void initState() {
  //   super.initState();
  // _loadData();
  // }

  // Future<void> _loadData() async {
  //   if (context.read<SportsListProvider>().state.games.isEmpty) {
  //     WidgetsBinding.instance.addPostFrameCallback(
  //       (_) {
  //         context.read<SportsListProvider>().fetchAndSetSports();
  //       },
  //     );
  //   }
  // }

  @override
  Widget build(BuildContext context) {
    final games = widget.stateGames.reversed.toList();
    final today = DateTime.now();

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

    int initialScrollIndex = 0;
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
          user: widget.user,
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
                      teams: widget.stateTeams,
                      game: game,
                      stadiums: widget.stateStadiums,
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
