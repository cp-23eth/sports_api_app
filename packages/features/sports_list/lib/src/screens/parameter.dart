import 'package:component_library/component_library.dart';
import 'package:domain_entities/domain_entities.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sports_list/sports_list.dart';
import 'package:toggle_switch/toggle_switch.dart';

class Parameter extends StatefulWidget {
  const Parameter({required this.teams, required this.user, super.key});

  final List<Team> teams;
  final User user;

  static Color headerFooterColor = const Color(0xFF1C5D99);
  static Color comingsMatchsColor = const Color(0xFFC8102E);
  static Color latestsMatchsColor = const Color(0xFF1D428A);
  static Color todaysMatchsColor = const Color(0xFF9100B6);
  static Color backgroundColor = const Color(0xFF0B132B);

  @override
  State<Parameter> createState() => _ParameterState();
}

bool themeMode = false;

class _ParameterState extends State<Parameter> {
  Color headerFooterColor = Parameter.headerFooterColor;
  Color comingsMatchsColor = Parameter.comingsMatchsColor;
  Color latestsMatchsColor = Parameter.latestsMatchsColor;
  Color todaysMatchsColor = Parameter.todaysMatchsColor;

  Color backgroundColor = Parameter.backgroundColor;

  @override
  Widget build(BuildContext context) {
    final state = context.watch<SportsListProvider>().state;

    List<Team> teamList = widget.teams
        .where((team) => state.user.favoriteTeams.contains(team.teamId))
        .toList();

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
      body: ListView(
        children: [
          Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const SizedBox(
                  height: 10.0,
                ),
                Text(
                  'Bonjour ${state.user.username}',
                  style: TextStyle(
                      color: ThemeData.estimateBrightnessForColor(
                                  Parameter.backgroundColor) ==
                              Brightness.light
                          ? Colors.black
                          : Colors.white,
                      fontSize: 30,
                      fontWeight: FontWeight.w900),
                ),
                const SizedBox(
                  height: 24.0,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 4.0, vertical: 8.0),
                      child: Text(
                        'Choose your color preset',
                        style: TextStyle(
                          color: ThemeData.estimateBrightnessForColor(
                                      Parameter.backgroundColor) ==
                                  Brightness.light
                              ? Colors.black
                              : Colors.white,
                          fontFamily: GoogleFonts.poppins().fontFamily,
                          fontWeight: FontWeight.w700,
                          fontSize: 26,
                        ),
                      ),
                    ),
                  ],
                ),
                FavoriteTeamListSettings(
                    teamList: teamList,
                    removeApplicationColor: removeApplicationColor,
                    changeApplicationColor: changeApplicationColor),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 4.0, vertical: 8.0),
                      child: Text(
                        'Change application colors',
                        style: TextStyle(
                          color: ThemeData.estimateBrightnessForColor(
                                      Parameter.backgroundColor) ==
                                  Brightness.light
                              ? Colors.black
                              : Colors.white,
                          fontFamily: GoogleFonts.poppins().fontFamily,
                          fontWeight: FontWeight.w700,
                          fontSize: 26,
                        ),
                      ),
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SizedBox(
                      width: 200,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text(
                              'Header / Footer :',
                              style: TextStyle(
                                color: ThemeData.estimateBrightnessForColor(
                                            Parameter.backgroundColor) ==
                                        Brightness.light
                                    ? Colors.black
                                    : Colors.white,
                                fontFamily: GoogleFonts.poppins().fontFamily,
                                fontSize: 18.0,
                                fontWeight: FontWeight.w700,
                              ),
                            ),
                          ),
                        ],
                      ),
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
                    SizedBox(
                      width: 200,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text(
                              'Comings Matchs :',
                              style: TextStyle(
                                color: ThemeData.estimateBrightnessForColor(
                                            Parameter.backgroundColor) ==
                                        Brightness.light
                                    ? Colors.black
                                    : Colors.white,
                                fontFamily: GoogleFonts.poppins().fontFamily,
                                fontSize: 18.0,
                                fontWeight: FontWeight.w700,
                              ),
                            ),
                          ),
                        ],
                      ),
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
                    SizedBox(
                      width: 200,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text(
                              'Latests Matchs :',
                              style: TextStyle(
                                color: ThemeData.estimateBrightnessForColor(
                                            Parameter.backgroundColor) ==
                                        Brightness.light
                                    ? Colors.black
                                    : Colors.white,
                                fontFamily: GoogleFonts.poppins().fontFamily,
                                fontSize: 18.0,
                                fontWeight: FontWeight.w700,
                              ),
                            ),
                          ),
                        ],
                      ),
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
                    SizedBox(
                      width: 200,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text(
                              'Todays Matchs :',
                              style: TextStyle(
                                color: ThemeData.estimateBrightnessForColor(
                                            Parameter.backgroundColor) ==
                                        Brightness.light
                                    ? Colors.black
                                    : Colors.white,
                                fontFamily: GoogleFonts.poppins().fontFamily,
                                fontSize: 18.0,
                                fontWeight: FontWeight.w700,
                              ),
                            ),
                          ),
                        ],
                      ),
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
                    SizedBox(
                      width: 200,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text(
                              'Backgrounds :',
                              style: TextStyle(
                                color: ThemeData.estimateBrightnessForColor(
                                            Parameter.backgroundColor) ==
                                        Brightness.light
                                    ? Colors.black
                                    : Colors.white,
                                fontFamily: GoogleFonts.poppins().fontFamily,
                                fontSize: 18.0,
                                fontWeight: FontWeight.w700,
                              ),
                            ),
                          ),
                        ],
                      ),
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
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    themeMode
                        ? IconButton(
                            icon: Icon(
                              Icons.light_mode,
                              color: ThemeData.estimateBrightnessForColor(
                                          Parameter.backgroundColor) ==
                                      Brightness.light
                                  ? Colors.black
                                  : Colors.white,
                            ),
                            style: ButtonStyle(
                              backgroundColor: WidgetStatePropertyAll(
                                  Parameter.headerFooterColor),
                            ),
                            onPressed: () {
                              changeColorHeaderFooter(const Color(0xFF1C5D99));
                              changeColorComingsMatchs(const Color(0xFFC8102E));
                              changeColorLatestsMatchs(const Color(0xFF1D428A));
                              changeColorTodaysMatchs(const Color(0xFF9100B6));
                              changeBackgroundColor(const Color(0xFF0B132B));

                              setState(() {
                                themeMode = !themeMode;
                              });
                            },
                          )
                        : IconButton(
                            icon: Icon(
                              Icons.dark_mode,
                              color: ThemeData.estimateBrightnessForColor(
                                          Parameter.backgroundColor) ==
                                      Brightness.light
                                  ? Colors.black
                                  : Colors.white,
                            ),
                            style: ButtonStyle(
                              backgroundColor: WidgetStatePropertyAll(
                                  Parameter.headerFooterColor),
                            ),
                            onPressed: () {
                              changeColorHeaderFooter(
                                  const Color.fromARGB(255, 255, 225, 240));
                              changeColorComingsMatchs(
                                  const Color.fromARGB(255, 255, 190, 235));
                              changeColorLatestsMatchs(
                                  const Color.fromARGB(255, 173, 200, 255));
                              changeColorTodaysMatchs(
                                  const Color.fromARGB(255, 219, 176, 255));
                              changeBackgroundColor(
                                  const Color.fromARGB(255, 255, 246, 253));

                              setState(() {
                                themeMode = !themeMode;
                              });
                            },
                          ),
                  ],
                ),
                const SizedBox(
                  height: 40.0,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 4.0, vertical: 8.0),
                      child: Text(
                        'Choose your design preset',
                        style: TextStyle(
                          color: ThemeData.estimateBrightnessForColor(
                                      Parameter.backgroundColor) ==
                                  Brightness.light
                              ? Colors.black
                              : Colors.white,
                          fontFamily: GoogleFonts.poppins().fontFamily,
                          fontWeight: FontWeight.w700,
                          fontSize: 26,
                        ),
                      ),
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SizedBox(
                      width: 200,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text(
                              'Home Screen :',
                              style: TextStyle(
                                color: ThemeData.estimateBrightnessForColor(
                                            Parameter.backgroundColor) ==
                                        Brightness.light
                                    ? Colors.black
                                    : Colors.white,
                                fontFamily: GoogleFonts.poppins().fontFamily,
                                fontSize: 18.0,
                                fontWeight: FontWeight.w700,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(width: 10),
                    ToggleSwitch(
                      initialLabelIndex:
                          state.user.homeScreenDesign == 'List' ? 1 : 0,
                      totalSwitches: 2,
                      minWidth: 100,
                      inactiveFgColor: ThemeData.estimateBrightnessForColor(
                                  Parameter.backgroundColor) ==
                              Brightness.light
                          ? Colors.black
                          : Colors.white,
                      activeFgColor: ThemeData.estimateBrightnessForColor(
                                  Parameter.headerFooterColor) ==
                              Brightness.light
                          ? Colors.black
                          : Colors.white,
                      activeBgColor: [Parameter.headerFooterColor],
                      inactiveBgColor: Parameter.backgroundColor,
                      labels: const ['Carrousel', 'List'],
                      onToggle: (index) {
                        setState(() {
                          if (index == 0) {
                            state.user.homeScreenDesign = 'Carrousel';
                          } else {
                            state.user.homeScreenDesign = 'List';
                          }
                        });
                      },
                    )
                  ],
                ),
                const SizedBox(
                  height: 20.0,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SizedBox(
                      width: 200,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text(
                              'Team Screen :',
                              style: TextStyle(
                                color: ThemeData.estimateBrightnessForColor(
                                            Parameter.backgroundColor) ==
                                        Brightness.light
                                    ? Colors.black
                                    : Colors.white,
                                fontFamily: GoogleFonts.poppins().fontFamily,
                                fontSize: 18.0,
                                fontWeight: FontWeight.w700,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(width: 10),
                    ToggleSwitch(
                      initialLabelIndex:
                          state.user.teamScreenDesign == 'List' ? 1 : 0,
                      totalSwitches: 2,
                      minWidth: 100,
                      inactiveFgColor: ThemeData.estimateBrightnessForColor(
                                  Parameter.backgroundColor) ==
                              Brightness.light
                          ? Colors.black
                          : Colors.white,
                      activeFgColor: ThemeData.estimateBrightnessForColor(
                                  Parameter.headerFooterColor) ==
                              Brightness.light
                          ? Colors.black
                          : Colors.white,
                      activeBgColor: [Parameter.headerFooterColor],
                      inactiveBgColor: Parameter.backgroundColor,
                      labels: const ['CircleAvatar', 'List'],
                      onToggle: (index) {
                        setState(() {
                          if (index == 0) {
                            state.user.teamScreenDesign = 'CircleAvatar';
                          } else {
                            state.user.teamScreenDesign = 'List';
                          }
                        });
                      },
                    )
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  void changeColorHeaderFooter(Color color) {
    setState(() {
      headerFooterColor = color;
      Parameter.headerFooterColor = color;
      widget.user.appColorTeam = 'userChoice';
    });
  }

  void changeColorComingsMatchs(Color color) {
    setState(() {
      comingsMatchsColor = color;
      Parameter.comingsMatchsColor = color;
      widget.user.appColorTeam = 'userChoice';
    });
  }

  void changeColorLatestsMatchs(Color color) {
    setState(() {
      latestsMatchsColor = color;
      Parameter.latestsMatchsColor = color;
      widget.user.appColorTeam = 'userChoice';
    });
  }

  void changeColorTodaysMatchs(Color color) {
    setState(() {
      todaysMatchsColor = color;
      Parameter.todaysMatchsColor = color;
      widget.user.appColorTeam = 'userChoice';
    });
  }

  void changeBackgroundColor(Color color) {
    setState(() {
      backgroundColor = color;
      Parameter.backgroundColor = color;
    });
  }

  void changeApplicationColor(Team team) {
    final teamColors = {
      'Knicks': [0xFFF58426, 0xFF1D428A, 0xFF9EA2A2, 0xFFF58426],
      '76ers': [0xFFC4CED4, 0xFF002B5C, 0xFFC8102E, 0xFFC4CED4],
      'Nets': [0xFF858585, 0xFF75899F, 0xFF627E75, 0xFF000000],
      'Celtics': [0xFF008348, 0xFF759F8D, 0xFFBB9753, 0xFF772A00],
      'Raptors': [0xFFCE1141, 0xFF777777, 0xFF262626, 0xFFCE1141],
      'Bulls': [0xFFCE1114, 0xFF777777, 0xFF262626, 0xFFCE1114],
      'Cavaliers': [0xFFBC945C, 0xFF777777, 0xFF262626, 0xFF860038],
      'Pacers': [0xFFFDBB30, 0xFFBEC0C2, 0xFF002D62, 0xFFFDBB30],
      'Pistons': [0xFF1D428A, 0xFFBEC0C2, 0xFFC8102E, 0xFF1D428A],
      'Bucks': [0xFF00471B, 0xFF0077C0, 0xFFEEE1C6, 0xFF00471B],
      'Wizards': [0xFF002B5C, 0xFFC4CED4, 0xFFE31837, 0xFF002B5C],
      'Hornets': [0xFF00788C, 0xFFA1A1A4, 0xFF1D1160, 0xFF00788C],
      'Hawks': [0xFFC8102E, 0xFF9EA2A2, 0xFFFDB927, 0xFFC8102E],
      'Heat': [0xFF98002E, 0xFFF9A01B, 0xFFF9A01B, 0xFF98002E],
      'Magic': [0xFF0077C0, 0xFFC4CED4, 0xFFC4CED4, 0xFF0077C0],
      'Timberwolves': [0xFF0C233F, 0xFF266092, 0xFF266092, 0xFF79BC43],
      'Jazz': [0xFF002144, 0xFF274E37, 0xFFFFA200, 0xFF002144],
      'Thunder': [0xFF002D62, 0xFFFDBB30, 0xFFEF3B24, 0xFF007AC1],
      'Trail Blazers': [0xFFE03A3E, 0xFFC10005, 0xFFC10005, 0xFFE03A3E],
      'Nuggets': [0xFF0E2240, 0xFF8B2131, 0xFFFEC524, 0xFF244289],
      'Warriors': [0xFF1D428A, 0xFFFDB927, 0xFFFDB927, 0xFF1D428A],
      'Lakers': [0xFF31006F, 0xFFFDB927, 0xFFFDB927, 0xFF31006F],
      'Clippers': [0xFF12173F, 0xFF4891CE, 0xFFC8102E, 0xFF12173F],
      'Suns': [0xFF1D1160, 0xFFE56020, 0xFFE56020, 0xFF1D1160],
      'Kings': [0xFF5A2B81, 0xFF707271, 0xFF707271, 0xFF5A2B81],
      'Grizzlies': [0xFF12173F, 0xFF5D76A9, 0xFF5D76A9, 0xFF12173F],
      'Rockets': [0xFFCE1141, 0xFF373A36, 0xFF9EA2A2, 0xFFCE1141],
      'Pelicans': [0xFF0C2340, 0xFFCE0E2D, 0xFFCE0E2D, 0xFFB9975B],
      'Spurs': [0xFFC4CED4, 0xFF919DA5, 0xFF919DA5, 0xFFC4CED4],
      'Mavericks': [0xFF0064B1, 0xFFBBC4CA, 0xFFBBC4CA, 0xFF0064B1],
    };

    if (teamColors.containsKey(team.name)) {
      final colors = teamColors[team.name]!;
      setState(() {
        Parameter.headerFooterColor = Color(colors[0]);
        Parameter.comingsMatchsColor = Color(colors[1]);
        Parameter.latestsMatchsColor = Color(colors[2]);
        Parameter.todaysMatchsColor = Color(colors[3]);
        Parameter.backgroundColor = const Color(0xFF0B132B);
        _changeAppColorTeam(team);
      });
    }
  }

  void removeApplicationColor() {
    setState(() {
      Parameter.headerFooterColor = const Color(0xFF1C5D99);
      Parameter.comingsMatchsColor = const Color(0xFFC8102E);
      Parameter.latestsMatchsColor = const Color(0xFF1D428A);
      Parameter.todaysMatchsColor = const Color(0xFF9100B6);
      Parameter.backgroundColor = const Color(0xFF0B132B);
    });
  }

  void _changeAppColorTeam(Team team) {
    context.read<SportsListProvider>().changeAppColorTeam(team);
  }
}
