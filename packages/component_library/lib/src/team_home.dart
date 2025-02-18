import 'package:domain_entities/domain_entities.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';

class TeamHome extends StatelessWidget {
  const TeamHome({required this.team, super.key});

  final Team team;

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Text(
          '${team.city} ${team.name}',
          style: TextStyle(
            color: Colors.white,
            fontSize: 16,
            fontFamily: GoogleFonts.poppins().fontFamily,
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(
          width: 32,
        ),
        SvgPicture.asset(
          'packages/component_library/lib/src/assets/images/svg/${team.logo}',
          width: 58.0,
          fit: BoxFit.fitWidth,
        ),
      ],
    );
  }
}
