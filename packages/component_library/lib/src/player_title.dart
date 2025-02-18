import 'package:domain_entities/domain_entities.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class PlayerTitle extends StatelessWidget {
  const PlayerTitle({required this.player, super.key});

  final Player player;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      mainAxisSize: MainAxisSize.max,
      children: [
        Text(
          '${player.firstName} ${player.lastName}',
          style: TextStyle(
            color: Colors.white,
            fontSize: 20,
            fontFamily: GoogleFonts.poppins().fontFamily,
            fontWeight: FontWeight.w900,
          ),
        ),
        const SizedBox(width: 64),
        Text(
          _haveJersey(player) ? player.jersey.toString() : 'N/A',
          style: TextStyle(
              color: Colors.white,
              fontSize: 24,
              fontFamily: GoogleFonts.poppins().fontFamily,
              fontWeight: FontWeight.w900),
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
