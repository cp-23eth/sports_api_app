import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class SecondaryTitle extends StatelessWidget {
  const SecondaryTitle({required this.text, super.key});

  final String text;

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(
        color: Colors.white,
        fontFamily: GoogleFonts.poppins().fontFamily,
        fontSize: 14.0,
        fontWeight: FontWeight.w700,
      ),
    );
  }
}
