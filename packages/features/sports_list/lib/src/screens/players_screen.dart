import 'package:component_library/component_library.dart';
import 'package:domain_entities/domain_entities.dart';
import 'package:flutter/material.dart';
import 'package:sports_list/sports_list.dart';

class PlayersScreen extends StatelessWidget {
  const PlayersScreen({required this.color, required this.player, super.key});

  final Color color;
  final Player player;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Parameter.backgroundColor,
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back,
            color: ThemeData.estimateBrightnessForColor(
                        Parameter.backgroundColor) ==
                    Brightness.light
                ? Colors.black
                : Colors.white,
          ),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        backgroundColor: Colors.transparent,
        centerTitle: true,
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                PlayerTitle(player: player),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: PlayerInfo(
              player: player,
              color: color,
            ),
          ),
        ],
      ),
    );
  }
}
