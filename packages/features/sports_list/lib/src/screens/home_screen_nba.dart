import 'package:flutter/material.dart';
import 'package:sports_list/sports_list.dart';
import 'package:component_library/component_library.dart';

class HomeScreenNba extends StatefulWidget {
  const HomeScreenNba({super.key});

  @override
  _HomeScreenNbaState createState() => _HomeScreenNbaState();
}

class _HomeScreenNbaState extends State<HomeScreenNba> {
  int _selectedIndex = 1;

  @override
  void initState() {
    super.initState();
    if (context.read<SportsListProvider>().state.stadiums.isEmpty) {
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

    if (state.status == SportsListStatus.loading) {
      return const Center(child: CircularProgressIndicator());
    }

    if (state.games.isEmpty) {
      return const Center(child: Text('No games available'));
    }

    return Scaffold(
      backgroundColor: const Color(0xFF0B132B),
      bottomNavigationBar: Theme(
        data: Theme.of(context).copyWith(
          splashFactory: NoSplash.splashFactory,
        ),
        child: BottomNavigationBar(
          backgroundColor: const Color(0xFF0B132B),
          items: const <BottomNavigationBarItem>[
            BottomNavigationBarItem(
              icon: Icon(Icons.calendar_month),
              label: '',
              backgroundColor: Color(0xFF1C5D99),
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.home),
              label: '',
              backgroundColor: Color(0xFF1C5D99),
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.group),
              label: '',
              backgroundColor: Color(0xFF1C5D99),
            ),
          ],
          currentIndex: _selectedIndex,
          selectedItemColor: Colors.white,
          unselectedItemColor: Colors.white,
          selectedIconTheme: const IconThemeData(size: 36),
          unselectedIconTheme: const IconThemeData(size: 24),
          onTap: _onItemTapped,
          enableFeedback: false,
        ),
      ),
      body: _widgetOptions(state)[_selectedIndex],
    );
  }

  List<Widget> _widgetOptions(SportsListState state) => [
        Column(
          mainAxisAlignment: MainAxisAlignment.start,
          mainAxisSize: MainAxisSize.max,
          children: [
            const Header(),
            Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              mainAxisSize: MainAxisSize.min,
              children: [
                const SecondaryTitle(text: 'Demain'),
                CalenderMatchList(game: state.games[1200]),
                CalenderMatchList(game: state.games[1201]),
                CalenderMatchList(game: state.games[1202]),
                const SecondaryTitle(text: 'Aujourd\'hui'),
                CalenderMatchList(game: state.games[821]),
                const SecondaryTitle(text: 'Hier'),
                CalenderMatchList(game: state.games[2]),
              ],
            )
          ],
        ),
        Column(
          mainAxisAlignment: MainAxisAlignment.start,
          mainAxisSize: MainAxisSize.max,
          children: [
            const Header(),
            Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              mainAxisSize: MainAxisSize.min,
              children: [
                const SecondaryTitle(text: 'Prochainement'),
                HomeMatchList(finish: false, game: state.games[0]),
                const SecondaryTitle(text: 'Résultat'),
                HomeMatchList(finish: true, game: state.games[1]),
              ],
            )
          ],
        ),
        const Text(
          'Index 2: School',
        ),
      ];

  @override
  Widget build(BuildContext context) {
    return _showSports();
  }
}
