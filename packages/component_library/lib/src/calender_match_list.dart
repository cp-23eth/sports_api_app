import 'package:domain_entities/domain_entities.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:sports_list/sports_list.dart';

class CalenderMatchList extends StatelessWidget {
  const CalenderMatchList(
      {required this.stadiums,
      required this.teams,
      required this.game,
      super.key});

  final List<Stadium> stadiums;
  final List<Team> teams;
  final Game game;

  @override
  Widget build(BuildContext context) {
    final DateTime now = DateTime.now();
    final DateTime gameDate = DateTime.parse(game.dateTimeUtc).add(
      const Duration(hours: 1),
    );

    final String formattedDate = DateFormat('dd MMM yyyy').format(gameDate);
    final String formattedHour = DateFormat.Hm().format(gameDate);

    Color containerColor;

    if (DateFormat.yMd().format(gameDate) == DateFormat.yMd().format(now)) {
      containerColor = Parameter.todaysMatchsColor;
    } else if (gameDate.isAfter(now)) {
      containerColor = Parameter.comingsMatchsColor;
    } else if (gameDate.isBefore(now)) {
      containerColor = Parameter.latestsMatchsColor;
    } else {
      containerColor = Parameter.comingsMatchsColor;
    }

    String hadHomeTeamWin(int scoreHomeTeam, int scoreAwayTeam) {
      if (scoreHomeTeam > scoreAwayTeam) {
        return 'win';
      } else if (scoreHomeTeam == scoreAwayTeam) {
        return 'equal';
      } else {
        return 'lose';
      }
    }

    double chooseFontSize(String result){
      double fontSize = 0;
      if (result == 'win'){
        fontSize = 17;
      } else if (result == 'equal'){
        fontSize = 15;
      } else {
        fontSize = 13;
      }
      return fontSize;
    }

    FontWeight chooseFontWeight(String result) {
      FontWeight fontSize = FontWeight.w400;
      if (result == 'win'){
        fontSize = FontWeight.w700;
      } else if (result == 'equal'){
        fontSize = FontWeight.w500;
      } else {
        fontSize = FontWeight.w300;
      }
      return fontSize;
    }

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 4.0),
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
                      SvgPicture.asset(
                        'packages/component_library/lib/src/assets/images/svg/${teams[game.homeTeamId - 1].city == 'Houston' && containerColor == const Color(0xFFC8102E) ? 'Hou-noir.svg' : teams[game.homeTeamId - 1].logo}',
                        width: 28.0,
                        fit: BoxFit.fitWidth,
                      ),
                      SizedBox(
                        width: 70.0,
                        child: Text(
                          '${teams[game.homeTeamId - 1].city} ${teams[game.homeTeamId - 1].name}',
                          style: TextStyle(
                            color: ThemeData.estimateBrightnessForColor(
                                        containerColor) ==
                                    Brightness.light
                                ? Colors.black
                                : Colors.white,
                            fontSize: 11.0,
                            fontFamily: GoogleFonts.poppins().fontFamily,
                          ),
                          overflow: TextOverflow.ellipsis,
                          maxLines: 3,
                        ),
                      ),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Text(
                            formattedHour,
                            style: TextStyle(
                              color: ThemeData.estimateBrightnessForColor(
                                          containerColor) ==
                                      Brightness.light
                                  ? Colors.black
                                  : Colors.white,
                              fontSize: 10.0,
                              fontFamily: GoogleFonts.poppins().fontFamily,
                            ),
                          ),
                          Row(
                            children: [
                              Text(
                                '${game.homeTeamScore} ',
                                style: TextStyle(
                                  color: ThemeData.estimateBrightnessForColor(
                                              containerColor) ==
                                          Brightness.light
                                      ? Colors.black
                                      : Colors.white,
                                  fontSize: chooseFontSize(hadHomeTeamWin(game.homeTeamScore, game.awayTeamScore)),
                                  fontFamily: GoogleFonts.poppins().fontFamily,
                                  fontWeight: chooseFontWeight(hadHomeTeamWin(game.homeTeamScore, game.awayTeamScore)),
                                ),
                              ),
                              Text(
                                '-',
                                style: TextStyle(
                                  color: ThemeData.estimateBrightnessForColor(
                                              containerColor) ==
                                          Brightness.light
                                      ? Colors.black
                                      : Colors.white,
                                  fontSize: 14.0,
                                  fontFamily: GoogleFonts.poppins().fontFamily,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              Text(
                                ' ${game.awayTeamScore}',
                                style: TextStyle(
                                  color: ThemeData.estimateBrightnessForColor(
                                              containerColor) ==
                                          Brightness.light
                                      ? Colors.black
                                      : Colors.white,
                                  fontSize: chooseFontSize(hadHomeTeamWin(game.awayTeamScore, game.homeTeamScore)),
                                  fontFamily: GoogleFonts.poppins().fontFamily,
                                  fontWeight: chooseFontWeight(hadHomeTeamWin(game.awayTeamScore, game.homeTeamScore)),
                                ),
                              ),
                            ],
                          ),
                          Text(
                            formattedDate,
                            style: TextStyle(
                              color: ThemeData.estimateBrightnessForColor(
                                          containerColor) ==
                                      Brightness.light
                                  ? Colors.black
                                  : Colors.white,
                              fontSize: 8.0,
                              fontFamily: GoogleFonts.poppins().fontFamily,
                            ),
                          ),
                        ],
                      ),
                      SizedBox(
                        width: 70.0,
                        child: Text(
                          '${teams[game.awayTeamId - 1].city} ${teams[game.awayTeamId - 1].name}',
                          style: TextStyle(
                            color: ThemeData.estimateBrightnessForColor(
                                        containerColor) ==
                                    Brightness.light
                                ? Colors.black
                                : Colors.white,
                            fontSize: 11.0,
                            fontFamily: GoogleFonts.poppins().fontFamily,
                          ),
                          overflow: TextOverflow.ellipsis,
                          maxLines: 2,
                        ),
                      ),
                      SvgPicture.asset(
                        'packages/component_library/lib/src/assets/images/svg/${teams[game.awayTeamId - 1].city == 'Houston' && containerColor == const Color(0xFFC8102E) ? 'Hou-noir.svg' : teams[game.awayTeamId - 1].logo}',
                        width: 30.0,
                        fit: BoxFit.fitWidth,
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
