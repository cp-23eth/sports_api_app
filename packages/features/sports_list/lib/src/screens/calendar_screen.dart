import 'package:component_library/component_library.dart';
import 'package:flutter/material.dart';
import 'package:sports_list/sports_list.dart';

class CalendarScreen extends StatefulWidget {
  const CalendarScreen({super.key});

  @override
  State<CalendarScreen> createState() => _CalendarScreenState();
}

class _CalendarScreenState extends State<CalendarScreen> {
  @override
  Widget build(BuildContext context) {
  final state = context.watch<SportsListProvider>().state;
  
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      mainAxisSize: MainAxisSize.max,
      children: [
        const Header(),
        Expanded(
          child: ListView(
            children: [
              const SecondaryTitle(text: 'Demain'),
              CalenderMatchList(game: state.games[1200]),
              CalenderMatchList(game: state.games[1201]),
              CalenderMatchList(game: state.games[1202]),
              const SecondaryTitle(text: 'Aujourd\'hui'),
              CalenderMatchList(game: state.games[821]),
              const SecondaryTitle(text: 'Hier'),
              CalenderMatchList(game: state.games[2]),
            ],
          ),
        )
      ],
    );
  }
}
