import 'package:domain_entities/domain_entities.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sports_list/sports_list.dart';

class PlayerListCircleAvatar extends StatefulWidget {
  const PlayerListCircleAvatar(
      {required this.player,
      required this.user,
      required this.color,
      super.key});

  final Player player;
  final User user;
  final Color color;

  @override
  State<PlayerListCircleAvatar> createState() => _PlayerListCircleAvatarState();
}

class _PlayerListCircleAvatarState extends State<PlayerListCircleAvatar> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    String cleanName(String firstName) {
      firstName = firstName.replaceAll('-', '');
      firstName = firstName.replaceAll(' ', '');
      firstName = firstName.replaceAll('.', '');
      return firstName[0].toUpperCase() + firstName.substring(1).toLowerCase();
    }

    return MouseRegion(
      cursor: SystemMouseCursors.click,
      child: GestureDetector(
        onTap: () => Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => PlayersScreen(
              player: widget.player,
              user: widget.user,
              color: widget.color,
            ),
          ),
        ),
        child: Center(
          child: Column(
            children: [
              ClipOval(
                child: SizedBox(
                  width: 85,
                  height: 85,
                  child: Image.asset(
                    'packages/component_library/lib/src/assets/images/player_images/${cleanName(widget.player.firstName)}-${cleanName(widget.player.lastName)}.jpg',
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
              const SizedBox(height: 10),
              Text(
                textAlign: TextAlign.center,
                cleanName(widget.player.firstName),
                style: TextStyle(
                  color: ThemeData.estimateBrightnessForColor(
                              Parameter.backgroundColor) ==
                          Brightness.light
                      ? Colors.black
                      : Colors.white,
                  fontSize: 14,
                  fontWeight: FontWeight.bold,
                  fontFamily: GoogleFonts.poppins().fontFamily,
                ),
              ),
              Text(
                textAlign: TextAlign.center,
                cleanName(widget.player.lastName),
                style: TextStyle(
                  color: ThemeData.estimateBrightnessForColor(
                              Parameter.backgroundColor) ==
                          Brightness.light
                      ? Colors.black
                      : Colors.white,
                  fontSize: 14,
                  fontWeight: FontWeight.bold,
                  fontFamily: GoogleFonts.poppins().fontFamily,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
