import 'package:flutter/material.dart';
import 'package:storybook_flutter/storybook_flutter.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    // Game game = Game(
    //   dateTime: '2024-10-22T19:30:00',
    //   homeTeam: 'BOS',
    //   awayTeam: 'NY',
    //   homeTeamScore: 156,
    //   awayTeamScore: 129,
    //   season: 2025,
    //   stadiumId: 1,
    //   status: 'Final',
    //   refereeId: 1,
    //   gameId: 1,
    //   isClosed: true,
    //   awayTeamId: 1,
    //   homeTeamId: 2,
    //   dateTimeUtc: '2024-10-22T23:30:00',
    // );

    // List<Team> teams = [
    //   Team(
    //     teamId: 1,
    //     active: true,
    //     key: 'WAS',
    //     city: 'Washington',
    //     name: 'Wizards',
    //     headCoach: 'Brian Keefe',
    //     logo: 'ATL.svg',
    //     primaryColor: 'E03A3E',
    //     secondaryColor: '002B5C',
    //     tertiaryColor: 'C4CED4',
    //   ),
    //   Team(
    //     teamId: 2,
    //     active: true,
    //     key: 'CHA',
    //     city: 'Charlotte',
    //     name: 'Hornets',
    //     headCoach: 'Charles Lee',
    //     logo: 'BKN.svg',
    //     primaryColor: '00788C',
    //     secondaryColor: '1D1160',
    //     tertiaryColor: 'A1A1A4',
    //   ),
    // ];

    // List<Stadium> stadiums = [
    //   Stadium(
    //     stadiumId: 1,
    //     active: true,
    //     name: 'Capital One Arena',
    //     address: '601 F St. N.W.',
    //     city: 'Washington',
    //     state: 'DC',
    //     zip: '20004',
    //     country: 'USA',
    //     capacity: 20290,
    //     latitude: 38.898056,
    //     longitude: -77.020833,
    //   )
    // ];

    // bool finish = false;

    // if (game.status == 'Final') {
    //   finish = true;
    // } else {
    //   finish = false;
    // }
    return Storybook(
      initialStory: 'Widget/favorite_team_list_setting',
      stories: [
        //   Story(
        //     name: 'Widget/List/Home',
        //     builder: (context) => HomeMatchList(
        //       game: game,
        //       finish: finish,
        //       teams: teams,
        //       stadiums: stadiums,
        //     ),
        //   ),
        //   Story(
        //     name: 'Widget/List/Calender',
        //     builder: (context) => CalenderMatchList(
        //       game: game,
        //       teams: teams,
        //       stadiums: stadiums,
        //     ),
        //   ),
        //   Story(
        //     name: 'Widget/List/Team',
        //     builder: (context) => const TeamList(
        //       team: Team(
        //         teamId: 2,
        //         active: true,
        //         key: 'CHA',
        //         city: 'Charlotte',
        //         name: 'Hornets',
        //         headCoach: 'Charles Lee',
        //         logo:
        //             'https://upload.wikimedia.org/wikipedia/en/c/c4/Charlotte_Hornets_%282014%29.svg',
        //         primaryColor: '00788C',
        //         secondaryColor: '1D1160',
        //         tertiaryColor: 'A1A1A4',
        //       ),
        //       stadium: [
        //         Stadium(
        //           stadiumId: 1,
        //           active: true,
        //           name: 'Capital One Arena',
        //           address: '601 F St. N.W.',
        //           city: 'Washington',
        //           state: 'DC',
        //           zip: '20004',
        //           country: 'USA',
        //           capacity: 20290,
        //           latitude: 38.898056,
        //           longitude: -77.020833,
        //         )
        //       ],
        //       players: [
        //         Player(
        //           playerId: 1,
        //           status: 'Active',
        //           teamId: 1,
        //           team: 'PHO',
        //           jersey: 3,
        //           position: 'SG',
        //           firstName: 'Bradley',
        //           lastName: 'Beal',
        //           birthDate: '1993-06-28T00:00:00',
        //           birthCity: 'St. Louis',
        //           birthCountry: 'USA',
        //           height: 76,
        //           weight: 207,
        //         )
        //       ],
        //     ),
        //   ),
        //   Story(
        //     name: 'Widget/Header',
        //     builder: (context) => const Header(),
        //   ),
        //   Story(
        //     name: 'Widget/Element/Secondary Title',
        //     builder: (context) => const SecondaryTitle(text: 'Secondary Title'),
        //   ),
        //   Story(
        //     name: 'Widget/Element/Primary Title',
        //     builder: (context) => const PrimaryTitle(text: 'Primary Title'),
        //   ),
        //   Story(
        //     name: 'Widget/List/Player',
        //     builder: (context) => const PlayerList(
        //       player: Player(
        //         playerId: 1,
        //         status: 'Active',
        //         teamId: 1,
        //         team: 'PHO',
        //         jersey: 3,
        //         position: 'SG',
        //         firstName: 'Bradley',
        //         lastName: 'Beal',
        //         birthDate: '1993-06-28T00:00:00',
        //         birthCity: 'St. Louis',
        //         birthCountry: 'USA',
        //         height: 76,
        //         weight: 207,
        //       ),
        //     ),
        //   ),
        //   Story(
        //     name: 'Widget/Element/Player Information',
        //     builder: (context) {
        //       return PlayerInfo(
        //         player: Player(
        //           playerId: 1,
        //           status: 'Active',
        //           teamId: 1,
        //           team: 'PHO',
        //           jersey: 3,
        //           position: 'SG',
        //           firstName: 'Bradley',
        //           lastName: 'Beal',
        //           birthDate: '1993-06-28T00:00:00',
        //           birthCity: 'St. Louis',
        //           birthCountry: 'USA',
        //           height: 76,
        //           weight: 207,
        //         ),
        //       );
        //     },
        //   ),
        //   Story(
        //     name: 'Widget/Element/Player Title',
        //     builder: (context) => const PlayerTitle(
        //       player: Player(
        //         playerId: 1,
        //         status: 'Active',
        //         teamId: 1,
        //         team: 'PHO',
        //         jersey: 3,
        //         position: 'SG',
        //         firstName: 'Bradley',
        //         lastName: 'Beal',
        //         birthDate: '1993-06-28T00:00:00',
        //         birthCity: 'St. Louis',
        //         birthCountry: 'USA',
        //         height: 76,
        //         weight: 207,
        //       ),
        //     ),
        //   ),
        //   Story(
        //       name: 'Widget/Element/Detail Match',
        //       builder: (context) =>
        //           DetailMatch(game: game, teams: teams, stadiums: stadiums))
        // ],
        // Story(
        //   name: 'Widget/favorite_team_list_setting',
        //   builder: (context) => FavoriteTeamListSettings(
        //     teamList: [
        //       Team(teamId: 1, active: true, key: 'WAS', city: 'Washington', name: 'Wizards', headCoach: 'Brian Keefe', logo: "WAS.svg", primaryColor: "002B5C", secondaryColor: 	"E31837", tertiaryColor: 	"C4CED4"),
        //       Team(teamId: 2, active: true, key: 'CHA', city: 'Charlotte', name: 'Hornets', headCoach: 'Charles Lee', logo: "CHA.svg", primaryColor: 	"00788C", secondaryColor: 	"1D1160", tertiaryColor: 	"A1A1A4")
        //     ],
        //   ),
        // ),
      ],
    );
  }
}
