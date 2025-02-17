import 'package:domain_entities/domain_entities.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:http/http.dart' as http;

class HomeMatchList extends StatelessWidget {
  const HomeMatchList(
      {required this.teams,
      required this.finish,
      required this.game,
      super.key});

  final List<Team> teams;
  final bool finish;
  final Game game;

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

  @override
  Widget build(BuildContext context) {
    final DateTime dateTime = DateTime.parse(game.dateTime);
    final String formattedHour = DateFormat.Hm().format(dateTime);
    final String formattedDate = DateFormat.yMd().format(dateTime);

    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: const BorderRadius.all(
            Radius.circular(20.0),
          ),
          color: finish ? const Color(0xFF1D428A) : const Color(0xFFC8102E),
        ),
        child: Padding(
          padding: const EdgeInsets.all(16.0),
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
                        width: 58.0,
                        fit: BoxFit.fitWidth,
                      );
                    },
                  ),
                  Column(
                    children: [
                      SizedBox(
                        width: 100.0,
                        child: Text(
                          '${teams[game.homeTeamId - 1].city} ${teams[game.homeTeamId - 1].name}',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 13.0,
                            fontFamily: GoogleFonts.poppins().fontFamily,
                          ),
                          textAlign: TextAlign.center,
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    width: 100.0,
                    child: Column(
                      children: [
                        const SizedBox(
                          height: 48.0,
                        ),
                        Text(
                          '${game.homeTeamScore} - ${game.awayTeamScore}',
                          style: TextStyle(
                            color: Colors.white,
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
                            color: Colors.white,
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
                            color: Colors.white,
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
                  Column(
                    children: [
                      SizedBox(
                        width: 100.0,
                        child: Text(
                          '${teams[game.awayTeamId - 1].city} ${teams[game.awayTeamId - 1].name}',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 13.0,
                            fontFamily: GoogleFonts.poppins().fontFamily,
                          ),
                          textAlign: TextAlign.center,
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                    ],
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
                        width: 58.0,
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
}
