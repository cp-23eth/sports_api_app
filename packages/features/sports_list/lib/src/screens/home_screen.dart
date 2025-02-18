import 'package:component_library/component_library.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
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
    
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      mainAxisSize: MainAxisSize.min,
      children: [
        const Header(),
        Expanded(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text(
                'Prochainement',
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 25,
                    fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 6),
              HomeMatchList(
                teams: state.teams,
                game: state.games
                    .where((game) =>
                        DateTime.parse(game.dateTime).isAfter(DateTime.now()))
                    .reduce((a, b) => DateTime.parse(a.dateTime)
                            .isBefore(DateTime.parse(b.dateTime))
                        ? a
                        : b),
                finish: false,
              ),
              const SizedBox(height: 20),
              const Text(
                'Résultat dernier match',
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 25,
                    fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 6),
              HomeMatchList(
                teams: state.teams,
                game: state.games
                    .where((game) =>
                        DateTime.parse(game.dateTime).isBefore(DateTime.now()))
                    .first,
                finish: true,
              ),
            ],
          ),
        ),
      ],
    );
  }
}
