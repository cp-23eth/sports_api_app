import 'package:domain_entities/domain_entities.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sports_list/sports_list.dart';

class StatsTeamsScreen extends StatelessWidget {
  const StatsTeamsScreen({required this.statsTeam, super.key});

  final StatsTeam statsTeam;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Parameter.background_color,
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back,
            color: ThemeData.estimateBrightnessForColor(
                        Parameter.header_footer_color) ==
                    Brightness.light
                ? Colors.black
                : Colors.white,
          ),
          onPressed: () => Navigator.pop(context),
        ),
        title: Text(
          'Team Stats - Saison ${statsTeam.season}',
          style: GoogleFonts.poppins(
            fontSize: 20,
            fontWeight: FontWeight.bold,
            color: ThemeData.estimateBrightnessForColor(
                        Parameter.background_color) ==
                    Brightness.light
                ? Colors.black
                : Colors.white,
          ),
        ),
        backgroundColor: Colors.transparent,
        centerTitle: true,
        elevation: 0,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              CardLineInfo('Wins', statsTeam.wins, Icons.emoji_events),
              CardLineInfo('Losses', statsTeam.losses, Icons.cancel),
              CardLineInfo(
                  'Games Played', statsTeam.games, Icons.sports_basketball),
              CardLineInfo(
                  'Time',
                  '${(statsTeam.minutes ~/ 60)} h ${(statsTeam.minutes % 60)} min ${statsTeam.seconds} sec',
                  Icons.access_time),
              CardLineInfo('Field Goals Made', statsTeam.fieldGoalsMade.toInt(),
                  Icons.check_circle),
              CardLineInfo('Field Goals Attempted',
                  statsTeam.fieldGoalsAttempted.toInt(), Icons.shutter_speed),
              CardLineInfo('Field Goal %',
                  '${statsTeam.fieldGoalsPercentage.toInt()}%', Icons.percent),
              CardLineInfo('Two Pointers Made',
                  statsTeam.twoPointersMade.toInt(), Icons.looks_two),
              CardLineInfo(
                  'Two Pointers Attempted',
                  statsTeam.twoPointersAttempted.toInt(),
                  Icons.format_list_numbered),
              CardLineInfo('Two Pointer %',
                  '${statsTeam.twoPointersPercentage.toInt()}%', Icons.percent),
              CardLineInfo('Three Pointers Made',
                  statsTeam.threePointersMade.toInt(), Icons.looks_3),
              CardLineInfo(
                  'Three Pointers Attempted',
                  statsTeam.threePointersAttempted.toInt(),
                  Icons.format_list_numbered),
              CardLineInfo(
                  'Three Pointer %',
                  '${statsTeam.threePointersPercentage.toInt()}%',
                  Icons.percent),
              CardLineInfo('Steals', statsTeam.steals.toInt(), Icons.security),
              CardLineInfo(
                  'Blocked Shots', statsTeam.blockedShot.toInt(), Icons.block),
            ],
          ),
        ),
      ),
    );
  }

  // ignore: non_constant_identifier_names
  Widget CardLineInfo(String title, dynamic value, IconData icon) {
    return Card(
      color: Colors.black12,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      margin: const EdgeInsets.symmetric(vertical: 8),
      child: ListTile(
        leading: Icon(
          icon,
          color: ThemeData.estimateBrightnessForColor(
                      Parameter.background_color) ==
                  Brightness.light
              ? Colors.black
              : Colors.white,
        ),
        title: Text(
          title,
          style: GoogleFonts.poppins(
            fontSize: 16,
            fontWeight: FontWeight.w600,
            color: ThemeData.estimateBrightnessForColor(
                        Parameter.background_color) ==
                    Brightness.light
                ? Colors.black
                : Colors.white,
          ),
        ),
        trailing: Text(
          value.toString(),
          style: GoogleFonts.poppins(
              fontSize: 16,
              color: ThemeData.estimateBrightnessForColor(
                          Parameter.background_color) ==
                      Brightness.light
                  ? Colors.black
                  : Colors.white,
              fontWeight: FontWeight.bold),
        ),
      ),
    );
  }
}
