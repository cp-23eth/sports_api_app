import 'package:domain_entities/domain_entities.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:sports_list/sports_list.dart';

class PlayerInfo extends StatelessWidget {
  const PlayerInfo({required this.player, required this.color, super.key});

  final Player player;
  final Color color;

  @override
  Widget build(BuildContext context) {
    final DateTime dateTime = DateTime.parse(player.birthDate);
    final String formattedDate = DateFormat("dd MMM yyyy").format(dateTime);

    final double weightInLbs = player.weight.toDouble();
    final double weightInKg = weightInLbs * 0.453592;
    final String convertedWeight = weightInKg.toStringAsFixed(0);

    final double heightInInches = player.height.toDouble();
    final double heightInCm = heightInInches * 2.54;
    final String convertedHeight = heightInCm.toStringAsFixed(0);

    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          color: Parameter.teamsPlayersColor,
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 32.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  SizedBox(
                    width: 150,
                    child: Row(
                      children: [
                        Icon(
                          Icons.cake,
                          color: ThemeData.estimateBrightnessForColor(
                                      Parameter.teamsPlayersColor) ==
                                  Brightness.light
                              ? Colors.black
                              : Colors.white,
                        ),
                        const SizedBox(width: 8),
                        Text(
                          formattedDate,
                          style: TextStyle(
                            fontFamily: GoogleFonts.poppins().fontFamily,
                            color: ThemeData.estimateBrightnessForColor(
                                        Parameter.teamsPlayersColor) ==
                                    Brightness.light
                                ? Colors.black
                                : Colors.white,
                            fontSize: 14,
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    width: 150,
                    child: Row(
                      children: [
                        Icon(
                          Icons.fitness_center,
                          color: ThemeData.estimateBrightnessForColor(
                                      Parameter.teamsPlayersColor) ==
                                  Brightness.light
                              ? Colors.black
                              : Colors.white,
                        ),
                        const SizedBox(width: 8),
                        Text(
                          '$convertedWeight kg',
                          style: TextStyle(
                            fontFamily: GoogleFonts.poppins().fontFamily,
                            color: ThemeData.estimateBrightnessForColor(
                                        Parameter.teamsPlayersColor) ==
                                    Brightness.light
                                ? Colors.black
                                : Colors.white,
                            fontSize: 14,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 16),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  SizedBox(
                    width: 150,
                    child: Row(
                      children: [
                        Icon(
                          Icons.height,
                          color: ThemeData.estimateBrightnessForColor(
                                      Parameter.teamsPlayersColor) ==
                                  Brightness.light
                              ? Colors.black
                              : Colors.white,
                        ),
                        const SizedBox(width: 8),
                        Text(
                          '$convertedHeight cm',
                          style: TextStyle(
                            fontFamily: GoogleFonts.poppins().fontFamily,
                            color: ThemeData.estimateBrightnessForColor(
                                        Parameter.teamsPlayersColor) ==
                                    Brightness.light
                                ? Colors.black
                                : Colors.white,
                            fontSize: 14,
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    width: 150,
                    child: Row(
                      children: [
                        Icon(
                          Icons.sports_basketball,
                          color: ThemeData.estimateBrightnessForColor(
                                      Parameter.teamsPlayersColor) ==
                                  Brightness.light
                              ? Colors.black
                              : Colors.white,
                        ),
                        const SizedBox(width: 8),
                        Text(
                          player.position,
                          style: TextStyle(
                            fontFamily: GoogleFonts.poppins().fontFamily,
                            color: ThemeData.estimateBrightnessForColor(
                                        Parameter.teamsPlayersColor) ==
                                    Brightness.light
                                ? Colors.black
                                : Colors.white,
                            fontSize: 14,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 16),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  SizedBox(
                    width: 150,
                    child: Row(
                      children: [
                        Icon(
                          Icons.map_outlined,
                          color: ThemeData.estimateBrightnessForColor(
                                      Parameter.teamsPlayersColor) ==
                                  Brightness.light
                              ? Colors.black
                              : Colors.white,
                        ),
                        const SizedBox(width: 8),
                        Text(
                          player.birthCountry,
                          style: TextStyle(
                            fontFamily: GoogleFonts.poppins().fontFamily,
                            color: ThemeData.estimateBrightnessForColor(
                                        Parameter.teamsPlayersColor) ==
                                    Brightness.light
                                ? Colors.black
                                : Colors.white,
                            fontSize: 14,
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    width: 150,
                    child: Row(
                      children: [
                        Icon(
                          Icons.location_city,
                          color: ThemeData.estimateBrightnessForColor(
                                      Parameter.teamsPlayersColor) ==
                                  Brightness.light
                              ? Colors.black
                              : Colors.white,
                        ),
                        const SizedBox(width: 8),
                        Text(
                          player.birthCity,
                          style: TextStyle(
                            fontFamily: GoogleFonts.poppins().fontFamily,
                            color: ThemeData.estimateBrightnessForColor(
                                        Parameter.teamsPlayersColor) ==
                                    Brightness.light
                                ? Colors.black
                                : Colors.white,
                            fontSize: 14,
                          ),
                          overflow: TextOverflow.ellipsis,
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
    );
  }
}
