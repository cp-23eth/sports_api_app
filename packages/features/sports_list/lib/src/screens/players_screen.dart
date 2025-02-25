import 'package:component_library/component_library.dart';
import 'package:domain_entities/domain_entities.dart';
import 'package:flutter/material.dart';
import 'package:sports_list/sports_list.dart';

class PlayersScreen extends StatefulWidget {
  const PlayersScreen(
      {required this.user,
      required this.color,
      required this.player,
      required this.favoritePlayer,
      super.key});

  final Color color;
  final Player player;
  final User user;
  final Function favoritePlayer;

  @override
  State<PlayersScreen> createState() => _PlayersScreenState();
}

class _PlayersScreenState extends State<PlayersScreen> {
  late bool _isFavorited;

  @override
  void initState() {
    super.initState();
    _isFavorited = widget.user.favoritePlayers.contains(widget.player.playerId);
  }

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
        actions: [
          IconButton(
            onPressed: () {
              widget.favoritePlayer(context, widget.player.playerId);
              setState(() {
                _isFavorited = !_isFavorited;
              });
            },
            icon: Icon(
              _isFavorited ? Icons.favorite : Icons.favorite_border,
              color: ThemeData.estimateBrightnessForColor(
                          Parameter.backgroundColor) ==
                      Brightness.light
                  ? Colors.black
                  : Colors.white,
            ),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  PlayerTitle(player: widget.player),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: PlayerInfo(
                player: widget.player,
                color: widget.color,
              ),
            ),
            PlayerPositions(player: widget.player)
          ],
        ),
      ),
    );
  }
}
