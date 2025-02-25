import 'package:domain_entities/domain_entities.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:sports_list/sports_list.dart';

class HomeMatchList extends StatefulWidget {
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
  State<HomeMatchList> createState() => _HomeMatchListState();
}

class _HomeMatchListState extends State<HomeMatchList> {
  @override
  Widget build(BuildContext context) {
    final state = context.watch<SportsListProvider>().state;

    List<Team> teamList = widget.teams
        .where((team) => state.user.favoriteTeams.contains(team.teamId))
        .toList();

    bool isTeamFollowed(Team team) {
      bool isFollowed = false;
      if (teamList.contains(team)){
        isFollowed = true;
      }
      return isFollowed;
    }
        
    final DateTime dateTime = DateTime.parse(widget.game.dateTimeUtc).add(
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
              color: widget.finish
                  ? Parameter.latestsMatchsColor
                  : Parameter.comingsMatchsColor,
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Flexible(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Padding(
                            padding: const EdgeInsets.symmetric(vertical: 10.0),
                            child: SvgPicture.asset(
                              'packages/component_library/lib/src/assets/images/svg/${widget.teams[widget.game.homeTeamId - 1].city == 'Houston' && widget.game.isClosed == false ? 'Hou-noir.svg' : widget.teams[widget.game.homeTeamId - 1].logo}',
                              width: isTeamFollowed(widget.teams[widget.game.homeTeamId - 1]) ? 55.0 : 45.0,
                              fit: BoxFit.fitHeight,
                            ),
                          ),
                          SizedBox(
                            width: 85.0,
                            child: Text(
                              '${widget.teams[widget.game.homeTeamId - 1].city} ${widget.teams[widget.game.homeTeamId - 1].name}',
                              style: TextStyle(
                                color: ThemeData.estimateBrightnessForColor(
                                          widget.finish
                                              ? Parameter.latestsMatchsColor
                                              : Parameter.comingsMatchsColor,
                                        ) ==
                                        Brightness.light
                                    ? Colors.black
                                    : Colors.white,
                                fontSize: 13.0,
                                fontFamily: GoogleFonts.poppins().fontFamily,
                                fontWeight: isTeamFollowed(widget.teams[widget.game.awayTeamId - 1]) ? FontWeight.w900 : FontWeight.w400
                              ),
                              textAlign: TextAlign.center,
                              maxLines: 2,
                              overflow: TextOverflow.ellipsis,
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      width: 75.0,
                      child: Column(
                        children: [
                          Text(
                            '${widget.game.homeTeamScore} - ${widget.game.awayTeamScore}',
                            style: TextStyle(
                              color: ThemeData.estimateBrightnessForColor(
                                        widget.finish
                                            ? Parameter.latestsMatchsColor
                                            : Parameter.comingsMatchsColor,
                                      ) ==
                                      Brightness.light
                                  ? Colors.black
                                  : Colors.white,
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
                              color: ThemeData.estimateBrightnessForColor(
                                        widget.finish
                                            ? Parameter.latestsMatchsColor
                                            : Parameter.comingsMatchsColor,
                                      ) ==
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
                          Text(
                            formattedDate,
                            style: TextStyle(
                              color: ThemeData.estimateBrightnessForColor(
                                        widget.finish
                                            ? Parameter.latestsMatchsColor
                                            : Parameter.comingsMatchsColor,
                                      ) ==
                                      Brightness.light
                                  ? Colors.black
                                  : Colors.white,
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
                    Flexible(
                      child: Column(
                        children: [
                          SvgPicture.asset(
                            'packages/component_library/lib/src/assets/images/svg/${widget.teams[widget.game.awayTeamId - 1].city == 'Houston' && widget.game.isClosed == false ? 'Hou-noir.svg' : widget.teams[widget.game.awayTeamId - 1].logo}',
                            width: isTeamFollowed(widget.teams[widget.game.awayTeamId - 1]) ? 55.0 : 45.0,
                            fit: BoxFit.fitHeight,
                          ),
                          SizedBox(
                            width: 85.0,
                            child: Text(
                              '${widget.teams[widget.game.awayTeamId - 1].city} ${widget.teams[widget.game.awayTeamId - 1].name}',
                              style: TextStyle(
                                color: ThemeData.estimateBrightnessForColor(
                                          widget.finish
                                              ? Parameter.latestsMatchsColor
                                              : Parameter.comingsMatchsColor,
                                        ) ==
                                        Brightness.light
                                    ? Colors.black
                                    : Colors.white,
                                fontSize: 13.0,
                                fontFamily: GoogleFonts.poppins().fontFamily,
                                fontWeight: isTeamFollowed(widget.teams[widget.game.awayTeamId - 1]) ? FontWeight.w900 : FontWeight.w400
                              ),
                              textAlign: TextAlign.center,
                              maxLines: 2,
                              overflow: TextOverflow.ellipsis,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
