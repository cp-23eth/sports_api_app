import 'package:domain_entities/domain_entities.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
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

    List<Team> favoriteTeams = widget.teams
        .where((team) => state.user.favoriteTeams.contains(team.teamId))
        .toList();

    bool isTeamFollowed(Team team) => favoriteTeams.contains(team);

    final DateTime dateTime =
        DateTime.parse(widget.game.dateTimeUtc).add(const Duration(hours: 1));
    final String formattedHour = DateFormat.Hm().format(dateTime);
    final String formattedDate = DateFormat('dd MMM yyyy').format(dateTime);

    final homeTeam = widget.teams[widget.game.homeTeamId - 1];
    final awayTeam = widget.teams[widget.game.awayTeamId - 1];

    return Padding(
      padding: const EdgeInsets.all(8.0),
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
          padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 12.0),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20.0),
            color: widget.finish
                ? Parameter.latestsMatchsColor
                : Parameter.comingsMatchsColor,
          ),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Expanded(child: _buildTeamColumn(homeTeam, isTeamFollowed)),

              _buildMatchInfo(formattedHour, formattedDate),

              Expanded(child: _buildTeamColumn(awayTeam, isTeamFollowed)),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildTeamColumn(Team team, bool Function(Team) isTeamFollowed) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Stack(
            clipBehavior: Clip.none,
            children: [
              SvgPicture.asset(
                'packages/component_library/lib/src/assets/images/svg/${team.city == 'Houston' && widget.game.isClosed == false ? 'Hou-noir.svg' : team.logo}',
                width: 45.0,
                fit: BoxFit.fitHeight,
              ),
              isTeamFollowed(team)
                  ? const Positioned(
                      top: -12,
                      right: -12,
                      child: Icon(
                        Icons.star,
                        color: Colors.white,
                        size: 16.0,
                      ),
                    )
                  : const SizedBox(
                      width: 10,
                    ),
            ],
          ),
        ),
        const SizedBox(height: 12.0),
        Text(
          '${team.city}\n${team.name}',
          textAlign: TextAlign.center,
          maxLines: 2,
          overflow: TextOverflow.ellipsis,
          style: TextStyle(
            color: _getTextColor(),
            fontSize: isTeamFollowed(team) ? 14.0 : 13.0,
            fontFamily: GoogleFonts.poppins().fontFamily,
            fontWeight:
                isTeamFollowed(team) ? FontWeight.w900 : FontWeight.w400,
          ),
        ),
      ],
    );
  }

  Widget _buildMatchInfo(String formattedHour, String formattedDate) {
    String hadHomeTeamWin(int scoreHomeTeam, int scoreAwayTeam) {
      if (scoreHomeTeam > scoreAwayTeam) {
        return 'win';
      } else if (scoreHomeTeam == scoreAwayTeam) {
        return 'equal';
      } else {
        return 'lose';
      }
    }

    double chooseFontSizeMatchResult(String result) {
      double fontSize = 0;
      if (result == 'win') {
        fontSize = 20;
      } else if (result == 'equal') {
        fontSize = 18;
      } else {
        fontSize = 16;
      }
      return fontSize;
    }

    FontWeight chooseFontWeightMatchResult(String result) {
      FontWeight fontSize = FontWeight.w400;
      if (result == 'win') {
        fontSize = FontWeight.w800;
      } else if (result == 'equal') {
        fontSize = FontWeight.w600;
      } else {
        fontSize = FontWeight.w400;
      }
      return fontSize;
    }

    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Row(
          children: [
            Text(
              '${widget.game.homeTeamScore} ',
              style: TextStyle(
                color: _getTextColor(),
                fontSize: chooseFontSizeMatchResult(hadHomeTeamWin(widget.game.homeTeamScore,
                    widget.game.awayTeamScore)),
                fontFamily: GoogleFonts.poppins().fontFamily,
                fontWeight: chooseFontWeightMatchResult(hadHomeTeamWin(widget.game.homeTeamScore,
                    widget.game.awayTeamScore)),
              ),
            ),
            Text(
              '-',
              style: TextStyle(
                color: _getTextColor(),
                fontSize: 14,
                fontFamily: GoogleFonts.poppins().fontFamily,
                fontWeight: FontWeight.w400,
              ),
            ),
            Text(
              ' ${widget.game.awayTeamScore}',
              style: TextStyle(
                color: _getTextColor(),
                fontSize: chooseFontSizeMatchResult(hadHomeTeamWin(widget.game.awayTeamScore,
                    widget.game.homeTeamScore)),
                fontFamily: GoogleFonts.poppins().fontFamily,
                fontWeight: chooseFontWeightMatchResult(hadHomeTeamWin(widget.game.awayTeamScore,
                    widget.game.homeTeamScore)),
              ),
            ),

          ],
        ),
        const SizedBox(height: 16.0),
        Text(
          formattedHour,
          style: TextStyle(
            color: _getTextColor(),
            fontSize: 12.0,
            fontFamily: GoogleFonts.inter().fontFamily,
          ),
        ),
        Text(
          formattedDate,
          style: TextStyle(
            color: _getTextColor(),
            fontSize: 10.0,
            fontFamily: GoogleFonts.inter().fontFamily,
          ),
        ),
      ],
    );
  }

  Color _getTextColor() {
    return ThemeData.estimateBrightnessForColor(widget.finish
                ? Parameter.latestsMatchsColor
                : Parameter.comingsMatchsColor) ==
            Brightness.light
        ? Colors.black
        : Colors.white;
  }
}
