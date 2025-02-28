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
      required this.favouriteTeam,
      super.key});

  final Team team;
  final List<Player> players;
  final Stadium stadium;
  final StatsTeam statsTeam;
  final User user;
  final Function favouriteTeam;

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

  @override
  Widget build(BuildContext context) {
    List<Player> filteredPlayers =
        _filterPlayersByTeam(widget.players, widget.team);
    final Color primaryColor =
        Color(int.parse('0xFF${widget.team.primaryColor}'));
    final Color secondaryColor =
        Color(int.parse('0xFF${widget.team.secondaryColor}'));

    return Scaffold(
      backgroundColor: Parameter.backgroundColor,
      appBar: AppBar(
        title: Text(
          'Teams',
          style: TextStyle(
            color: ThemeData.estimateBrightnessForColor(primaryColor) ==
                    Brightness.light
                ? Colors.black
                : Colors.white,
          ),
        ),
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back,
            color: ThemeData.estimateBrightnessForColor(primaryColor) ==
                    Brightness.light
                ? Colors.black
                : Colors.white,
          ),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        backgroundColor: primaryColor,
        centerTitle: true,
        actions: [
          IconButton(
            onPressed: () {
              widget.favouriteTeam(context, widget.team.teamId);
              setState(() {
                _isFavorited = !_isFavorited;
              });
            },
            icon: Icon(
              _isFavorited ? Icons.favorite : Icons.favorite_border,
              color: ThemeData.estimateBrightnessForColor(primaryColor) ==
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
                  backgroundColor: primaryColor,
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
                    color: ThemeData.estimateBrightnessForColor(primaryColor) ==
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
              widget.user.teamScreenDesign == 'List'
                  ? ListView.builder(
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      itemCount: filteredPlayers.length,
                      itemBuilder: (context, index) => PlayerList(
                        user: widget.user,
                        player: filteredPlayers[index],
                        color: secondaryColor,
                        onFavoriteToggle: () {
                          setState(() {
                            filteredPlayers = _filterPlayersByTeam(
                                widget.players, widget.team);
                          });
                        },
                      ),
                    )
                  : Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 24.0, vertical: 8.0),
                      child: GridView.builder(
                        shrinkWrap: true, // Ajouté
                        physics: const NeverScrollableScrollPhysics(), // Ajouté
                        gridDelegate:
                            const SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 3,
                          mainAxisSpacing: 18
                        ),
                        itemCount: filteredPlayers.length,
                        itemBuilder: (context, index) => PlayerListCircleAvatar(
                          user: widget.user,
                          player: filteredPlayers[index],
                          color: secondaryColor,
                        ),
                      ),
                    ),
            ],
          ),
        ],
      ),
    );
  }
}
