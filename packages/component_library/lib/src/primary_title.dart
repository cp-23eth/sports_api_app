import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class PrimaryTitle extends StatelessWidget {
  const PrimaryTitle({required this.text, super.key});

  final String text;

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(
        color: Colors.white,
        fontFamily: GoogleFonts.poppins().fontFamily,
        fontWeight: FontWeight.w700,
        fontSize: 20,
      ),
    );
  }
}
