import 'package:domain_entities/domain_entities.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:sports_list/sports_list.dart';

class FavoriteTeamListSettings extends StatefulWidget {
  const FavoriteTeamListSettings(
      {required this.removeApplicationColor,
      required this.changeApplicationColor,
      required this.teamList,
      super.key});

  final void Function() removeApplicationColor;
  final void Function(Team) changeApplicationColor;

  final List<Team> teamList;

  @override
  State<FavoriteTeamListSettings> createState() =>
      _FavoriteTeamListSettingsState();
}

class _FavoriteTeamListSettingsState extends State<FavoriteTeamListSettings> {
  Team? selectedTeam;

  Widget _teamComponent(Team team) {
    final bool isSelected = selectedTeam == team;
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(100.0),
        border: Border.all(
          color: isSelected ? Colors.white : Parameter.backgroundColor,
          width: 2.0,
        ),
      ),
      child: ElevatedButton(
        style: ButtonStyle(
            backgroundColor: WidgetStateProperty.all(Parameter.backgroundColor),
            shadowColor: const WidgetStatePropertyAll(Colors.transparent)),
        onPressed: () {
          setState(() {
            if (isSelected) {
              selectedTeam = null;
              widget.removeApplicationColor();
            } else {
              selectedTeam = team;
              widget.changeApplicationColor(team);
            }
          });
        },
        child: Stack(
          alignment: Alignment.center,
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.end,
              mainAxisSize: MainAxisSize.min,
              children: [
                const SizedBox(
                  height: 12.0,
                ),
                Center(
                  child: SvgPicture.asset(
                    'packages/component_library/lib/src/assets/images/svg/${team.logo}',
                    height: 58.0,
                    fit: BoxFit.fitHeight,
                  ),
                ),
                const SizedBox(height: 8),
                Center(
                    child: Text(
                  team.name,
                  style: TextStyle(
                    color: ThemeData.estimateBrightnessForColor(
                                Parameter.backgroundColor) ==
                            Brightness.light
                        ? Colors.black
                        : Colors.white,
                  ),
                )),
              ],
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
