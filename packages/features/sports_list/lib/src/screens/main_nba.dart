// ignore_for_file: unrelated_type_equality_checks

import 'package:domain_entities/domain_entities.dart';
import 'package:flutter/material.dart';
import 'package:loading_indicator/loading_indicator.dart';
import 'package:sports_list/sports_list.dart';
import 'package:sports_list/src/screens/calender_load_screen.dart';

class MainNba extends StatefulWidget {
  const MainNba({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _MainNbaState createState() => _MainNbaState();
}

class _MainNbaState extends State<MainNba> {
  final List<Color> _kDefaultRainbowColors = [
    Parameter.headerFooterColor,
  ];

  int _selectedIndex = 1;

  @override
  void initState() {
    super.initState();
    if (context.read<SportsListProvider>().state.teams.isEmpty ||
        context.read<SportsListProvider>().state.games.isEmpty ||
        context.read<SportsListProvider>().state.players.isEmpty ||
        context.read<SportsListProvider>().state.stadiums.isEmpty) {
      WidgetsBinding.instance.addPostFrameCallback((_) {
        context.read<SportsListProvider>().fetchAndSetSports();
      });
    }
  }

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  Widget _showSports() {
    final state = context.watch<SportsListProvider>().state;

    state.games.sort((a, b) =>
        DateTime.parse(b.dateTime).compareTo(DateTime.parse(a.dateTime)));

    if (state.status == SportsListStatus.loading) {
      return Scaffold(
        backgroundColor: Parameter.backgroundColor,
        body: Center(
          child: SizedBox(
            height: 300,
            width: 300,
            child: LoadingIndicator(
              indicatorType: Indicator.ballClipRotateMultiple,
              colors: _kDefaultRainbowColors,
            ),
          ),
        ),
      );
    }

    if (state.games.isEmpty) {
      return const Center(child: Text('No games available'));
    }

    if (state.user.appColorTeam != 'userChoice') {
      changeApplicationColor(state.teams
          .firstWhere((team) => team.name == state.user.appColorTeam));
    }
    return Scaffold(
      backgroundColor: Parameter.backgroundColor,
      bottomNavigationBar: Theme(
        data: Theme.of(context).copyWith(
          splashFactory: NoSplash.splashFactory,
        ),
        child: BottomNavigationBar(
          backgroundColor: Parameter.headerFooterColor,
          items: <BottomNavigationBarItem>[
            BottomNavigationBarItem(
              icon: const SizedBox(
                height: 15,
                child: Center(
                  child: Icon(Icons.calendar_month),
                ),
              ),
              label: '',
              backgroundColor: Parameter.headerFooterColor,
            ),
            BottomNavigationBarItem(
              icon: const SizedBox(
                height: 15,
                child: Center(
                  child: Icon(Icons.home),
                ),
              ),
              label: '',
              backgroundColor: Parameter.headerFooterColor,
            ),
            BottomNavigationBarItem(
              icon: const SizedBox(
                height: 15,
                child: Center(
                  child: Icon(Icons.group),
                ),
              ),
              label: '',
              backgroundColor: Parameter.headerFooterColor,
            ),
            BottomNavigationBarItem(
              icon: const SizedBox(
                height: 15,
                child: Center(
                  child: Icon(Icons.sports_basketball),
                ),
              ),
              label: '',
              backgroundColor: Parameter.headerFooterColor,
            ),
          ],
          currentIndex: _selectedIndex,
          selectedItemColor: ThemeData.estimateBrightnessForColor(
                      Parameter.headerFooterColor) ==
                  Brightness.light
              ? Colors.black
              : Colors.white,
          unselectedItemColor: ThemeData.estimateBrightnessForColor(
                      Parameter.headerFooterColor) ==
                  Brightness.light
              ? Colors.black
              : Colors.white,
          selectedIconTheme: const IconThemeData(size: 36),
          unselectedIconTheme: const IconThemeData(size: 24),
          onTap: _onItemTapped,
          enableFeedback: false,
        ),
      ),
      body: Column(
        children: [
          Expanded(
            child: _widgetOptions(state)[_selectedIndex],
          ),
        ],
      ),
    );
  }

  List<Widget> _widgetOptions(SportsListState state) {
    return [
      CalenderLoad(
        user: state.user,
        stateTeams: state.teams,
        stateStadiums: state.stadiums,
        stateGames: state.games,
      ),
      HomeScreen(
        teams: state.teams,
        design: state.user.homeScreenDesign,
      ),
      HomeScreenTeams(
        user: state.user,
        teams: state.teams,
      ),
      GeneralBasketScreen(
        user: state.user,
        teams: state.teams,
      ),
    ];
  }

  @override
  Widget build(BuildContext context) {
    return _showSports();
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
      });
    }
  }
}
