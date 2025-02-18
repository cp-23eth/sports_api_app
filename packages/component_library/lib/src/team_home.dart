import 'package:domain_entities/domain_entities.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:http/http.dart' as http;

class TeamHome extends StatelessWidget {
  const TeamHome({required this.team, super.key});

  final Team team;

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
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Text(
          '${team.city} ${team.name}',
          style: TextStyle(
            color: Colors.white,
            fontSize: 16,
            fontFamily: GoogleFonts.poppins().fontFamily,
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(
          width: 32,
        ),
        FutureBuilder<String>(
          future: _fetchAndCleanSvg(team.wikipediaLogoUrl),
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
    );
  }
}
