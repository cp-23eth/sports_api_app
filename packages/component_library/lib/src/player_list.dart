import 'package:domain_entities/domain_entities.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sports_list/sports_list.dart';

class PlayerList extends StatefulWidget {
  const PlayerList(
      {required this.user,
      required this.color,
      required this.player,
      super.key});

  final Color color;
  final Player player;
  final User user;

  @override
  State<PlayerList> createState() => _PlayerListState();
}

class _PlayerListState extends State<PlayerList> {
  late bool _isFavorited;

  @override
  void initState() {
    super.initState();
    _isFavorited = widget.user.favoritePlayers.contains(widget.player.playerId);
  }

  void _favoritePlayer(BuildContext context, int teamId) {
    setState(() {
      _isFavorited = !_isFavorited;
    });
    if (_isFavorited) {
      context
          .read<SportsListProvider>()
          .addFavoritePlayer(widget.user.username, widget.player.playerId);
    } else {
      context
          .read<SportsListProvider>()
          .removeFavoritePlayer(widget.user.username, widget.player.playerId);
    }
  }

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

    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: MouseRegion(
        cursor: SystemMouseCursors.click,
        child: GestureDetector(
          onTap: () => Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => PlayersScreen(
                user: context.read<SportsListProvider>().state.user,
                player: widget.player,
                color: widget.color,
              ),
            ),
          ),
          child: Container(
            decoration: BoxDecoration(
              color: Parameter.teamsPlayersColor,
              borderRadius: BorderRadius.circular(20),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              mainAxisSize: MainAxisSize.min,
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(
                      horizontal: 12.0, vertical: 20.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          ClipOval(
                            child: SizedBox(
                              width: 60,
                              height: 60,
                              child: Image.asset(
                                'packages/component_library/lib/src/assets/images/player_images/${cleanFirstName(widget.player.firstName)}-${cleanLastName(widget.player.lastName)}.jpg',
                                width: 60,
                                height: 60,
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
                          const SizedBox(width: 18),
                          Text(
                            '${widget.player.firstName} ',
                            style: TextStyle(
                              color: ThemeData.estimateBrightnessForColor(
                                          Parameter.teamsPlayersColor) ==
                                      Brightness.light
                                  ? Colors.black
                                  : Colors.white,
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                              fontFamily: GoogleFonts.poppins().fontFamily,
                            ),
                          ),
                          Text(
                            widget.player.lastName,
                            style: TextStyle(
                              color: ThemeData.estimateBrightnessForColor(
                                          Parameter.teamsPlayersColor) ==
                                      Brightness.light
                                  ? Colors.black
                                  : Colors.white,
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                              fontFamily: GoogleFonts.poppins().fontFamily,
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left: 16.0),
                            child: Text(
                              _haveJersey(widget.player)
                                  ? widget.player.jersey.toString()
                                  : 'N/A',
                              style: TextStyle(
                                color: ThemeData.estimateBrightnessForColor(
                                            Parameter.teamsPlayersColor) ==
                                        Brightness.light
                                    ? Colors.black
                                    : Colors.white,
                                fontSize: 24,
                                fontFamily: GoogleFonts.poppins().fontFamily,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ],
                      ),
                      Padding(
                        padding: const EdgeInsets.only(right: 16.0),
                        child: IconButton(
                          onPressed: () =>
                              _favoritePlayer(context, widget.player.teamId),
                          icon: Icon(
                            _isFavorited
                                ? Icons.favorite
                                : Icons.favorite_border,
                            color: ThemeData.estimateBrightnessForColor(
                                        Parameter.teamsPlayersColor) ==
                                    Brightness.light
                                ? Colors.black
                                : Colors.white,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
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
