import 'package:component_library/component_library.dart';
import 'package:domain_entities/domain_entities.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:loading_indicator/loading_indicator.dart';
import 'package:sports_list/sports_list.dart';

class CalenderLoad extends StatefulWidget {
  const CalenderLoad(
      {required this.user,
      required this.teams,
      required this.stadiums,
      required this.games,
      super.key});

  final User user;
  final List<Team> teams;
  final List<Stadium> stadiums;
  final List<Game> games;

  @override
  State<CalenderLoad> createState() => _CalenderLoadState();
}

class _CalenderLoadState extends State<CalenderLoad> {
  late Future<Map<String, List<Game>>> _loadDataFuture;
  Map<String, List<Game>>? _cachedGroupedGames;

  @override
  void initState() {
    super.initState();
    _loadDataFuture = _loadData();
  }

  Future<Map<String, List<Game>>> _loadData() async {
    await Future.delayed(const Duration(seconds: 1));

    if (_cachedGroupedGames != null) {
      return _cachedGroupedGames!;
    }

    final allGames = widget.games.reversed.toList();
    final games =
        allGames.where((game) => game.dateTime != '0000-00-00').toList();

    final groupedGames = <String, List<Game>>{};
    for (var game in games) {
      final date =
          DateFormat('yyyy-MM-dd').format(DateTime.parse(game.dateTimeUtc));
      groupedGames.putIfAbsent(date, () => []).add(game);
    }

    _cachedGroupedGames = groupedGames;

    return groupedGames;
  }

  @override
  Widget build(BuildContext context) {
    final List<Color> kDefaultRainbowColors = [
      Parameter.headerFooterColor,
    ];
    return FutureBuilder<Map<String, List<Game>>>(
      future: _loadDataFuture,
      builder: (ctx, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return Center(
            child: SizedBox(
              height: 300,
              width: 300,
              child: LoadingIndicator(
                indicatorType: Indicator.ballClipRotateMultiple,
                colors: kDefaultRainbowColors,
              ),
            ),
          );
        } else if (snapshot.connectionState == ConnectionState.done) {
          if (snapshot.hasError) {
            return const Center(
              child: Text('An error occurred!'),
            );
          }

          final groupedGames = snapshot.data!;
          return CalendarScreenLoaded(
            user: widget.user,
            stateTeams: widget.teams,
            stateStadiums: widget.stadiums,
            groupedGames: groupedGames,
          );
        } else {
          return const Center(
            child: Text('An error occurred!'),
          );
        }
      },
    );
  }
}

class CalendarScreenLoaded extends StatefulWidget {
  const CalendarScreenLoaded(
      {required this.user,
      required this.stateTeams,
      required this.stateStadiums,
      required this.groupedGames,
      super.key});

  final User user;
  final List<Team> stateTeams;
  final List<Stadium> stateStadiums;
  final Map<String, List<Game>> groupedGames;

  @override
  State<CalendarScreenLoaded> createState() => _CalendarScreenLoadedState();
}

class _CalendarScreenLoadedState extends State<CalendarScreenLoaded> {
  late String _currentState;
  late List<Game> _filteredGames;
  late ScrollController _scrollController;
  late List<Game> _allGames;
  late bool searchBool;
  late String word;

  @override
  void initState() {
    super.initState();
    _currentState = '';
    searchBool = false;
    word = '';
    _allGames = widget.groupedGames.values.expand((games) => games).toList();
    _allGames.sort((a, b) => a.dateTimeUtc.compareTo(b.dateTimeUtc));
    _filteredGames =
        widget.groupedGames.values.expand((games) => games).toList();
    _scrollController =
        ScrollController(initialScrollOffset: _calculateInitialScrollOffset());
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  void _updateState(String state) {
    setState(() {
      _currentState = state;
      _filteredGames = _filterGames(state);
    });

    if (_filteredGames.isNotEmpty) {
      WidgetsBinding.instance.addPostFrameCallback((_) {
        _scrollController.jumpTo(_calculateInitialScrollOffset());
      });
    }
  }

  void _updateSearch(String search) {
    if (search == 'Search') {
      setState(() {
        searchBool = !searchBool;
      });
    }
  }

  void _updateWord(String word) {
    if (word != '') {
      setState(() {
        _filteredGames = _allGames
            .where((game) =>
                game.homeTeam.contains(word) || game.awayTeam.contains(word))
            .toList();
      });
    } else {
      setState(() {
        _filteredGames = _allGames;
      });
    }
  }

  double _calculateInitialScrollOffset() {
    double initialIndex = 0;
    for (Game game in _filteredGames) {
      initialIndex += 62.3;
    }
    return initialIndex;
  }

  List<Game> _filterGames(String state) {
    if (state.isEmpty) return _allGames;

    final beginRegu = DateTime.parse('2024-10-22');
    final endRegu = DateTime.parse('2025-04-14');

    return _allGames.where((game) {
      final date = DateTime.parse(game.dateTimeUtc);
      switch (state) {
        case 'Pre':
          return date.isBefore(beginRegu);
        case 'Regu':
          return date.isAfter(beginRegu) && date.isBefore(endRegu);
        case 'Post':
          return date.isAfter(endRegu);
        default:
          return true;
      }
    }).toList();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      mainAxisSize: MainAxisSize.max,
      children: [
        Header(
          user: widget.user,
          teams: widget.stateTeams,
        ),
        if (searchBool == true)
          SearchBarCalendar(
            word: (word) => _updateWord(word),
          ),
        CalendarButtonSort(
          state: (state) => _updateState(state),
          search: (search) => _updateSearch(search),
        ),
        Expanded(
          child: _filteredGames.isEmpty
              ? const Center(child: Text('No games found'))
              : ListView.builder(
                  controller: _scrollController,
                  itemCount: _filteredGames.length,
                  itemBuilder: (context, index) {
                    final game = _filteredGames[index];
                    final gameDate = DateTime.parse(game.dateTimeUtc);
                    final formattedDate =
                        DateFormat('dd MMM yyyy').format(gameDate);

                    final bool isFirstGameOfDate = index == 0 ||
                        DateTime.parse(_filteredGames[index - 1].dateTimeUtc)
                                .add(const Duration(hours: 1))
                                .day !=
                            gameDate.day;

                    return Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        if (isFirstGameOfDate)
                          SecondaryTitle(text: formattedDate),
                        CalenderMatchList(
                          teams: widget.stateTeams,
                          game: game,
                          stadiums: widget.stateStadiums,
                        ),
                      ],
                    );
                  },
                ),
        ),
      ],
    );
  }
}
