import 'package:component_library/component_library.dart';
import 'package:domain_entities/domain_entities.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart'; // Import nécessaire pour ouvrir les URL

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
        backgroundColor: const Color(0xFF1C5D99),
        title: const Text(
          'Match Detail',
          style: TextStyle(
            color: Colors.white,
          ),
        ),
        leading: IconButton(
          icon: const Icon(
            Icons.arrow_back,
            color: Colors.white,
          ),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      backgroundColor: const Color(0xFF0B132B),
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
                    backgroundColor: const Color(0xFF1C5D99),
                  ),
                  onPressed: () {
                    if (stadiums.isNotEmpty) {
                      final stadium = stadiums[game.stadiumId - 1];
                      openMap(stadium.latitude, stadium.longitude);
                    }
                  },
                  child: const Text(
                    'View Stadium on Map',
                    style: TextStyle(
                      color: Colors.white,
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
