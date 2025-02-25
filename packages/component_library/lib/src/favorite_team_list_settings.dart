import 'package:domain_entities/domain_entities.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class FavoriteTeamListSettings extends StatefulWidget {
  const FavoriteTeamListSettings({required this.teamList, super.key});

  final List<Team> teamList;

  @override
  State<FavoriteTeamListSettings> createState() => _FavoriteTeamListSettingsState();
}

class _FavoriteTeamListSettingsState extends State<FavoriteTeamListSettings> {
  Team? selectedTeam;

  Widget _teamComponent(Team team) {
    final bool isSelected = selectedTeam == team;
    return TextButton(
      onPressed: () {
        setState(() {
          if (isSelected) {
            selectedTeam = null;
          } else {
            selectedTeam = team;
          }
        });
      },
      child: Container(
        decoration: BoxDecoration(
          color: isSelected ? Colors.white : Colors.transparent,
          shape: BoxShape.circle,
        ),
        padding: const EdgeInsets.all(16),
        child: Stack(
          alignment: Alignment.center,
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.end,
              mainAxisSize: MainAxisSize.min,
              children: [
                const SizedBox(height: 12.0,),
                Center(
                  child: SvgPicture.asset(
                    'packages/component_library/lib/src/assets/images/svg/${team.logo}',
                    width: 58.0,
                    fit: BoxFit.fitWidth,
                  ),
                ),
                const SizedBox(height: 8),
                Center(child: Text(team.name)),
              ],
            ),
            if (isSelected)
              const Positioned(
                top: 0,
                right: 0,
                child: Icon(Icons.star, color: Colors.black, size: 16),
              ),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return GridView.count(
      crossAxisCount: 3,
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      mainAxisSpacing: 16,
      crossAxisSpacing: 16,
      children: widget.teamList.map(_teamComponent).toList(),
    );
  }
}
