import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';

class TeamList extends StatelessWidget {
  const TeamList({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        SvgPicture.network(
          'https://upload.wikimedia.org/wikipedia/en/8/8f/Boston_Celtics.svg',
          height: 84,
          width: 84,
        ),
        const SizedBox(
          width: 32,
        ),
        Text(
          'Boston Celtics',
          style: TextStyle(
            color: Colors.white,
            fontSize: 16,
            fontFamily: GoogleFonts.poppins().fontFamily,
          ),
        ),
      ],
    );
  }
}
