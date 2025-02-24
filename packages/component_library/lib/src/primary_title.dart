import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sports_list/sports_list.dart';

class PrimaryTitle extends StatelessWidget {
  const PrimaryTitle({required this.text, super.key});

  final String text;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 4.0, vertical: 8.0),
          child: Text(
            text,
            style: TextStyle(
              color: ThemeData.estimateBrightnessForColor(
                          Parameter.backgroundColor) ==
                      Brightness.light
                  ? Colors.black
                  : Colors.white,
              fontFamily: GoogleFonts.poppins().fontFamily,
              fontWeight: FontWeight.w700,
              fontSize: 26,
            ),
          ),
        ),
      ],
    );
  }
}
