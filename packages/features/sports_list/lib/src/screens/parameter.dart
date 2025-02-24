import 'package:component_library/component_library.dart';
import 'package:flutter/material.dart';

class Parameter extends StatefulWidget {
  const Parameter({super.key});
  // ignore: non_constant_identifier_names
  static Color header_footer_color = const Color(0xFF1C5D99);
  // ignore: non_constant_identifier_names
  static Color comings_matchs_color = const Color(0xFFC8102E);
  // ignore: non_constant_identifier_names
  static Color latests_matchs_color = const Color(0xFF1D428A);
  // ignore: non_constant_identifier_names
  static Color todays_matchs_color = const Color(0xFF9100B6);

  // ignore: non_constant_identifier_names
  static Color teams_header_color = const Color(0xFF1C5D99);
  // ignore: non_constant_identifier_names
  static Color teams_stadium_color = const Color(0xFFC8102E);
  // ignore: non_constant_identifier_names
  static Color teams_players_color = const Color(0xFF9100B6);

  // ignore: non_constant_identifier_names
  static Color background_color = const Color(0xFF0B132B);

  @override
  State<Parameter> createState() => _ParameterState();
}

class _ParameterState extends State<Parameter> {
  Color headerFooterColor = Parameter.header_footer_color;
  Color comingsMatchsColor = Parameter.comings_matchs_color;
  Color latestsMatchsColor = Parameter.latests_matchs_color;
  Color todaysMatchsColor = Parameter.todays_matchs_color;

  Color teamsHeaderColor = Parameter.teams_header_color;
  Color teamsStadiumColor = Parameter.teams_stadium_color;
  Color teamsPlayersColor = Parameter.teams_players_color;

  Color backgroundColor = Parameter.background_color;

  @override
  Widget build(BuildContext context) {
    final List<Color> availableColors = [
      const Color(0xFF1C5D99),
      const Color(0xFF0B132B),
      const Color(0xFFC8102E),
      const Color(0xFF9100B6),
      const Color(0xFF1D428A),
      Colors.green,
      Colors.blue,
      Colors.yellow,
      Colors.orange,
      Colors.pink,
      Colors.cyan,
      Colors.teal,
      Colors.lime,
      Colors.indigo,
      Colors.brown,
      Colors.grey,
      Colors.black,
      Colors.white,
    ];
    return Scaffold(
      backgroundColor: const Color(0xFF0B132B),
      appBar: AppBar(
        title: Text('Parameter',
            style: TextStyle(
              color: ThemeData.estimateBrightnessForColor(
                          Parameter.header_footer_color) ==
                      Brightness.light
                  ? Colors.black
                  : Colors.white,
            )),
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back,
            color: ThemeData.estimateBrightnessForColor(
                        Parameter.header_footer_color) ==
                    Brightness.light
                ? Colors.black
                : Colors.white,
          ),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        backgroundColor: Parameter.header_footer_color,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const PrimaryTitle(text: 'Change application colors'),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const SizedBox(
                  width: 200,
                  child: SecondaryTitle(text: 'Header / Footer :'),
                ),
                const SizedBox(width: 10),
                ButtonColorPicker(
                  pickerColor: headerFooterColor,
                  availableColors: availableColors,
                  changeColor: changeColorHeaderFooter,
                  keyColor: Parameter.header_footer_color,
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const SizedBox(
                  width: 200,
                  child: SecondaryTitle(text: 'Comings Matchs :'),
                ),
                const SizedBox(width: 10),
                ButtonColorPicker(
                  pickerColor: comingsMatchsColor,
                  availableColors: availableColors,
                  changeColor: changeColorComingsMatchs,
                  keyColor: Parameter.comings_matchs_color,
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const SizedBox(
                  width: 200,
                  child: SecondaryTitle(text: 'Latests Matchs :'),
                ),
                const SizedBox(width: 10),
                ButtonColorPicker(
                  pickerColor: latestsMatchsColor,
                  availableColors: availableColors,
                  changeColor: changeColorLatestsMatchs,
                  keyColor: Parameter.latests_matchs_color,
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const SizedBox(
                  width: 200,
                  child: SecondaryTitle(text: 'Todays Matchs :'),
                ),
                const SizedBox(width: 10),
                ButtonColorPicker(
                  pickerColor: todaysMatchsColor,
                  availableColors: availableColors,
                  changeColor: changeColorTodaysMatchs,
                  keyColor: Parameter.todays_matchs_color,
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const SizedBox(
                  width: 200,
                  child: SecondaryTitle(text: 'Teams Headers :'),
                ),
                const SizedBox(width: 10),
                ButtonColorPicker(
                  pickerColor: teamsHeaderColor,
                  availableColors: availableColors,
                  changeColor: changeColorTeamsHeader,
                  keyColor: Parameter.teams_header_color,
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const SizedBox(
                  width: 200,
                  child: SecondaryTitle(text: 'Teams Players :'),
                ),
                const SizedBox(width: 10),
                ButtonColorPicker(
                  pickerColor: teamsPlayersColor,
                  availableColors: availableColors,
                  changeColor: changeColorTeamsPlayers,
                  keyColor: Parameter.teams_players_color,
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const SizedBox(
                  width: 200,
                  child: SecondaryTitle(text: 'Teams Stadiums :'),
                ),
                const SizedBox(width: 10),
                ButtonColorPicker(
                  pickerColor: teamsStadiumColor,
                  availableColors: availableColors,
                  changeColor: changeColorTeamsStadium,
                  keyColor: Parameter.teams_stadium_color,
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const SizedBox(
                  width: 200,
                  child: SecondaryTitle(text: 'Backgrounds :'),
                ),
                const SizedBox(width: 10),
                ButtonColorPicker(
                  pickerColor: backgroundColor,
                  availableColors: availableColors,
                  changeColor: changeBackgroundColor,
                  keyColor: Parameter.background_color,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  void changeColorHeaderFooter(Color color) {
    setState(() {
      headerFooterColor = color;
      Parameter.header_footer_color = color;
    });
  }

  void changeColorComingsMatchs(Color color) {
    setState(() {
      comingsMatchsColor = color;
      Parameter.comings_matchs_color = color;
    });
  }

  void changeColorLatestsMatchs(Color color) {
    setState(() {
      latestsMatchsColor = color;
      Parameter.latests_matchs_color = color;
    });
  }

  void changeColorTodaysMatchs(Color color) {
    setState(() {
      todaysMatchsColor = color;
      Parameter.todays_matchs_color = color;
    });
  }

  void changeColorTeamsHeader(Color color) {
    setState(() {
      teamsHeaderColor = color;
      Parameter.teams_header_color = color;
    });
  }

  void changeColorTeamsStadium(Color color) {
    setState(() {
      teamsStadiumColor = color;
      Parameter.teams_stadium_color = color;
    });
  }

  void changeColorTeamsPlayers(Color color) {
    setState(() {
      teamsPlayersColor = color;
      Parameter.teams_players_color = color;
    });
  }

  void changeBackgroundColor(Color color) {
    setState(() {
      backgroundColor = color;
      Parameter.background_color = color;
    });
  }
}
