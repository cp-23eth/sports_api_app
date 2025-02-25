import 'package:domain_entities/domain_entities.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sports_list/sports_list.dart';

class Header extends StatelessWidget {
  const Header({required this.user, required this.teams, super.key});

  final User user;
  final List<Team> teams;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          height: 100,
          decoration: BoxDecoration(
            color: Parameter.headerFooterColor,
            borderRadius: const BorderRadius.only(
              bottomLeft: Radius.circular(10),
              bottomRight: Radius.circular(10),
            ),
          ),
          child: Row(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 12.0, right: 50),
                child: Image.asset(
                  'packages/component_library/lib/src/assets/images/nba_logo.png',
                  height: 80,
                  filterQuality: FilterQuality.high,
                ),
              ),
              Text(
                'NBA',
                style: TextStyle(
                  color: ThemeData.estimateBrightnessForColor(
                              Parameter.headerFooterColor) ==
                          Brightness.light
                      ? Colors.black
                      : Colors.white,
                  fontSize: 32.0,
                  fontWeight: FontWeight.bold,
                  fontFamily: GoogleFonts.poppins().fontFamily,
                ),
              ),
              MouseRegion(
                cursor: SystemMouseCursors.click,
                child: GestureDetector(
                  onTap: () => Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => Parameter(
                        teams: teams,
                        user: user,
                      ),
                    ),
                  ),
                  child: const SizedBox(
                    width: 100,
                    child: Padding(
                      padding: EdgeInsets.only(right: 16.0),
                      child: Icon(Icons.settings,color: Colors.white, size: 32.0,),
                      ),
                    ),
                  ),
                ),
            ],
          ),
        ),
      ],
    );
  }
}
