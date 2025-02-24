import 'package:component_library/component_library.dart';
import 'package:domain_entities/domain_entities.dart';
import 'package:flutter/material.dart';
import 'package:sports_list/sports_list.dart';

class TeamsScreen extends StatelessWidget {
  const TeamsScreen(
      {required this.team,
      required this.players,
      required this.stadium,
      required this.statsTeam,
      super.key});

  final Team team;
  final List<Player> players;
  final Stadium stadium;
  final StatsTeam statsTeam;

  List<Player> _filterPlayersByTeam(List<Player> players, Team team) {
    return players.where((player) => player.teamId == team.teamId).toList();
  }

  @override
  Widget build(BuildContext context) {
    final filteredPlayers = _filterPlayersByTeam(players, team);
    final Color secondaryColor = Color(int.parse('0xFF${team.secondaryColor}'));

    return Scaffold(
      backgroundColor: const Color(0xFF0B132B),
      appBar: AppBar(
        title: Text(
          'Teams',
          style: TextStyle(
            color: ThemeData.estimateBrightnessForColor(secondaryColor) ==
                    Brightness.light
                ? Colors.black
                : Colors.white,
          ),
        ),
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back,
            color: ThemeData.estimateBrightnessForColor(secondaryColor) ==
                    Brightness.light
                ? Colors.black
                : Colors.white,
          ),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        backgroundColor: secondaryColor,
        centerTitle: true,
      ),
      body: Expanded(
        child: ListView(
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: TeamTitle(
                    team: team,
                    stadium: stadium,
                    statsTeam: statsTeam,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: TeamStadiumCard(
                    team: team,
                    stadium: stadium,
                    statsTeam: statsTeam,
                    secondaryColor: secondaryColor,
                  ),
                ),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: secondaryColor,
                  ),
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) =>
                            StatsTeamsScreen(statsTeam: statsTeam),
                      ),
                    );
                  },
                  child: Text(
                    'Open Stats',
                    style: TextStyle(
                      color: ThemeData.estimateBrightnessForColor(
                                  secondaryColor) ==
                              Brightness.light
                          ? Colors.black
                          : Colors.white,
                    ),
                  ),
                ),
                const SizedBox(
                  height: 24.0,
                ),
                const Text(
                  'Players',
                  style: TextStyle(fontSize: 28, color: Colors.white),
                ),
                const SizedBox(
                  height: 16.0,
                ),
                ListView.builder(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  itemCount: filteredPlayers.length,
                  itemBuilder: (context, index) => PlayerList(
                    player: filteredPlayers[index],
                    color: secondaryColor,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
