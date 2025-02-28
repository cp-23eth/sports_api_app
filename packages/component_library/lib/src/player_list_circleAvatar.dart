import 'package:domain_entities/domain_entities.dart';
import 'package:flutter/material.dart';

class PlayerListCircleavatar extends StatefulWidget {
  const PlayerListCircleavatar({required this.player, super.key});

  final Player player;

  @override
  State<PlayerListCircleavatar> createState() => _PlayerListCircleavatarState();
}

class _PlayerListCircleavatarState extends State<PlayerListCircleavatar> {
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

    return CircleAvatar(
      backgroundImage: AssetImage('packages/component_library/lib/src/assets/images/player_images/${cleanFirstName(widget.player.firstName)}-${cleanLastName(widget.player.lastName)}.jpg'),
      child: Text(
        cleanFirstName(widget.player.firstName) +
            cleanLastName(widget.player.lastName),
        style: const TextStyle(
          color: Colors.white,
          fontSize: 12,
        ),
      ),
    );
  }
}
