import 'package:domain_entities/domain_entities.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:sports_list/sports_list.dart';

class CalenderMatchList extends StatefulWidget {
  const CalenderMatchList(
      {required this.stadiums,
      required this.teams,
      required this.game,
      super.key});

  final List<Stadium> stadiums;
  final List<Team> teams;
  final Game game;

  @override
  State<CalenderMatchList> createState() => _CalenderMatchListState();
}

class _CalenderMatchListState extends State<CalenderMatchList> {
  @override
  Widget build(BuildContext context) {
    final state = context.watch<SportsListProvider>().state;

    final DateTime now = DateTime.now();
    final DateTime gameDate = DateTime.parse(widget.game.dateTimeUtc).add(
      const Duration(hours: 1),
    );

    final String formattedDate = DateFormat('dd MMM yyyy').format(gameDate);
    final String formattedHour = DateFormat.Hm().format(gameDate);

    Color containerColor;

    List<Team> teamList = widget.teams
        .where((team) => state.user.favoriteTeams.contains(team.teamId))
        .toList();

    bool isTeamFollowed(Team team) => teamList.contains(team);

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

    double chooseFontSize(String result) {
      double fontSize = 0;
      if (result == 'win') {
        fontSize = 17;
      } else if (result == 'equal') {
        fontSize = 15;
      } else {
        fontSize = 13;
      }
      return fontSize;
    }

    FontWeight chooseFontWeight(String result) {
      FontWeight fontSize = FontWeight.w400;
      if (result == 'win') {
        fontSize = FontWeight.w700;
      } else if (result == 'equal') {
        fontSize = FontWeight.w500;
      } else {
        fontSize = FontWeight.w300;
      }
      return fontSize;
    }

    Widget imageTextTeamLeft() {
      return Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          const SizedBox(width: 10.0),
          Stack(
            clipBehavior: Clip.none,
            children: [
              SvgPicture.asset(
                'packages/component_library/lib/src/assets/images/svg/${widget.teams[widget.game.homeTeamId - 1].city == 'Houston' && containerColor == const Color(0xFFC8102E) ? 'Hou-noir.svg' : widget.teams[widget.game.homeTeamId - 1].logo}',
                width: 28.0,
                fit: BoxFit.fitWidth,
              ),
            ],
          ),
          isTeamFollowed(widget.teams[widget.game.homeTeamId - 1])
              ? Padding(
                  padding: const EdgeInsets.only(left: 2.0, bottom: 28.0),
                  child: Icon(
                    Icons.star,
                    color:
                        ThemeData.estimateBrightnessForColor(containerColor) ==
                                Brightness.light
                            ? Colors.black
                            : Colors.white,
                    size: 9.0,
                  ),
                )
              : const SizedBox(width: 9.0),
          const SizedBox(
            width: 10.0,
          ),
          SizedBox(
            width: 100.0,
            child: Text(
              '${widget.teams[widget.game.homeTeamId - 1].city} ${widget.teams[widget.game.homeTeamId - 1].name}',
              style: TextStyle(
                color: ThemeData.estimateBrightnessForColor(containerColor) ==
                        Brightness.light
                    ? Colors.black
                    : Colors.white,
                fontSize:
                    isTeamFollowed(widget.teams[widget.game.homeTeamId - 1])
                        ? 14.0
                        : 12.0,
                fontWeight:
                    isTeamFollowed(widget.teams[widget.game.homeTeamId - 1])
                        ? FontWeight.w600
                        : FontWeight.w300,
                fontFamily: GoogleFonts.poppins().fontFamily,
              ),
              overflow: TextOverflow.ellipsis,
              maxLines: 2,
            ),
          ),
        ],
      );
    }

    Widget imageTextTeamRight() {
      return Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          SizedBox(
            width: 100.0,
            child: Text(
              '${widget.teams[widget.game.awayTeamId - 1].city} ${widget.teams[widget.game.awayTeamId - 1].name}',
              style: TextStyle(
                color: ThemeData.estimateBrightnessForColor(containerColor) ==
                        Brightness.light
                    ? Colors.black
                    : Colors.white,
                fontSize:
                    isTeamFollowed(widget.teams[widget.game.awayTeamId - 1])
                        ? 14.0
                        : 12.0,
                fontWeight:
                    isTeamFollowed(widget.teams[widget.game.awayTeamId - 1])
                        ? FontWeight.w600
                        : FontWeight.w300,
                fontFamily: GoogleFonts.poppins().fontFamily,
              ),
              overflow: TextOverflow.ellipsis,
              maxLines: 2,
              textAlign: TextAlign.end,
            ),
          ),
          const SizedBox(width: 15.0),
          Stack(
            clipBehavior: Clip.none,
            children: [
              SvgPicture.asset(
                'packages/component_library/lib/src/assets/images/svg/${widget.teams[widget.game.awayTeamId - 1].city == 'Houston' && containerColor == const Color(0xFFC8102E) ? 'Hou-noir.svg' : widget.teams[widget.game.awayTeamId - 1].logo}',
                width: 28.0,
                fit: BoxFit.fitWidth,
              ),
            ],
          ),
          isTeamFollowed(widget.teams[widget.game.awayTeamId - 1]) ?
            Padding(
              padding: const EdgeInsets.only(left: 2.0, bottom: 28.0),
              child: Icon(
                Icons.star,
                color: ThemeData.estimateBrightnessForColor(containerColor) ==
                        Brightness.light
                    ? Colors.black
                    : Colors.white,
                size: 9.0,
              ),
            ) : const SizedBox(width: 10.0),
        ],
      );
    }

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 12.0, vertical: 6.0),
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
              borderRadius: const BorderRadius.all(
                Radius.circular(20.0),
              ),
              color: containerColor,
            ),
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  imageTextTeamLeft(),
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
                            '${widget.game.homeTeamScore} ',
                            style: TextStyle(
                              color: ThemeData.estimateBrightnessForColor(
                                          containerColor) ==
                                      Brightness.light
                                  ? Colors.black
                                  : Colors.white,
                              fontSize: chooseFontSize(hadHomeTeamWin(
                                  widget.game.homeTeamScore,
                                  widget.game.awayTeamScore)),
                              fontFamily: GoogleFonts.poppins().fontFamily,
                              fontWeight: chooseFontWeight(hadHomeTeamWin(
                                  widget.game.homeTeamScore,
                                  widget.game.awayTeamScore)),
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
                            ' ${widget.game.awayTeamScore}',
                            style: TextStyle(
                              color: ThemeData.estimateBrightnessForColor(
                                          containerColor) ==
                                      Brightness.light
                                  ? Colors.black
                                  : Colors.white,
                              fontSize: chooseFontSize(hadHomeTeamWin(
                                  widget.game.awayTeamScore,
                                  widget.game.homeTeamScore)),
                              fontFamily: GoogleFonts.poppins().fontFamily,
                              fontWeight: chooseFontWeight(hadHomeTeamWin(
                                  widget.game.awayTeamScore,
                                  widget.game.homeTeamScore)),
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
                  imageTextTeamRight(),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
