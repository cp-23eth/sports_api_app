import 'package:component_library/component_library.dart';
import 'package:domain_entities/domain_entities.dart';
import 'package:flutter/material.dart';

class TeamsScreen extends StatelessWidget {
  const TeamsScreen({required this.team, required this.players, super.key});

  final Team team;
  final List<Player> players;

  List<Player> _filterPlayersByTeam(List<Player> players, Team team) {
    return players.where((player) => player.teamId == team.teamId).toList();
  }

  @override
  Widget build(BuildContext context) {
    final filteredPlayers = _filterPlayersByTeam(players, team);
    return Scaffold(
      backgroundColor: const Color(0xFF0B132B),
      appBar: AppBar(
        title: const Text('Teams'),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        backgroundColor: const Color(0xFF1C5D99),
        centerTitle: true,
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                TeamHome(team: team),
              ],
            ),
          ),
          const PrimaryTitle(text: 'Players'),
          Expanded(
            child: ListView.builder(
              itemCount: filteredPlayers.length,
              itemBuilder: (context, index) => PlayerList(
                player: filteredPlayers[index],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
