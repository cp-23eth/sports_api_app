import 'package:flutter/material.dart';
import 'package:sports_list/sports_list.dart';
import 'package:component_library/component_library.dart';
import 'package:google_fonts/google_fonts.dart';

class HomeScreenNba extends StatefulWidget {
  const HomeScreenNba({super.key});

  @override
  // ignore: library_private_types_in_public_api
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
                buildSection('EAST', [
                  buildSubSection('Atlantic', 5, 9, state),
                  buildSubSection('Central', 10, 14, state),
                  buildSubSection('South East', 0, 4, state),
                ]),
                buildSection('WEST', [
                  buildSubSection('North West', 15, 19, state),
                  buildSubSection('Pacific', 25, 29, state),
                  buildSubSection('South West', 20, 24, state),
                ]),
              ],
            ),
          ),
        ],
      ),
    ];
  }

  Widget buildSection(String title, List<Widget> subSections) {
    return ExpansionTile(
      title: Text(
        title,
        style: TextStyle(
          fontSize: 24,
          fontWeight: FontWeight.bold,
          color: Colors.white,
          fontFamily: GoogleFonts.poppins().fontFamily,
        ),
      ),
      children: subSections,
    );
  }

  Widget buildSubSection(
      String subTitle, int startIndex, int endIndex, SportsListState state) {
    return Padding(
      padding: const EdgeInsets.only(left: 8.0),
      child: ExpansionTile(
        title: Text(
          subTitle,
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold,
            color: Colors.white,
            fontFamily: GoogleFonts.poppins().fontFamily,
          ),
        ),
        children: List.generate(endIndex - startIndex + 1, (index) {
          return SizedBox(
            height: 90,
            child: TeamList(
              team: context
                  .read<SportsListProvider>()
                  .state
                  .teams[startIndex + index],
              players: state.players,
            ),
          );
        }),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return _showSports();
  }
}
