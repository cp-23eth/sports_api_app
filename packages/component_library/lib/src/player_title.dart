import 'package:domain_entities/domain_entities.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sports_list/sports_list.dart';

class PlayerTitle extends StatelessWidget {
  const PlayerTitle({required this.player, super.key});

  final Player player;

  @override
  Widget build(BuildContext context) {
    String cleanFirstName(String firstName) {
      firstName = firstName.replaceAll('-', '');
      firstName = firstName.replaceAll(' ', '');
      firstName = firstName.replaceAll('.', '');
      return firstName[0].toUpperCase() + firstName.substring(1).toLowerCase();
    }

    String cleanLastName(String firstName) {
      firstName = firstName.replaceAll('-', '');
      firstName = firstName.replaceAll(' ', '');
      firstName = firstName.replaceAll('.', '');
      return firstName[0].toUpperCase() + firstName.substring(1).toLowerCase();
    }

    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        ClipOval(
          child: SizedBox(
            width: 180,
            height: 180,
            child: Image.asset(
              'packages/component_library/lib/src/assets/images/player_images/${cleanFirstName(player.firstName)}-${cleanLastName(player.lastName)}.jpg',
              fit: BoxFit.cover,
              alignment: Alignment.topCenter,
              errorBuilder: (context, error, stackTrace) {
                return SvgPicture.asset(
                  'packages/component_library/lib/src/assets/images/player_images/user.svg',
                  fit: BoxFit.cover,
                  alignment: Alignment.topCenter,
                );
              },
            ),
          ),
        ),
        const SizedBox(
          height: 40,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          mainAxisSize: MainAxisSize.max,
          children: [
            Text(
              '${player.firstName} ${player.lastName}',
              style: TextStyle(
                color: ThemeData.estimateBrightnessForColor(
                            Parameter.backgroundColor) ==
                        Brightness.light
                    ? Colors.black
                    : Colors.white,
                fontSize: 30,
                fontFamily: GoogleFonts.poppins().fontFamily,
                fontWeight: FontWeight.w900,
              ),
            ),
            const SizedBox(width: 40),
            Text(
              _haveJersey(player) ? player.jersey.toString() : 'N/A',
              style: TextStyle(
                  color: ThemeData.estimateBrightnessForColor(
                              Parameter.teamsPlayersColor) ==
                          Brightness.light
                      ? Colors.black
                      : Colors.white,
                  fontSize: 30,
                  fontFamily: GoogleFonts.poppins().fontFamily,
                  fontWeight: FontWeight.w900),
            ),
          ],
        ),
      ],
    );
  }

  bool _haveJersey(Player player) {
    if (player.jersey == 999) {
      return false;
    } else {
      return true;
    }
  }
}
