import 'package:domain_entities/domain_entities.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';

class CalenderMatchList extends StatelessWidget {
  const CalenderMatchList({required this.game, super.key});

  final Game game;

  @override
  Widget build(BuildContext context) {
    final DateTime now = DateTime.now();
    final DateTime gameDate = DateTime.parse(game.dateTime);

    final String formattedDate = DateFormat.yMd().format(gameDate);
    final String formattedHour = DateFormat.Hm().format(gameDate);

    Color containerColor;

    if (DateFormat.yMd().format(gameDate) == DateFormat.yMd().format(now)) {
      containerColor = const Color(0xFF9100B6);
    } else if (gameDate.isAfter(now)) {
      containerColor = const Color(0xFFC8102E);
    } else if (gameDate.isBefore(now)) {
      containerColor = const Color(0xFF1D428A);
    } else {
      containerColor = const Color(0xFFC8102E); // Default color
    }

    return Container(
      decoration: BoxDecoration(
        borderRadius: const BorderRadius.all(
          Radius.circular(20.0),
        ),
        color: containerColor,
      ),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                SvgPicture.network(
                  'https://upload.wikimedia.org/wikipedia/en/6/67/Chicago_Bulls_logo.svg',
                  height: 25.0,
                  width: 25.0,
                ),
                Text(
                  game.homeTeam,
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 11.0,
                    fontFamily: GoogleFonts.poppins().fontFamily,
                  ),
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Text(
                      formattedHour,
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 10.0,
                        fontFamily: GoogleFonts.poppins().fontFamily,
                      ),
                    ),
                    Text(
                      '${game.homeTeamScore} - ${game.awayTeamScore}',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 14.0,
                        fontFamily: GoogleFonts.poppins().fontFamily,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      formattedDate,
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 8.0,
                        fontFamily: GoogleFonts.poppins().fontFamily,
                      ),
                    ),
                  ],
                ),
                Text(
                  game.awayTeam,
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 11.0,
                    fontFamily: GoogleFonts.poppins().fontFamily,
                  ),
                ),
                SvgPicture.network(
                  'https://upload.wikimedia.org/wikipedia/en/8/8f/Boston_Celtics.svg',
                  height: 25.0,
                  width: 25.0,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
