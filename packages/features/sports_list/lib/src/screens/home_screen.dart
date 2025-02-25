import 'package:carousel_slider/carousel_slider.dart';
import 'package:component_library/component_library.dart';
import 'package:flutter/material.dart';
import 'package:sports_list/sports_list.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    final state = context.watch<SportsListProvider>().state;
    final user = state.user;

    final nextGames =
        state.games.where((game) => game.status == "Scheduled").toList();

    final lastGames =
        state.games.where((game) => game.isClosed == true).toList();

    nextGames.sort((a, b) =>
        DateTime.parse(a.dateTime).compareTo(DateTime.parse(b.dateTime)));
    lastGames.sort((a, b) =>
        DateTime.parse(b.dateTime).compareTo(DateTime.parse(a.dateTime)));

    final next8Games = nextGames.take(8).toList();
    final last8Games = lastGames.take(8).toList();

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

    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      mainAxisSize: MainAxisSize.min,
      children: [
        Header(
          user: user,
        ),
        const SizedBox(height: 40),
        Expanded(
          child: ListView(
            children: [
              Column(
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
                  CarouselSlider(
                    items: nextGamesList,
                    options: CarouselOptions(
                      height: 181,
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
                  CarouselSlider(
                    items: lastGamesList,
                    options: CarouselOptions(
                      height: 181,
                      enableInfiniteScroll: false,
                      viewportFraction: 0.8,
                      autoPlay: true,
                      autoPlayInterval: const Duration(seconds: 6),
                      enlargeCenterPage: true,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ],
    );
  }
}
