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
    return Storybook(
      initialStory: 'Widget/Header',
      stories: [
        Story(
          name: 'Widget/List/Home',
          builder: (context) => const HomeMatchList(),
        ),
        Story(
          name: 'Widget/List/Calender',
          builder: (context) => const CalenderMatchList(),
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
