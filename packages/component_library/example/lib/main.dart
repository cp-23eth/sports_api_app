import 'package:component_library/component_library.dart';
import 'package:domain_entities/domain_entities.dart';
import 'package:flutter/material.dart';
import 'package:storybook_flutter/storybook_flutter.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    final teams = [
      Team(
          teamId: 1,
          name: 'Celtics',
          logo: 'logo1',
          active: true,
          city: 'Boston',
          headCoach: 'Stephan Curry',
          primaryColor: '0xFFFFFFFF',
          secondaryColor: '0xFF564567',
          tertiaryColor: '0xFF123456',
          key: 'BOS'),
      Team(
          teamId: 2,
          name: 'Lakers',
          logo: 'logo2',
          active: true,
          city: 'Los Angeles',
          headCoach: 'Lebron James',
          primaryColor: '0xFFFFFFFF',
          secondaryColor: '0xFF564567',
          tertiaryColor: '0xFF123456',
          key: 'LAL'),
    ];

    // final game = Game(
    //     gameId: 1,
    //     season: 2025,
    //     status: 'finished',
    //     isClosed: true,
    //     dateTime: DateTime.now().toString(),
    //     dateTimeUtc: DateTime.now().toString(),
    //     awayTeam: 'BOS',
    //     awayTeamId: 3,
    //     homeTeam: 'CHI',
    //     homeTeamId: 5,
    //     awayTeamScore: 145,
    //     homeTeamScore: 120,
    //     stadiumId: 23,
    //     refereeId: 1);

    // final stadiums = [
    //   Stadium(
    //       stadiumId: 1,
    //       name: 'Staples Center',
    //       city: 'Los Angeles',
    //       capacity: 20000,
    //       active: true,
    //       address: 'rue des oliviers 5',
    //       country: 'USA',
    //       latitude: 45.25,
    //       longitude: 45.26,
    //       state: 'Maine',
    //       zip: '25632'),
    //   Stadium(
    //       stadiumId: 2,
    //       name: 'TD Garden',
    //       city: 'Boston',
    //       capacity: 20000,
    //       active: true,
    //       address: 'rue des oliviers 5',
    //       country: 'USA',
    //       latitude: 45.25,
    //       longitude: 45.26,
    //       state: 'Maine',
    //       zip: '25632'),
    // ];

    User user = User(
        username: 'niry',
        favoriteTeams: [15, 12],
        appColorTeam: '0xFF454534',
        homeScreenDesign: 'Carrousel',
        teamScreenDesign: 'List');

    Player player = Player(
        playerId: 1,
        status: 'active',
        teamId: 1,
        team: 'BOS',
        jersey: 45,
        position: 'PG',
        firstName: 'COR',
        lastName: 'RIN',
        birthDate: '2000-10-02',
        birthCity: 'St-Louis',
        birthCountry: 'USA',
        height: 180,
        weight: 85);

    return Storybook(
      stories: [
        Story(
          name: 'Widget/BasketBallHistory',
          description:
              'Affiche l\'histoire du basket-ball avec le bouton vers wikipédia',
          builder: (context) => BasketballHistory(),
        ),
        Story(
          name: 'Widget/ButtonColorPicker',
          description: 'Button qui permet de choisir une couleur',
          builder: (context) => ButtonColorPicker(
            changeColor: (Color color) {},
            keyColor: Colors.blue,
            pickerColor: Colors.red,
          ),
        ),
        Story(
          name: 'Widget/CalendartButtonSort',
          description:
              'Affiche les boutons qui permet de trier les matchs dans le calendrier',
          builder: (context) => CalendarButtonSort(
            search: (String text) {},
            state: (String text) {},
          ),
        ),
        Story(
          name: 'Widget/FavoriteTeamListSettings',
          description: 'Affiche les équipes favorties',
          builder: (context) => FavoriteTeamListSettings(
            changeApplicationColor: (Team team) {},
            removeApplicationColor: () {},
            teamList: teams,
          ),
        ),
        Story(
          name: 'Widget/header',
          description: 'Affiche l\'header',
          builder: (context) => Header(
            teams: teams,
            user: user,
          ),
        ),
        Story(
          name: 'Widget/Paragraphe',
          description: 'Affiche un paragraphe',
          builder: (context) => Paragraphe(
            text: 'Salut',
          ),
        ),
        Story(
          name: 'Widget/PlayerInfo',
          description: 'Affiche les infos du joueur',
          builder: (context) => PlayerInfo(color: Colors.white, player: player),
        ),
        Story(
          name: 'Widget/PlayerListCircleAvatar',
          description:
              'Affiche l\'image du joueur',
          builder: (context) => PlayerListCircleAvatar(
            color: Colors.white,
            player: player,
            user: user,
          ),
        ),
        Story(
          name: 'Widget/playerList',
          description:
              'Affiche un élément de la liste de joueur',
          builder: (context) => PlayerList(
            color: Colors.white,
            player: player,
            user: user,
            onFavoriteToggle: () {},
          ),
        ),
      ],
    );
  }
}
