import 'package:flutter/material.dart';

class PositionPlayer extends StatelessWidget {
  const PositionPlayer({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
        ),
        constraints: const BoxConstraints(
          maxWidth: 400.0,
        ),
        child: Image.asset(
          'packages/component_library/lib/src/assets/images/positions_players.png',
          fit: BoxFit.fitWidth,
          filterQuality: FilterQuality.high,
        ),
      ),
    );
  }
}
