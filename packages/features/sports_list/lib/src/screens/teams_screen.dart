import 'package:component_library/component_library.dart';
import 'package:domain_entities/domain_entities.dart';
import 'package:flutter/material.dart';
import 'package:sports_list/sports_list.dart';

class TeamsScreen extends StatefulWidget {
  const TeamsScreen(
      {required this.team,
      required this.players,
      required this.stadium,
      required this.statsTeam,
      required this.user,
      super.key});

  final Team team;
  final List<Player> players;
  final Stadium stadium;
  final StatsTeam statsTeam;
  final User user;

  @override
  State<TeamsScreen> createState() => _TeamsScreenState();
}

class _TeamsScreenState extends State<TeamsScreen> {
  late bool _isFavorited;

  @override
  void initState() {
    super.initState();
    _isFavorited = widget.user.favoriteTeams.contains(widget.team.teamId);
  }

  List<Player> _filterPlayersByTeam(List<Player> players, Team team) {
    return players.where((player) => player.teamId == team.teamId).toList();
  }

  void _favoriteTeam(BuildContext context, int teamId) {
    setState(() {
      _isFavorited = !_isFavorited;
    });
    if (_isFavorited) {
      context
          .read<SportsListProvider>()
          .addFavoriteTeam(widget.user.username, teamId);
    } else {
      context
          .read<SportsListProvider>()
          .removeFavoriteTeam(widget.user.username, teamId);
    }
  }

  @override
  Widget build(BuildContext context) {
    final filteredPlayers = _filterPlayersByTeam(widget.players, widget.team);
    final Color secondaryColor =
        Color(int.parse('0xFF${widget.team.secondaryColor}'));

    return Scaffold(
      backgroundColor: Parameter.backgroundColor,
      appBar: AppBar(
        title: Text(
          'Teams',
          style: TextStyle(
            color: ThemeData.estimateBrightnessForColor(
                        Parameter.teamsHeaderColor) ==
                    Brightness.light
                ? Colors.black
                : Colors.white,
          ),
        ),
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back,
            color: ThemeData.estimateBrightnessForColor(
                        Parameter.teamsHeaderColor) ==
                    Brightness.light
                ? Colors.black
                : Colors.white,
          ),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        backgroundColor: Parameter.teamsHeaderColor,
        centerTitle: true,
        actions: [
          IconButton(
            onPressed: () => _favoriteTeam(context, widget.team.teamId),
            icon: Icon(
              _isFavorited ? Icons.favorite : Icons.favorite_border,
              color: ThemeData.estimateBrightnessForColor(
                          Parameter.teamsHeaderColor) ==
                      Brightness.light
                  ? Colors.black
                  : Colors.white,
            ),
          ),
        ],
      ),
      body: ListView(
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: TeamTitle(
                  team: widget.team,
                  stadium: widget.stadium,
                  statsTeam: widget.statsTeam,
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: TeamStadiumCard(
                  team: widget.team,
                  stadium: widget.stadium,
                  statsTeam: widget.statsTeam,
                  secondaryColor: secondaryColor,
                ),
              ),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Parameter.teamsHeaderColor,
                ),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) =>
                          StatsTeamsScreen(statsTeam: widget.statsTeam),
                    ),
                  );
                },
                child: Text(
                  'Open Stats',
                  style: TextStyle(
                    color: ThemeData.estimateBrightnessForColor(
                                Parameter.teamsHeaderColor) ==
                            Brightness.light
                        ? Colors.black
                        : Colors.white,
                  ),
                ),
              ),
              const SizedBox(
                height: 24.0,
              ),
              Text(
                'Players',
                style: TextStyle(
                  fontSize: 28,
                  color: ThemeData.estimateBrightnessForColor(
                              Parameter.backgroundColor) ==
                          Brightness.light
                      ? Colors.black
                      : Colors.white,
                ),
              ),
              const SizedBox(
                height: 16.0,
              ),
              ListView.builder(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemCount: filteredPlayers.length,
                itemBuilder: (context, index) => PlayerList(
                  user: widget.user,
                  player: filteredPlayers[index],
                  color: secondaryColor,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
