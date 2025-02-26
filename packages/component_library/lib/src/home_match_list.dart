import 'package:domain_entities/domain_entities.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:sports_list/sports_list.dart';

class HomeMatchList extends StatefulWidget {
  const HomeMatchList({
    required this.teams,
    required this.finish,
    required this.game,
    required this.stadiums,
    super.key,
  });

  final List<Team> teams;
  final bool finish;
  final Game game;
  final List<Stadium> stadiums;

  @override
  State<HomeMatchList> createState() => _HomeMatchListState();
}

class _HomeMatchListState extends State<HomeMatchList> {
  @override
  Widget build(BuildContext context) {
    final state = context.watch<SportsListProvider>().state;

    List<Team> teamList = widget.teams
        .where((team) => state.user.favoriteTeams.contains(team.teamId))
        .toList();

    bool isTeamFollowed(Team team) => teamList.contains(team);

    final DateTime dateTime = DateTime.parse(widget.game.dateTimeUtc).add(
      const Duration(hours: 1),
    );

    String hadHomeTeamWin(int scoreHomeTeam, int scoreAwayTeam) {
      if (scoreHomeTeam > scoreAwayTeam) {
        return 'win';
      } else if (scoreHomeTeam == scoreAwayTeam) {
        return 'equal';
      } else {
        return 'lose';
      }
    }

    double chooseFontSizeMatchResult(String result){
      double fontSize = 14;
      if (result == 'win'){
        fontSize = 19;
      } else if (result == 'equal'){
        fontSize = 16;
      } else {
        fontSize = 14;
      }
      return fontSize;
    }

    FontWeight chooseFontWeightMatchResult(String result) {
      FontWeight fontSize = FontWeight.w400;
      if (result == 'win'){
        fontSize = FontWeight.w900;
      } else if (result == 'equal'){
        fontSize = FontWeight.bold;
      } else {
        fontSize = FontWeight.w400;
      }
      return fontSize;
    }

    final String formattedHour = DateFormat.Hm().format(dateTime);
    final String formattedDate = DateFormat('dd MMM yyyy').format(dateTime);

    final homeTeam = widget.teams[widget.game.homeTeamId - 1];
    final awayTeam = widget.teams[widget.game.awayTeamId - 1];

    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: MouseRegion(
        cursor: SystemMouseCursors.click,
        child: GestureDetector(
          onTap: () => Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => MatchDetailScreen(
                game: widget.game,
                teams: widget.teams,
                stadiums: widget.stadiums,
              ),
            ),
          ),
          child: Container(
            decoration: BoxDecoration(
              borderRadius: const BorderRadius.all(Radius.circular(20.0)),
              color: widget.finish
                  ? Parameter.latestsMatchsColor
                  : Parameter.comingsMatchsColor,
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Stack(
                    clipBehavior: Clip.none,
                    children: [
                      Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          SvgPicture.asset(
                            'packages/component_library/lib/src/assets/images/svg/${homeTeam.city == 'Houston' && widget.game.isClosed == false ? 'Hou-noir.svg' : homeTeam.logo}',
                            width: isTeamFollowed(homeTeam) ? 55.0 : 45.0,
                            fit: BoxFit.fitHeight,
                          ),
                          const SizedBox(height: 12.0),
                          Text(
                            '${homeTeam.city}\n${homeTeam.name}',
                            style: TextStyle(
                              color: ThemeData.estimateBrightnessForColor(
                                          widget.finish
                                              ? Parameter.latestsMatchsColor
                                              : Parameter.comingsMatchsColor) ==
                                      Brightness.light
                                  ? Colors.black
                                  : Colors.white,
                              fontSize: isTeamFollowed(homeTeam) ? 16.0 : 13.0,
                              fontFamily: GoogleFonts.poppins().fontFamily,
                              fontWeight: isTeamFollowed(homeTeam)
                                  ? FontWeight.w900
                                  : FontWeight.w400,
                            ),
                            textAlign: TextAlign.center,
                            maxLines: 2,
                            overflow: TextOverflow.ellipsis,
                          ),
                        ],
                      ),
                      if (isTeamFollowed(homeTeam))
                        const Positioned(
                          top: -10,
                          right: -10,
                          child: Icon(
                            Icons.star,
                            color: Colors.white,
                            size: 16.0,
                          ),
                        ),
                    ],
                  ),
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Row(
                      children: [
                        Text(
                          '${widget.game.homeTeamScore}  ',
                          style: TextStyle(
                            color: ThemeData.estimateBrightnessForColor(
                                        widget.finish
                                            ? Parameter.latestsMatchsColor
                                            : Parameter.comingsMatchsColor) ==
                                    Brightness.light
                                ? Colors.black
                                : Colors.white,
                            fontSize: chooseFontSizeMatchResult(hadHomeTeamWin(widget.game.homeTeamScore, widget.game.awayTeamScore)),
                            fontFamily: GoogleFonts.poppins().fontFamily,
                            fontWeight: chooseFontWeightMatchResult(hadHomeTeamWin(widget.game.homeTeamScore, widget.game.awayTeamScore))
                          ),
                          textAlign: TextAlign.left,
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                        ),
                        Text(
                          '-',
                          style: TextStyle(
                            color: ThemeData.estimateBrightnessForColor(
                                        widget.finish
                                            ? Parameter.latestsMatchsColor
                                            : Parameter.comingsMatchsColor) ==
                                    Brightness.light
                                ? Colors.black
                                : Colors.white,
                            fontSize: 14.0,
                            fontFamily: GoogleFonts.poppins().fontFamily,
                            fontWeight: FontWeight.bold,
                          ),
                          textAlign: TextAlign.center,
                        ),
                        Text(
                          '  ${widget.game.awayTeamScore}',
                          style: TextStyle(
                            color: ThemeData.estimateBrightnessForColor(
                                        widget.finish
                                            ? Parameter.latestsMatchsColor
                                            : Parameter.comingsMatchsColor) ==
                                    Brightness.light
                                ? Colors.black
                                : Colors.white,
                            fontSize: chooseFontSizeMatchResult(hadHomeTeamWin(widget.game.awayTeamScore, widget.game.homeTeamScore)),
                            fontFamily: GoogleFonts.poppins().fontFamily,
                            fontWeight: chooseFontWeightMatchResult(hadHomeTeamWin(widget.game.awayTeamScore, widget.game.homeTeamScore)),
                          ),
                          textAlign: TextAlign.right,
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ],
                    ),
                    const SizedBox(height: 16.0),
                    Text(
                      formattedHour,
                      style: TextStyle(
                        color: ThemeData.estimateBrightnessForColor(
                                    widget.finish
                                        ? Parameter.latestsMatchsColor
                                        : Parameter.comingsMatchsColor) ==
                                Brightness.light
                            ? Colors.black
                            : Colors.white,
                        fontSize: 12.0,
                        fontFamily: GoogleFonts.inter().fontFamily,
                      ),
                      textAlign: TextAlign.center,
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                    Text(
                      formattedDate,
                      style: TextStyle(
                        color: ThemeData.estimateBrightnessForColor(
                                    widget.finish
                                        ? Parameter.latestsMatchsColor
                                        : Parameter.comingsMatchsColor) ==
                                Brightness.light
                            ? Colors.black
                            : Colors.white,
                        fontSize: 10.0,
                        fontFamily: GoogleFonts.inter().fontFamily,
                      ),
                      textAlign: TextAlign.center,
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Stack(
                    clipBehavior: Clip.none,
                    children: [
                      Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          SvgPicture.asset(
                            'packages/component_library/lib/src/assets/images/svg/${awayTeam.city == 'Houston' && widget.game.isClosed == false ? 'Hou-noir.svg' : awayTeam.logo}',
                            width: isTeamFollowed(awayTeam) ? 55.0 : 45.0,
                            fit: BoxFit.fitHeight,
                          ),
                          const SizedBox(height: 12.0),
                          Text(
                            '${awayTeam.city}\n${awayTeam.name}',
                            style: TextStyle(
                              color: ThemeData.estimateBrightnessForColor(
                                          widget.finish
                                              ? Parameter.latestsMatchsColor
                                              : Parameter.comingsMatchsColor) ==
                                      Brightness.light
                                  ? Colors.black
                                  : Colors.white,
                              fontSize: isTeamFollowed(awayTeam) ? 16.0 : 13.0,
                              fontFamily: GoogleFonts.poppins().fontFamily,
                              fontWeight: isTeamFollowed(awayTeam)
                                  ? FontWeight.w900
                                  : FontWeight.w400,
                            ),
                            textAlign: TextAlign.center,
                            maxLines: 2,
                            overflow: TextOverflow.ellipsis,
                          ),
                        ],
                      ),
                      if (isTeamFollowed(awayTeam))
                        const Positioned(
                          top: -10,
                          right: -10,
                          child: Icon(
                            Icons.star,
                            color: Colors.white,
                            size: 16.0,
                          ),
                        ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
