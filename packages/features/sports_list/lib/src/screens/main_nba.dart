import 'package:domain_entities/domain_entities.dart';
import 'package:flutter/material.dart';
import 'package:loading_indicator/loading_indicator.dart';
import 'package:sports_list/sports_list.dart';
import 'package:sports_list/src/screens/calender_load_screen.dart';

class MainNba extends StatefulWidget {
  const MainNba({required this.user, super.key});

  final User user;

  @override
  // ignore: library_private_types_in_public_api
  _MainNbaState createState() => _MainNbaState();
}

class _MainNbaState extends State<MainNba> {
  final List<Color> _kDefaultRainbowColors = [
    Parameter.headerFooterColor,
  ];

  int _selectedIndex = 1;

  @override // Permet de charger du contenu
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
        user: widget.user,
        stateTeams: state.teams,
        stateStadiums: state.stadiums,
        stateGames: state.games,
      ),
      HomeScreen(
        user: widget.user,
      ),
      HomeScreenTeams(
        user: widget.user,
      ),
      GeneralBasketScreen(
        user: widget.user,
      ),
    ];
  }

  @override
  Widget build(BuildContext context) {
    return _showSports();
  }
}
