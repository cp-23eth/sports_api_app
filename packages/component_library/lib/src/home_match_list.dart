import 'package:domain_entities/domain_entities.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:sports_list/sports_list.dart';

class HomeMatchList extends StatelessWidget {
  const HomeMatchList(
      {required this.teams,
      required this.finish,
      required this.game,
      required this.stadiums,
      super.key});

  final List<Team> teams;
  final bool finish;
  final Game game;
  final List<Stadium> stadiums;

  @override
  Widget build(BuildContext context) {
    final DateTime dateTime = DateTime.parse(game.dateTimeUtc).add(
      const Duration(hours: 1),
    );
    final String formattedHour = DateFormat.Hm().format(dateTime);
    final String formattedDate = DateFormat('dd MMM yyyy').format(dateTime);

    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: MouseRegion(
        cursor: SystemMouseCursors.click,
        child: GestureDetector(
          onTap: () => Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => MatchDetailScreen(
                game: game,
                teams: teams,
                stadiums: stadiums,
              ),
            ),
          ),
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
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Column(
                        children: [
                          SvgPicture.asset(
                            'packages/component_library/lib/src/assets/images/svg/${teams[game.homeTeamId - 1].logo}',
                            width: 58.0,
                            fit: BoxFit.fitWidth,
                          ),
                          SizedBox(
                            width: 100.0,
                            child: Text(
                              '${teams[game.homeTeamId - 1].city} ${teams[game.homeTeamId - 1].name}',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 13.0,
                                fontFamily: GoogleFonts.poppins().fontFamily,
                              ),
                              textAlign: TextAlign.center,
                              maxLines: 2,
                              overflow: TextOverflow.ellipsis,
                            ),
                          ),
                        ],
                      ),
                      SizedBox(
                        width: 100.0,
                        child: Column(
                          children: [
                            Text(
                              '${game.homeTeamScore} - ${game.awayTeamScore}',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 14.0,
                                fontFamily: GoogleFonts.poppins().fontFamily,
                                fontWeight: FontWeight.bold,
                              ),
                              textAlign: TextAlign.center,
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
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
                              textAlign: TextAlign.center,
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                            ),
                            Text(
                              formattedDate,
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 9.0,
                                fontFamily: GoogleFonts.inter().fontFamily,
                              ),
                              textAlign: TextAlign.center,
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                            ),
                          ],
                        ),
                      ),
                      Column(
                        children: [
                          SvgPicture.asset(
                            'packages/component_library/lib/src/assets/images/svg/${teams[game.awayTeamId - 1].logo}',
                            width: 58.0,
                            fit: BoxFit.fitWidth,
                          ),
                          SizedBox(
                            width: 100.0,
                            child: Text(
                              '${teams[game.awayTeamId - 1].city} ${teams[game.awayTeamId - 1].name}',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 13.0,
                                fontFamily: GoogleFonts.poppins().fontFamily,
                              ),
                              textAlign: TextAlign.center,
                              maxLines: 2,
                              overflow: TextOverflow.ellipsis,
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
        ),
      ),
    );
  }
}
