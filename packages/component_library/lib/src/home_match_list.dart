import 'package:domain_entities/domain_entities.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';

class HomeMatchList extends StatelessWidget {
  const HomeMatchList({required this.finish, required this.game, super.key});

  final bool finish;
  final Game game;

  @override
  Widget build(BuildContext context) {
    final DateTime dateTime = DateTime.parse(game.dateTime);
    final String formattedHour = DateFormat.Hm().format(dateTime);
    final String formattedDate = DateFormat.yMd().format(dateTime);

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 4.0),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: const BorderRadius.all(
            Radius.circular(20.0),
          ),
          color: finish ? const Color(0xFF1D428A) : const Color(0xFFC8102E),
        ),
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Column(
                    children: [
                      SvgPicture.network(
                        'https://upload.wikimedia.org/wikipedia/en/6/67/Chicago_Bulls_logo.svg',
                        height: 58.0,
                        width: 58.0,
                      ),
                      Text(
                        game.homeTeam,
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 13.0,
                          fontFamily: GoogleFonts.poppins().fontFamily,
                        ),
                      ),
                    ],
                  ),
                  Column(
                    children: [
                      const SizedBox(
                        height: 48.0,
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
                      const SizedBox(
                        height: 8.0,
                      ),
                      Text(
                        formattedHour,
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 10.0,
                          fontFamily: GoogleFonts.inter().fontFamily,
                        ),
                      ),
                      Text(
                        formattedDate,
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 9.0,
                          fontFamily: GoogleFonts.inter().fontFamily,
                        ),
                      ),
                    ],
                  ),
                  Column(
                    children: [
                      SvgPicture.network(
                        'https://upload.wikimedia.org/wikipedia/en/8/8f/Boston_Celtics.svg',
                        height: 58.0,
                        width: 58.0,
                      ),
                      Text(
                        game.awayTeam,
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 13.0,
                          fontFamily: GoogleFonts.poppins().fontFamily,
                        ),
                      ),
                    ],
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
