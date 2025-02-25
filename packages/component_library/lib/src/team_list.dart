import 'package:domain_entities/domain_entities.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sports_list/sports_list.dart';

class TeamList extends StatefulWidget {
  const TeamList(
      {required this.user,
      required this.team,
      required this.players,
      required this.stadium,
      required this.statsTeam,
      super.key});

  final User user;
  final Team team;
  final List<Player> players;
  final List<Stadium> stadium;
  final List<StatsTeam> statsTeam;

  @override
  State<TeamList> createState() => _TeamListState();
}

class _TeamListState extends State<TeamList> {
  late bool _isFavorited;

  @override
  void initState() {
    super.initState();
    _isFavorited = widget.user.favoriteTeams.contains(widget.team.teamId);
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
    return MouseRegion(
      cursor: SystemMouseCursors.click,
      child: GestureDetector(
        onTap: () => Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => TeamsScreen(
              user: widget.user,
              team: widget.team,
              players: widget.players,
              stadium: widget.stadium[widget.team.teamId - 1],
              statsTeam: widget.statsTeam[widget.team.teamId - 1],
              favouriteTeam: _favoriteTeam,
            ),
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.only(left: 24.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      SvgPicture.asset(
                        'packages/component_library/lib/src/assets/images/svg/${widget.team.logo}',
                        width: 58.0,
                        fit: BoxFit.fitWidth,
                      ),
                      const SizedBox(
                        width: 20,
                      ),
                      Text(
                        '${widget.team.city} ${widget.team.name}',
                        style: TextStyle(
                          color: ThemeData.estimateBrightnessForColor(
                                      Parameter.backgroundColor) ==
                                  Brightness.light
                              ? Colors.black
                              : Colors.white,
                          fontSize: 16,
                          fontFamily: GoogleFonts.poppins().fontFamily,
                        ),
                      ),
                    ],
                  ),
                  Padding(
                    padding: const EdgeInsets.only(right: 16.0),
                    child: IconButton(
                      onPressed: () =>
                          _favoriteTeam(context, widget.team.teamId),
                      icon: Icon(
                        _isFavorited ? Icons.favorite : Icons.favorite_border,
                        color: ThemeData.estimateBrightnessForColor(
                                    Parameter.backgroundColor) ==
                                Brightness.light
                            ? Colors.black
                            : Colors.white,
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
