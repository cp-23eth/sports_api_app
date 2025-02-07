import 'package:domain_entities/domain_entities.dart';
import 'package:flutter/material.dart';
import 'package:storybook_flutter/storybook_flutter.dart';
import 'package:component_library/component_library.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    Game game = Game(
      dateTime: DateTime.parse('2024-10-22T19:30:00'),
      homeTeam: 'BOS',
      awayTeam: 'NY',
      homeTeamScore: 156,
      awayTeamScore: 129,
      season: 2025,
      stadiumId: 1,
      status: 'Final',
      refereeId: 1,
      gameId: 1,
      isClosed: true,
      awayTeamId: 1,
      homeTeamId: 2,
      dateTimeUtc: DateTime.parse('2024-10-22T23:30:00'),
    );
    bool finish = false;

    if (game.status == 'Final') {
      finish = true;
    } else {
      finish = false;
    }
    return Storybook(
      initialStory: 'Widget/Header',
      stories: [
        Story(
          name: 'Widget/List/Home',
          builder: (context) => HomeMatchList(game: game, finish: finish),
        ),
        Story(
          name: 'Widget/List/Calender',
          builder: (context) => CalenderMatchList(
            game: game,
          ),
        ),
        Story(
          name: 'Widget/List/Team',
          builder: (context) => const TeamList(),
        ),
        Story(name: 'Widget/Header', builder: (context) => const Header()),
      ],
    );
  }
}
