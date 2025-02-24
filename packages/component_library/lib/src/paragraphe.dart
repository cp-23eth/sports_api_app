import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sports_list/sports_list.dart';

class Paragraphe extends StatelessWidget {
  const Paragraphe({required this.text, super.key});

  final String text;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 4.0),
      child: Text(
        text,
        style: TextStyle(
          fontSize: 14,
          color: ThemeData.estimateBrightnessForColor(
                      Parameter.background_color) ==
                  Brightness.light
              ? Colors.black
              : Colors.white,
          fontFamily: GoogleFonts.poppins().fontFamily,
        ),
        textAlign: TextAlign.justify,
      ),
    );
  }
}
