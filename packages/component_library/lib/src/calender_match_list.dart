import 'package:domain_entities/domain_entities.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:http/http.dart' as http;

class CalenderMatchList extends StatelessWidget {
  const CalenderMatchList({required this.teams, required this.game, super.key});

  final List<Team> teams;
  final Game game;

  @override
  Widget build(BuildContext context) {
    final DateTime now = DateTime.now();
    final DateTime gameDate = DateTime.parse(game.dateTimeUtc);

    final String formattedDate = DateFormat.yMd().format(gameDate);
    final String formattedHour = DateFormat.Hm().format(gameDate);

    Color containerColor;

    if (DateFormat.yMd().format(gameDate) == DateFormat.yMd().format(now)) {
      containerColor = const Color(0xFF9100B6);
    } else if (gameDate.isAfter(now)) {
      containerColor = const Color(0xFFC8102E);
    } else if (gameDate.isBefore(now)) {
      containerColor = const Color(0xFF1D428A);
    } else {
      containerColor = const Color(0xFFC8102E); // Default color
    }

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 4.0),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: const BorderRadius.all(
            Radius.circular(20.0),
          ),
          color: containerColor,
        ),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  FutureBuilder<String>(
                    future: _fetchAndCleanSvg(
                        teams[game.homeTeamId - 1].wikipediaLogoUrl),
                    builder: (context, snapshot) {
                      if (snapshot.connectionState == ConnectionState.waiting) {
                        return const CircularProgressIndicator();
                      }

                      if (snapshot.hasError) {
                        return const Text('Erreur de chargement SVG');
                      }

                      return SvgPicture.string(
                        snapshot.data!,
                        width: 30.0,
                        fit: BoxFit.fitWidth,
                      );
                    },
                  ),
                  SizedBox(
                    width: 70.0,
                    child: Text(
                      '${teams[game.homeTeamId - 1].city} ${teams[game.homeTeamId - 1].name}',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 11.0,
                        fontFamily: GoogleFonts.poppins().fontFamily,
                      ),
                      overflow: TextOverflow.ellipsis,
                      maxLines: 3,
                    ),
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Text(
                        formattedHour,
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 10.0,
                          fontFamily: GoogleFonts.poppins().fontFamily,
                        ),
                      ),
                      Text(
                        '${game.homeTeamScore} - ${game.awayTeamScore}',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 14.0,
                          fontFamily: GoogleFonts.poppins().fontFamily,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text(
                        formattedDate,
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 8.0,
                          fontFamily: GoogleFonts.poppins().fontFamily,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    width: 70.0,
                    child: Text(
                      '${teams[game.awayTeamId - 1].city} ${teams[game.awayTeamId - 1].name}',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 11.0,
                        fontFamily: GoogleFonts.poppins().fontFamily,
                      ),
                      overflow: TextOverflow.ellipsis,
                      maxLines: 2,
                    ),
                  ),
                  FutureBuilder<String>(
                    future: _fetchAndCleanSvg(
                        teams[game.awayTeamId - 1].wikipediaLogoUrl),
                    builder: (context, snapshot) {
                      if (snapshot.connectionState == ConnectionState.waiting) {
                        return const CircularProgressIndicator();
                      }

                      if (snapshot.hasError) {
                        return const Text('Erreur de chargement SVG');
                      }

                      return SvgPicture.string(
                        snapshot.data!,
                        width: 30.0,
                        fit: BoxFit.fitWidth,
                      );
                    },
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  Future<String> _fetchAndCleanSvg(String url) async {
    // Télécharger le SVG
    final response = await http.get(Uri.parse(url));

    if (response.statusCode == 200) {
      // Récupérer le contenu SVG en tant que chaîne
      String svgContent = response.body;

      // Nettoyer le SVG : supprimer la balise <style />
      svgContent = svgContent.replaceAll(RegExp(r'<style.*?>.*?</style>'), '');

      // Retourner le contenu nettoyé
      return svgContent;
    } else {
      throw Exception("Échec du téléchargement du fichier SVG");
    }
  }
}
