import 'package:carousel_slider/carousel_slider.dart';
import 'package:component_library/component_library.dart';
import 'package:domain_entities/domain_entities.dart';
import 'package:flutter/material.dart';
import 'package:sports_list/sports_list.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({required this.teams, super.key});

  final List<Team> teams;

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    final state = context.watch<SportsListProvider>().state;
    final user = state.user;

    String design = state.user.homeScreenDesign;

    final nextGames =
        state.games.where((game) => game.status == "Scheduled").toList();

    final lastGames =
        state.games.where((game) => game.isClosed == true).toList();

    nextGames.sort((a, b) =>
        DateTime.parse(a.dateTime).compareTo(DateTime.parse(b.dateTime)));
    lastGames.sort((a, b) =>
        DateTime.parse(b.dateTime).compareTo(DateTime.parse(a.dateTime)));

    List<Game> next8Games = nextGames.take(8).toList();
    List<Game> last8Games = lastGames.take(8).toList();

    List<Team> teamList = widget.teams
        .where((team) => state.user.favoriteTeams.contains(team.teamId))
        .toList();

    for (Game game in next8Games) {
      for (Team favoriteTeam in teamList) {
        if (game.homeTeam == favoriteTeam.key ||
            game.awayTeam == favoriteTeam.key) {
          next8Games.remove(game);
          next8Games.insert(0, game);
        }
      }
    }

    for (Game game in last8Games) {
      for (Team favoriteTeam in teamList) {
        if (game.homeTeam == favoriteTeam.key ||
            game.awayTeam == favoriteTeam.key) {
          last8Games.remove(game);
          last8Games.insert(0, game);
        }
      }
    }

    final List<Widget> nextGamesList = [
      for (var game in next8Games)
        HomeMatchList(
          teams: state.teams,
          finish: false,
          game: game,
          stadiums: state.stadiums,
        ),
    ];

    final List<Widget> lastGamesList = [
      for (var game in last8Games)
        HomeMatchList(
          teams: state.teams,
          finish: true,
          game: game,
          stadiums: state.stadiums,
        ),
    ];

    return SingleChildScrollView(
      child: Column(
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Header(
                user: user,
                teams: widget.teams,
              ),
              if (design == 'Carrousel')
                const SizedBox(
                  height: 85.0,
                ),
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'Coming matches',
                      style: TextStyle(
                          color: ThemeData.estimateBrightnessForColor(
                                      Parameter.backgroundColor) ==
                                  Brightness.light
                              ? Colors.black
                              : Colors.white,
                          fontSize: 25,
                          fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(height: 6),
                    if (design == 'List')
                      for (var gameWidget in nextGamesList) gameWidget,
                    if (design == 'Carrousel')
                      CarouselSlider(
                        items: nextGamesList,
                        options: CarouselOptions(
                          height: 165,
                          enableInfiniteScroll: false,
                          viewportFraction: 0.8,
                          autoPlay: true,
                          autoPlayInterval: const Duration(seconds: 6),
                          enlargeCenterPage: true,
                        ),
                      ),
                    const SizedBox(height: 20),
                    Text(
                      'Latest matches',
                      style: TextStyle(
                          color: ThemeData.estimateBrightnessForColor(
                                      Parameter.backgroundColor) ==
                                  Brightness.light
                              ? Colors.black
                              : Colors.white,
                          fontSize: 25,
                          fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(height: 6),
                    if (design == 'List')
                      for (var gameWidget in lastGamesList) gameWidget,
                    if (design == 'Carrousel')
                      CarouselSlider(
                        items: lastGamesList,
                        options: CarouselOptions(
                          height: 165,
                          enableInfiniteScroll: false,
                          viewportFraction: 0.8,
                          autoPlay: true,
                          autoPlayInterval: const Duration(seconds: 6),
                          enlargeCenterPage: true,
                        ),
                      ),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
