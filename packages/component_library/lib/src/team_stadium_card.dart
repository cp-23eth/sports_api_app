import 'package:domain_entities/domain_entities.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sports_list/sports_list.dart';

class TeamStadiumCard extends StatelessWidget {
  const TeamStadiumCard(
      {required this.team,
      required this.stadium,
      required this.statsTeam,
      required this.secondaryColor,
      super.key});

  final Team team;
  final Stadium stadium;
  final StatsTeam statsTeam;
  final Color secondaryColor;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16),
        color: Parameter.teamsStadiumColor,
      ),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.max,
              children: [
                Text(
                  'Stadium Info :',
                  style: GoogleFonts.poppins(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: ThemeData.estimateBrightnessForColor(
                                Parameter.teamsStadiumColor) ==
                            Brightness.light
                        ? Colors.black
                        : Colors.white,
                  ),
                ),
                const SizedBox(height: 8),
                Text(
                  stadium.name,
                  style: TextStyle(
                    fontSize: 16,
                    color: ThemeData.estimateBrightnessForColor(
                                Parameter.teamsStadiumColor) ==
                            Brightness.light
                        ? Colors.black
                        : Colors.white,
                    fontFamily: GoogleFonts.poppins().fontFamily,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                const SizedBox(height: 8),
                Text(
                  '${stadium.address} \n${stadium.city} ${stadium.zip} ${stadium.state} ${stadium.country}',
                  style: GoogleFonts.poppins(
                    fontSize: 16,
                    color: ThemeData.estimateBrightnessForColor(
                                Parameter.teamsStadiumColor) ==
                            Brightness.light
                        ? Colors.black
                        : Colors.white,
                  ),
                ),
                const SizedBox(height: 8),
                Text(
                  'Capacity : ${stadium.capacity}',
                  style: GoogleFonts.poppins(
                    fontSize: 16,
                    color: ThemeData.estimateBrightnessForColor(
                                Parameter.teamsStadiumColor) ==
                            Brightness.light
                        ? Colors.black
                        : Colors.white,
                  ),
                ),
              ],
            ),
            Column(
              children: [
                Container(
                  height: 200,
                  width: 200,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(16),
                    image: DecorationImage(
                      image: AssetImage(
                        'packages/component_library/lib/src/assets/images/image_stades/${team.city}.jpg',
                      ),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
