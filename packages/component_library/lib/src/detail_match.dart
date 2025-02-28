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
  @override
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

    final gameDate = DateTime.parse(widget.game.dateTimeUtc).add(
      const Duration(hours: 1),
    );
    final formattedDate = DateFormat('dd MMM yyyy').format(gameDate);
    final formattedHour = DateFormat('HH:mm').format(gameDate);
    Stadium stadium = const Stadium(
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
    );

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

    stadium = state.stadiums.firstWhere(
      (s) => s.stadiumId == widget.game.stadiumId,
      orElse: () => stadium,
    );

    Team homeTeam = state.teams[widget.game.homeTeamId - 1];
    Team awayTeam = state.teams[widget.game.awayTeamId - 1];

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
              MouseRegion(
                cursor: SystemMouseCursors.click,
                child: GestureDetector(
                  onTap: () => Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => TeamsScreen(
                        user: state.user,
                        team: homeTeam,
                        players: state.players,
                        stadium: stadium,
                        statsTeam: state.statsTeam[homeTeam.teamId - 1],
                        favouriteTeam: favoriteTeam,
                      ),
                    ),
                  ),
                  child: Column(
                    children: [
                      SvgPicture.asset(
                        'packages/component_library/lib/src/assets/images/svg/${state.teams[widget.game.homeTeamId - 1].logo}',
                        height: 87,
                        fit: BoxFit.fitHeight,
                      ),
                      const SizedBox(
                        height: 50,
                      ),
                      Text(
                        state.teams[widget.game.homeTeamId - 1].name,
                        style: TextStyle(
                          color: ThemeData.estimateBrightnessForColor(
                                      Parameter.backgroundColor) ==
                                  Brightness.light
                              ? Colors.black
                              : Colors.white,
                          fontSize: 20,
                          fontFamily: GoogleFonts.poppins().fontFamily,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.start,
                mainAxisSize: MainAxisSize.max,
                children: [
                  const SizedBox(height: 30),
                  const PrimaryTitle(text: 'VS'),
                  const SizedBox(height: 50),
                  SecondaryTitle(
                      text:
                          '${widget.game.homeTeamScore} - ${widget.game.awayTeamScore}'),
                  const SizedBox(height: 20),
                  Text(
                    formattedDate,
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
                  const SizedBox(height: 10),
                  Text(
                    formattedHour,
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
              MouseRegion(
                cursor: SystemMouseCursors.click,
                child: GestureDetector(
                  onTap: () => Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => TeamsScreen(
                        user: state.user,
                        team: awayTeam,
                        players: state.players,
                        stadium: stadium,
                        statsTeam: state.statsTeam[awayTeam.teamId - 1],
                        favouriteTeam: favoriteTeam,
                      ),
                    ),
                  ),
                  child: Column(
                    children: [
                      SvgPicture.asset(
                        'packages/component_library/lib/src/assets/images/svg/${state.teams[widget.game.awayTeamId - 1].logo}',
                        height: 87,
                        fit: BoxFit.fitHeight,
                      ),
                      const SizedBox(
                        height: 50,
                      ),
                      Text(
                        state.teams[widget.game.awayTeamId - 1].name,
                        style: TextStyle(
                          color: ThemeData.estimateBrightnessForColor(
                                      Parameter.backgroundColor) ==
                                  Brightness.light
                              ? Colors.black
                              : Colors.white,
                          fontSize: 20,
                          fontFamily: GoogleFonts.poppins().fontFamily,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 40),
          Column(
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
                    fontSize: 20.0),
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
              )
            ],
          ),
        ],
      ),
    );
  }
}
