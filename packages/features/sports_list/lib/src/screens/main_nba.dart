import 'package:flutter/material.dart';
import 'package:sports_list/sports_list.dart';

class MainNba extends StatefulWidget {
  const MainNba({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _MainNbaState createState() => _MainNbaState();
}

class _MainNbaState extends State<MainNba> {
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
      return const Center(child: CircularProgressIndicator());
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
      CalendarScreen(
        user: state.user,
        stateTeams: state.teams,
        stateStadiums: state.stadiums,
        stateGames: state.games,
      ),
      const HomeScreen(),
      HomeScreenTeams(
        user: state.user,
      ),
      GeneralBasketScreen(
        user: state.user,
      ),
    ];
  }

  @override
  Widget build(BuildContext context) {
    return _showSports();
  }
}
