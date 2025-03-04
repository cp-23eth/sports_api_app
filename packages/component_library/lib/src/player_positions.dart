import 'package:domain_entities/domain_entities.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class PlayerPositions extends StatelessWidget {
  const PlayerPositions({required this.player, super.key});

  final Player player;

  @override
  Widget build(BuildContext context) {
    String cleanName(String firstName) {
      firstName = firstName.replaceAll('-', '');
      firstName = firstName.replaceAll(' ', '');
      firstName = firstName.replaceAll('.', '');
      return firstName[0].toUpperCase() + firstName.substring(1).toLowerCase();
    }
    
    double playerPositionTop = 0;
    double playerPositionLeft = 0;

    if (player.position == 'PF') {
      playerPositionLeft = 111;
      playerPositionTop = 51;
    } else if (player.position == 'C') {
      playerPositionLeft = 271;
      playerPositionTop = 75;
    } else if (player.position == 'PG') {
      playerPositionLeft = 232;
      playerPositionTop = 298;
    } else if (player.position == 'SF') {
      playerPositionLeft = 363;
      playerPositionTop = 165;
    } else if (player.position == 'SG') {
      playerPositionLeft = 53;
      playerPositionTop = 198;
    } 

    return Stack(
      children: [
        Image.asset(
          'packages/component_library/lib/src/assets/images/positions_players.png',
          width: 500,
        ),
        Positioned(
          left: playerPositionLeft,
          top: playerPositionTop,
          child: ClipOval(
            child: SizedBox(
              width: 36,
              height: 36,
              child: Image.asset(
                'packages/component_library/lib/src/assets/images/player_images/${cleanName(player.firstName)}-${cleanName(player.lastName)}.jpg',
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
        )
      ],
    );
  }
}
