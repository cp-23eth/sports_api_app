import 'package:component_library/component_library.dart';
import 'package:domain_entities/domain_entities.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';

class DetailMatch extends StatelessWidget {
  const DetailMatch(
      {required this.game,
      required this.teams,
      required this.stadiums,
      super.key});

  final Game game;
  final List<Team> teams;
  final List<Stadium> stadiums;

  @override
  Widget build(BuildContext context) {
    final gameDate = DateTime.parse(game.dateTimeUtc);
    final formattedDate = DateFormat('dd MMM yyyy').format(gameDate);
    final formattedHour = DateFormat('HH:mm').format(gameDate);

    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      mainAxisSize: MainAxisSize.max,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SvgPicture.asset(
              'packages/component_library/lib/src/assets/images/svg/${teams[game.homeTeamId - 1].logo}',
              width: 87,
              fit: BoxFit.fitWidth,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.start,
              mainAxisSize: MainAxisSize.max,
              children: [
                const PrimaryTitle(text: 'VS'),
                const SizedBox(height: 10),
                SecondaryTitle(
                    text: '${game.homeTeamScore} - ${game.awayTeamScore}'),
                const SizedBox(height: 20),
                Text(
                  formattedDate,
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 13,
                    fontFamily: GoogleFonts.poppins().fontFamily,
                  ),
                ),
                const SizedBox(height: 10),
                Text(
                  formattedHour,
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 13,
                    fontFamily: GoogleFonts.poppins().fontFamily,
                  ),
                ),
              ],
            ),
            SvgPicture.asset(
              'packages/component_library/lib/src/assets/images/svg/${teams[game.awayTeamId - 1].logo}',
              width: 87,
              fit: BoxFit.fitWidth,
            ),
          ],
        )
      ],
    );
  }
}
