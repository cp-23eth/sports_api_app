import 'package:component_library/component_library.dart';
import 'package:flutter/material.dart';
import 'package:sports_list/sports_list.dart';

class HomeScreenNba extends StatefulWidget {
  const HomeScreenNba({super.key});

  @override
  _HomeScreenNbaState createState() => _HomeScreenNbaState();
}

class _HomeScreenNbaState extends State<HomeScreenNba> {
  @override
  void initState() {
    super.initState();
    _fetchSports();
  }

  _fetchSports() {
    if (context.read<SportsListProvider>().state.games.isEmpty &&
        context.read<SportsListProvider>().state.teams.isEmpty &&
        context.read<SportsListProvider>().state.players.isEmpty &&
        context.read<SportsListProvider>().state.stadiums.isEmpty) {
      WidgetsBinding.instance.addPostFrameCallback((_) {
        context.read<SportsListProvider>().fetchAndSetSports();
      });
    }
  }

  Widget _showSports() {
    final state = context.watch<SportsListProvider>().state;

    if (state.status == SportsListStatus.loading) {
      return const Center(child: CircularProgressIndicator());
    }

    return const Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        mainAxisSize: MainAxisSize.max,
        children: [
          // HomeMatchList(),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
