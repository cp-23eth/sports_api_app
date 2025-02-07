import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';

class CalenderMatchList extends StatelessWidget {
  const CalenderMatchList({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        borderRadius: BorderRadius.all(
          Radius.circular(20.0),
        ),
        color: Color(0xFFC8102E),
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
                SvgPicture.network(
                  'https://upload.wikimedia.org/wikipedia/en/6/67/Chicago_Bulls_logo.svg',
                  height: 25.0,
                  width: 25.0,
                ),
                Text(
                  'Chicago Bulls',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 11.0,
                    fontFamily: GoogleFonts.poppins().fontFamily,
                  ),
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Text(
                      '18:00',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 10.0,
                        fontFamily: GoogleFonts.poppins().fontFamily,
                      ),
                    ),
                    Text(
                      '0 - 0',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 14.0,
                        fontFamily: GoogleFonts.poppins().fontFamily,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      '22.02.2025',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 8.0,
                        fontFamily: GoogleFonts.poppins().fontFamily,
                      ),
                    ),
                  ],
                ),
                Text(
                  'Boston Celtics',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 11.0,
                    fontFamily: GoogleFonts.poppins().fontFamily,
                  ),
                ),
                SvgPicture.network(
                  'https://upload.wikimedia.org/wikipedia/en/8/8f/Boston_Celtics.svg',
                  height: 25.0,
                  width: 25.0,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
