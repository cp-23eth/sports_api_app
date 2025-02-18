import 'package:domain_entities/domain_entities.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sports_list/sports_list.dart';

class TeamList extends StatelessWidget {
  const TeamList({required this.team, required this.players, super.key});

  final Team team;
  final List<Player> players;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      cursor: SystemMouseCursors.click,
      child: GestureDetector(
        onTap: () => Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => TeamsScreen(
              team: team,
              players: players,
            ),
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.only(top: 4.0, bottom: 4.0, left: 24.0),
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
                    width: 16,
                  ),
                  Text(
                    '${team.city} ${team.name}',
                    style: TextStyle(
                      color: Colors.white,
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
