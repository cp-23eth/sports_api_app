import 'package:component_library/component_library.dart';
import 'package:domain_entities/domain_entities.dart';
import 'package:flutter/material.dart';
import 'package:sports_list/sports_list.dart';
import 'package:url_launcher/url_launcher.dart';

class MatchDetailScreen extends StatelessWidget {
  const MatchDetailScreen({
    required this.game,
    required this.teams,
    required this.stadiums,
    super.key,
  });

  final Game game;
  final List<Team> teams;
  final List<Stadium> stadiums;

  // Fonction pour ouvrir Google Maps avec les coordonnées du stade
  void openMap(double latitude, double longitude) async {
    final Uri googleMapsUrl =
        Uri.parse('https://www.google.com/maps?q=$latitude,$longitude');

    if (await canLaunchUrl(googleMapsUrl)) {
      await launchUrl(googleMapsUrl);
    } else {
      throw 'Could not launch $googleMapsUrl';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Parameter.headerFooterColor,
        title: Text(
          'Match Detail',
          style: TextStyle(
            color: ThemeData.estimateBrightnessForColor(
                        Parameter.headerFooterColor) ==
                    Brightness.light
                ? Colors.black
                : Colors.white,
          ),
        ),
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back,
            color: ThemeData.estimateBrightnessForColor(
                        Parameter.headerFooterColor) ==
                    Brightness.light
                ? Colors.black
                : Colors.white,
          ),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      backgroundColor: Parameter.backgroundColor,
      body: Padding(
        padding: const EdgeInsets.all(24.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            DetailMatch(
              game: game,
              teams: teams,
              stadiums: stadiums,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Parameter.headerFooterColor,
                  ),
                  onPressed: () {
                    if (stadiums.isNotEmpty) {
                      final stadium = stadiums[game.stadiumId - 1];
                      openMap(stadium.latitude, stadium.longitude);
                    }
                  },
                  child: Text(
                    'View Stadium on Map',
                    style: TextStyle(
                      color: ThemeData.estimateBrightnessForColor(
                                  Parameter.headerFooterColor) ==
                              Brightness.light
                          ? Colors.black
                          : Colors.white,
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
