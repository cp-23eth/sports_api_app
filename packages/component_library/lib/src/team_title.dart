import 'package:domain_entities/domain_entities.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sports_list/sports_list.dart';

class TeamTitle extends StatelessWidget {
  const TeamTitle(
      {required this.team,
      required this.stadium,
      required this.statsTeam,
      super.key});

  final Team team;
  final Stadium stadium;
  final StatsTeam statsTeam;

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        const SizedBox(
          height: 30,
        ),
        Text(
          '${team.city} ${team.name}',
          style: TextStyle(
            color: ThemeData.estimateBrightnessForColor(
                        Parameter.background_color) ==
                    Brightness.light
                ? Colors.black
                : Colors.white,
            fontSize: 24,
            fontFamily: GoogleFonts.poppins().fontFamily,
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(
          width: 60,
        ),
        SvgPicture.asset(
          'packages/component_library/lib/src/assets/images/svg/${team.logo}',
          width: 100.0,
          fit: BoxFit.fitWidth,
        ),
        const SizedBox(
          height: 60,
        )
      ],
    );
  }
}
