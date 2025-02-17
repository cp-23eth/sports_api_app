import 'package:flutter/material.dart';
import 'package:sports_list/sports_list.dart';
import 'package:component_library/component_library.dart';

class HomeScreenNba extends StatefulWidget {
  const HomeScreenNba({super.key});

  @override
  _HomeScreenNbaState createState() => _HomeScreenNbaState();
}

class _HomeScreenNbaState extends State<HomeScreenNba> {
  // Pour gérer l'état des sections ouvertes/fermées
  Map<String, bool> sectionsVisibility = {
    'EAST': false,
    'WEST': false,
    'Atlantic': false,
    'Central': false,
    'South East': false,
    'North West': false,
    'Pacific': false,
    'South West': false,
  };

  void toggleSection(String section) {
    setState(() {
      sectionsVisibility[section] = !sectionsVisibility[section]!;
    });
  }

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
    state.games.sort((a, b) =>
        DateTime.parse(b.dateTime).compareTo(DateTime.parse(a.dateTime)));

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
          backgroundColor: const Color(0xFF1C5D99),
          items: const <BottomNavigationBarItem>[
            BottomNavigationBarItem(
              icon: SizedBox(
                height: 15,
                child: Center(
                  child: Icon(Icons.calendar_month),
                ),
              ),
              label: '',
              backgroundColor: Color(0xFF1C5D99),
            ),
            BottomNavigationBarItem(
              icon: SizedBox(
                height: 15,
                child: Center(
                  child: Icon(Icons.home),
                ),
              ),
              label: '',
              backgroundColor: Color(0xFF1C5D99),
            ),
            BottomNavigationBarItem(
              icon: SizedBox(
                height: 15,
                child: Center(
                  child: Icon(Icons.group),
                ),
              ),
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

  List<Widget> _widgetOptions(SportsListState state) {
    return [
      Column(
        mainAxisAlignment: MainAxisAlignment.start,
        mainAxisSize: MainAxisSize.max,
        children: [
          const Header(),
          Expanded(
            child: ListView(
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
            ),
          ),
        ],
      ),
      Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        mainAxisSize: MainAxisSize.min,
        children: [
          const Header(),
          Expanded(
            child: ListView.separated(
              separatorBuilder: (context, index) => const SizedBox(
                height: 5,
              ),
              itemCount: 6,
              itemBuilder: (context, index) {
                final date = DateTime.now();
                final comingGames = state.games
                    .where(
                        (game) => DateTime.parse(game.dateTime).isAfter(date))
                    .toList();
                final finishGames = state.games
                    .where(
                        (game) => DateTime.parse(game.dateTime).isBefore(date))
                    .toList();
                comingGames.sort((a, b) => DateTime.parse(a.dateTime)
                    .compareTo(DateTime.parse(b.dateTime)));

                if (index == 0) {
                  return HomeMatchList(
                    teams: state.teams,
                    game: comingGames[2],
                    finish: false,
                  );
                } else if (index == 1) {
                  return HomeMatchList(
                    teams: state.teams,
                    game: comingGames[1],
                    finish: false,
                  );
                } else if (index == 2) {
                  return HomeMatchList(
                    teams: state.teams,
                    game: comingGames[0],
                    finish: false,
                  );
                } else if (index > 2 && index < 6) {
                  return HomeMatchList(
                    teams: state.teams,
                    game: finishGames[index - 3],
                    finish: true,
                  );
                }
              },
            ),
          ),
        ],
      ),
      Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.max,
        children: [
          const Header(),
          Expanded(
            child: ListView(
              children: [
                const SizedBox(height: 10),
                buildSection('EAST', [
                  buildSubSection('Atlantic', 5, 9),
                  buildSubSection('Central', 10, 14),
                  buildSubSection('South East', 0, 4),
                ]),
                const SizedBox(height: 40),
                buildSection('WEST', [
                  buildSubSection('North West', 15, 19),
                  buildSubSection('Pacific', 25, 29),
                  buildSubSection('South West', 20, 24),
                ]),
              ],
            ),
          ),
        ],
      ),
    ];
  }

  Widget buildSection(String title, List<Widget> subSections) {
    return Column(
      children: [
        GestureDetector(
          onTap: () => toggleSection(title),
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              title,
              style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
          ),
        ),
        if (sectionsVisibility[title]!)
          Column(
            children: subSections,
          ),
      ],
    );
  }

  Widget buildSubSection(String subTitle, int startIndex, int endIndex) {
    return Column(
      children: [
        GestureDetector(
          onTap: () => toggleSection(subTitle),
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              subTitle,
              style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
          ),
        ),
        if (sectionsVisibility[subTitle]!)
          Column(
            children: List.generate(endIndex - startIndex + 1, (index) {
              return TeamList(
                  team: context
                      .read<SportsListProvider>()
                      .state
                      .teams[startIndex + index]);
            }),
          ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return _showSports();
  }
}
