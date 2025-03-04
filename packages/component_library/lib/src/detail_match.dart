import 'package:component_library/component_library.dart';
import 'package:domain_entities/domain_entities.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:sports_list/sports_list.dart';

class DetailMatch extends StatefulWidget {
  const DetailMatch({required this.game, super.key});

  final Game game;

  @override
  State<DetailMatch> createState() => _DetailMatchState();
}

class _DetailMatchState extends State<DetailMatch> {
  late bool isFavorited;

  @override
  void initState() {
    super.initState();
    final state = context.read<SportsListProvider>().state;
    isFavorited = state.user.favoriteTeams.contains(widget.game.homeTeamId);
  }

  @override
  Widget build(BuildContext context) {
    final state = context.watch<SportsListProvider>().state;

    final gameDate =
        DateTime.parse(widget.game.dateTimeUtc).add(const Duration(hours: 1));
    final formattedDate = DateFormat('dd MMM yyyy').format(gameDate);
    final formattedHour = DateFormat('HH:mm').format(gameDate);

    Stadium stadium = state.stadiums.firstWhere(
      (s) => s.stadiumId == widget.game.stadiumId,
      orElse: () => const Stadium(
        stadiumId: 0,
        name: 'Unknown',
        city: 'Unknown',
        capacity: 0,
        active: false,
        address: 'Unknown',
        state: 'Unknown',
        zip: 'Unknown',
        country: 'Unknown',
        latitude: 0,
        longitude: 0,
      ),
    );

    Team homeTeam = state.teams[widget.game.homeTeamId - 1];
    Team awayTeam = state.teams[widget.game.awayTeamId - 1];

    void favoriteTeam(BuildContext context, int teamId) {
      setState(() {
        isFavorited = !isFavorited;
      });
      if (isFavorited) {
        context
            .read<SportsListProvider>()
            .addFavoriteTeam(state.user.username, teamId);
      } else {
        context
            .read<SportsListProvider>()
            .removeFavoriteTeam(state.user.username, teamId);
      }
    }

    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.max,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _buildTeamColumn(context, state, homeTeam, stadium, favoriteTeam),
              _buildScoreColumn(formattedDate, formattedHour),
              _buildTeamColumn(context, state, awayTeam, stadium, favoriteTeam),
            ],
          ),
          const SizedBox(height: 40),
          _buildStadiumInfo(stadium),
        ],
      ),
    );
  }

  Widget _buildTeamColumn(BuildContext context, SportsListState state,
      Team team, Stadium stadium, Function(BuildContext, int) favoriteTeam) {
    List<Team> teamList = state.teams
        .where((team) => state.user.favoriteTeams.contains(team.teamId))
        .toList();

    bool isTeamFollowed(Team team) => teamList.contains(team);

    return MouseRegion(
      cursor: SystemMouseCursors.click,
      child: GestureDetector(
        onTap: () => Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => TeamsScreen(
              user: state.user,
              team: team,
              players: state.players,
              stadium: stadium,
              statsTeam: state.statsTeam[team.teamId - 1],
              favouriteTeam: favoriteTeam,
            ),
          ),
        ),
        child: SizedBox(
          width: 120,
          child: Column(
            children: [
              Stack(
                clipBehavior: Clip.none,
                children: [
                  SvgPicture.asset(
                    'packages/component_library/lib/src/assets/images/svg/${team.logo}',
                    height: 90,
                    fit: BoxFit.fitHeight,
                  ),
                  isTeamFollowed(team)
                      ? Positioned(
                          top: -15,
                          right: -15,
                          child: Icon(
                            Icons.star,
                            size: 24,
                            color: ThemeData.estimateBrightnessForColor(
                                        Parameter.backgroundColor) ==
                                    Brightness.light
                                ? Colors.black
                                : Colors.white,
                          ),
                        )
                      : const SizedBox(),
                ],
              ),
              const SizedBox(height: 50),
              Text(
                team.name,
                style: TextStyle(
                  color: ThemeData.estimateBrightnessForColor(
                              Parameter.backgroundColor) ==
                          Brightness.light
                      ? Colors.black
                      : Colors.white,
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  fontFamily: GoogleFonts.poppins().fontFamily,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildScoreColumn(String formattedDate, String formattedHour) {
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
        fontSize = 30;
      } else if (result == 'equal') {
        fontSize = 27;
      } else {
        fontSize = 24;
      }
      return fontSize;
    }

    FontWeight chooseFontWeight(String result) {
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
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.start,
      mainAxisSize: MainAxisSize.max,
      children: [
        const SizedBox(height: 30),
        const PrimaryTitle(text: 'VS'),
        const SizedBox(height: 110),
        Row(
          children: [
            Text(
              '${widget.game.homeTeamScore} ',
              style: TextStyle(
                color: ThemeData.estimateBrightnessForColor(
                            Parameter.backgroundColor) ==
                        Brightness.light
                    ? Colors.black
                    : Colors.white,
                fontSize: chooseFontSize(hadHomeTeamWin(
                    widget.game.homeTeamScore, widget.game.awayTeamScore)),
                fontWeight: chooseFontWeight(hadHomeTeamWin(
                    widget.game.homeTeamScore, widget.game.awayTeamScore)),
              ),
            ),
            Text(
              '-',
              style: TextStyle(
                color: ThemeData.estimateBrightnessForColor(
                            Parameter.backgroundColor) ==
                        Brightness.light
                    ? Colors.black
                    : Colors.white,
                fontSize: 27,
              ),
            ),
            Text(
              ' ${widget.game.awayTeamScore}',
              style: TextStyle(
                color: ThemeData.estimateBrightnessForColor(
                            Parameter.backgroundColor) ==
                        Brightness.light
                    ? Colors.black
                    : Colors.white,
                fontSize: chooseFontSize(hadHomeTeamWin(
                    widget.game.awayTeamScore, widget.game.homeTeamScore)),
                fontWeight: chooseFontWeight(hadHomeTeamWin(
                    widget.game.awayTeamScore, widget.game.homeTeamScore)),
              ),
            ),
          ],
        ),
        const SizedBox(height: 20),
        Text(
          formattedDate,
          style: TextStyle(
            color: ThemeData.estimateBrightnessForColor(
                        Parameter.backgroundColor) ==
                    Brightness.light
                ? Colors.black
                : Colors.white,
            fontSize: 16,
            fontFamily: GoogleFonts.poppins().fontFamily,
          ),
        ),
        const SizedBox(height: 10),
        Text(
          formattedHour,
          style: TextStyle(
            color: ThemeData.estimateBrightnessForColor(
                        Parameter.backgroundColor) ==
                    Brightness.light
                ? Colors.black
                : Colors.white,
            fontSize: 16,
            fontFamily: GoogleFonts.poppins().fontFamily,
          ),
        ),
        const SizedBox(
          height: 10.0,
        ),
        Text(
          widget.game.status,
          style: TextStyle(
            color: ThemeData.estimateBrightnessForColor(
                        Parameter.backgroundColor) ==
                    Brightness.light
                ? Colors.black
                : Colors.white,
            fontSize: 16,
            fontFamily: GoogleFonts.poppins().fontFamily,
          ),
        ),
      ],
    );
  }

  Widget _buildStadiumInfo(Stadium stadium) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        Text(
          'Stadium',
          style: TextStyle(
            color: ThemeData.estimateBrightnessForColor(
                        Parameter.backgroundColor) ==
                    Brightness.light
                ? Colors.black
                : Colors.white,
            fontFamily: GoogleFonts.poppins().fontFamily,
            fontWeight: FontWeight.bold,
            fontSize: 20.0,
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Stadium : ${stadium.name}',
                style: TextStyle(
                  color: ThemeData.estimateBrightnessForColor(
                              Parameter.backgroundColor) ==
                          Brightness.light
                      ? Colors.black
                      : Colors.white,
                  fontSize: 13,
                  fontFamily: GoogleFonts.poppins().fontFamily,
                ),
              ),
              Text(
                'City : ${stadium.city}',
                style: TextStyle(
                  color: ThemeData.estimateBrightnessForColor(
                              Parameter.backgroundColor) ==
                          Brightness.light
                      ? Colors.black
                      : Colors.white,
                  fontSize: 13,
                  fontFamily: GoogleFonts.poppins().fontFamily,
                ),
              ),
              Text(
                'Capacity : ${stadium.capacity}',
                style: TextStyle(
                  color: ThemeData.estimateBrightnessForColor(
                              Parameter.backgroundColor) ==
                          Brightness.light
                      ? Colors.black
                      : Colors.white,
                  fontSize: 13,
                  fontFamily: GoogleFonts.poppins().fontFamily,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
