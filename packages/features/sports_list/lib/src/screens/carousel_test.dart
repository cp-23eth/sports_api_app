import 'package:component_library/component_library.dart';
import 'package:domain_entities/domain_entities.dart';
import 'package:flutter/material.dart';
import 'package:sports_list/sports_list.dart';

class CarouselTest extends StatefulWidget {
  const CarouselTest({super.key});

  @override
  State<CarouselTest> createState() => _CarouselTestState();
}

class _CarouselTestState extends State<CarouselTest> {
  @override
  Widget build(BuildContext context) {
    final state = context.watch<SportsListProvider>().state;

    List<Team> teams = [state.teams[0], state.teams[1]];
    Game game = state.games[12];

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
                teams: teams,
                game: game,
                finish: false,
              ),
            ],
          ),
        ),
      ],
    );
  }
}