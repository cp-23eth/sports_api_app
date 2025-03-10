import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sports_list/sports_list.dart';

class SecondaryTitle extends StatelessWidget {
  const SecondaryTitle({required this.text, super.key});

  final String text;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text(
            text,
            style: TextStyle(
              color: ThemeData.estimateBrightnessForColor(
                          Parameter.backgroundColor) ==
                      Brightness.light
                  ? Colors.black
                  : Colors.white,
              fontFamily: GoogleFonts.poppins().fontFamily,
              fontSize: 18.0,
              fontWeight: FontWeight.w700,
            ),
          ),
        ),
      ],
    );
  }
}
