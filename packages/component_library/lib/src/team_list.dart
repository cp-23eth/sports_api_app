import 'package:domain_entities/domain_entities.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sports_list/sports_list.dart';

class TeamList extends StatelessWidget {
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
  Widget build(BuildContext context) {
    return MouseRegion(
      cursor: SystemMouseCursors.click,
      child: GestureDetector(
        onTap: () => Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => TeamsScreen(
              user: user,
              team: team,
              players: players,
              stadium: stadium[team.teamId - 1],
              statsTeam: statsTeam[team.teamId - 1],
            ),
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.only(left: 24.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SvgPicture.asset(
                    'packages/component_library/lib/src/assets/images/svg/${team.logo}',
                    width: 58.0,
                    fit: BoxFit.fitWidth,
                  ),
                  const SizedBox(
                    width: 20,
                  ),
                  Text(
                    '${team.city} ${team.name}',
                    style: TextStyle(
                      color: ThemeData.estimateBrightnessForColor(
                                  Parameter.background_color) ==
                              Brightness.light
                          ? Colors.black
                          : Colors.white,
                      fontSize: 16,
                      fontFamily: GoogleFonts.poppins().fontFamily,
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
