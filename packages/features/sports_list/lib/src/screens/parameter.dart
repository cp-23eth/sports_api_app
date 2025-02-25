import 'package:component_library/component_library.dart';
import 'package:domain_entities/domain_entities.dart';
import 'package:flutter/material.dart';
import 'package:sports_list/sports_list.dart';

class Parameter extends StatefulWidget {
  const Parameter({required this.user, super.key});

  final User user;

  static Color headerFooterColor = const Color(0xFF1C5D99);
  static Color comingsMatchsColor = const Color(0xFFC8102E);
  static Color latestsMatchsColor = const Color(0xFF1D428A);
  static Color todaysMatchsColor = const Color(0xFF9100B6);
  static Color teamsHeaderColor = const Color(0xFF1C5D99);
  static Color teamsStadiumColor = const Color(0xFFC8102E);
  static Color teamsPlayersColor = const Color(0xFF9100B6);
  static Color backgroundColor = const Color(0xFF0B132B);

  @override
  State<Parameter> createState() => _ParameterState();
}

class _ParameterState extends State<Parameter> {
  Color headerFooterColor = Parameter.headerFooterColor;
  Color comingsMatchsColor = Parameter.comingsMatchsColor;
  Color latestsMatchsColor = Parameter.latestsMatchsColor;
  Color todaysMatchsColor = Parameter.todaysMatchsColor;

  Color teamsHeaderColor = Parameter.teamsHeaderColor;
  Color teamsStadiumColor = Parameter.teamsStadiumColor;
  Color teamsPlayersColor = Parameter.teamsPlayersColor;

  Color backgroundColor = Parameter.backgroundColor;

  @override
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Parameter.backgroundColor,
      appBar: AppBar(
        title: Text('Parameter',
            style: TextStyle(
              color: ThemeData.estimateBrightnessForColor(
                          Parameter.headerFooterColor) ==
                      Brightness.light
                  ? Colors.black
                  : Colors.white,
            )),
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back,
            color: ThemeData.estimateBrightnessForColor(
                        Parameter.headerFooterColor) ==
                    Brightness.light
                ? Colors.black
                : Colors.white,
          ),
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => const MainNba(),
              ),
            );
          },
        ),
        backgroundColor: Parameter.headerFooterColor,
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
                  changeColor: changeColorHeaderFooter,
                  keyColor: Parameter.headerFooterColor,
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
                  changeColor: changeColorComingsMatchs,
                  keyColor: Parameter.comingsMatchsColor,
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
                  changeColor: changeColorLatestsMatchs,
                  keyColor: Parameter.latestsMatchsColor,
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
                  changeColor: changeColorTodaysMatchs,
                  keyColor: Parameter.todaysMatchsColor,
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
                  changeColor: changeColorTeamsHeader,
                  keyColor: Parameter.teamsHeaderColor,
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
                  changeColor: changeColorTeamsPlayers,
                  keyColor: Parameter.teamsPlayersColor,
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
                  changeColor: changeColorTeamsStadium,
                  keyColor: Parameter.teamsStadiumColor,
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
                  changeColor: changeBackgroundColor,
                  keyColor: Parameter.backgroundColor,
                ),
              ],
            ),
            const SizedBox(
              height: 20,
            ),
            ElevatedButton(
              style: ButtonStyle(
                backgroundColor:
                    WidgetStatePropertyAll(Parameter.headerFooterColor),
              ),
              onPressed: () {
                changeColorHeaderFooter(const Color(0xFF1C5D99));
                changeColorComingsMatchs(const Color(0xFFC8102E));
                changeColorLatestsMatchs(const Color(0xFF1D428A));
                changeColorTodaysMatchs(const Color(0xFF9100B6));
                changeColorTeamsHeader(const Color(0xFF1C5D99));
                changeColorTeamsStadium(const Color(0xFFC8102E));
                changeColorTeamsPlayers(const Color(0xFF9100B6));
                changeBackgroundColor(const Color(0xFF0B132B));
              },
              child: Text(
                'Reset',
                style: TextStyle(
                  color: ThemeData.estimateBrightnessForColor(
                              Parameter.backgroundColor) ==
                          Brightness.light
                      ? Colors.black
                      : Colors.white,
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  void changeColorHeaderFooter(Color color) {
    setState(() {
      headerFooterColor = color;
      Parameter.headerFooterColor = color;
    });
  }

  void changeColorComingsMatchs(Color color) {
    setState(() {
      comingsMatchsColor = color;
      Parameter.comingsMatchsColor = color;
    });
  }

  void changeColorLatestsMatchs(Color color) {
    setState(() {
      latestsMatchsColor = color;
      Parameter.latestsMatchsColor = color;
    });
  }

  void changeColorTodaysMatchs(Color color) {
    setState(() {
      todaysMatchsColor = color;
      Parameter.todaysMatchsColor = color;
    });
  }

  void changeColorTeamsHeader(Color color) {
    setState(() {
      teamsHeaderColor = color;
      Parameter.teamsHeaderColor = color;
    });
  }

  void changeColorTeamsStadium(Color color) {
    setState(() {
      teamsStadiumColor = color;
      Parameter.teamsStadiumColor = color;
    });
  }

  void changeColorTeamsPlayers(Color color) {
    setState(() {
      teamsPlayersColor = color;
      Parameter.teamsPlayersColor = color;
    });
  }

  void changeBackgroundColor(Color color) {
    setState(() {
      backgroundColor = color;
      Parameter.backgroundColor = color;
    });
  }
}
