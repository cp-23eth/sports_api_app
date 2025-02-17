import 'dart:math';

import 'package:domain_entities/domain_entities.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:http/http.dart' as http;
import 'package:mocktail/mocktail.dart';
import 'package:sports_repository/sports_repository.dart';

class MockClient extends Mock implements http.Client {}

void main() {
  late SportsRepository sportsRepository;

  final mockClient = MockClient();

  const urlGame =
      'https://api.sportsdata.io/v3/nba/scores/json/Games/2025?key=baec8b74561642bb974d3b5bc0091f65';
  const urlPlayer =
      'https://api.sportsdata.io/v3/nba/scores/json/PlayersActiveBasic?key=baec8b74561642bb974d3b5bc0091f65';
  const urlStadium =
      'https://api.sportsdata.io/v3/nba/scores/json/Stadiums?key=baec8b74561642bb974d3b5bc0091f65';
  const urlTeam =
      'https://api.sportsdata.io/v3/nba/scores/json/teams/2025?key=baec8b74561642bb974d3b5bc0091f65';

  setUp(() {
    sportsRepository = SportsRepository(
      storageGame: GameRemoteStorage(client: mockClient),
      storagePlayer: PlayerRemoteStorage(client: mockClient),
      storageStadium: StadiumRemoteStorage(client: mockClient),
      storageTeam: TeamRemoteStorage(client: mockClient),
    );
  });

  group('GameRemoteStorage', () {
    void preparerMockPourRepondreAGetAvec200EtDeuxGame() {
      const response =
          '[{"GameID":21022,"Season":2025,"Status":"Final","DateTime":"2024-10-22T19:30:00","AwayTeam":"NY","HomeTeam":"BOS","AwayTeamID":6,"HomeTeamID":9,"StadiumID":9,"AwayTeamScore":129,"HomeTeamScore":156,"IsClosed":true,"RefereeID":20000026,"DateTimeUTC":"2024-10-22T23:30:00"},{"GameID":21023,"Season":2025,"Status":"Final","DateTime":"2024-10-22T22:00:00","AwayTeam":"MIN","HomeTeam":"LAL","AwayTeamID":16,"HomeTeamID":27,"StadiumID":27,"AwayTeamScore":122,"HomeTeamScore":130,"IsClosed":true,"RefereeID":20000001,"DateTimeUTC":"2024-10-23T02:00:00"}]';

      when(() => mockClient.get(Uri.parse(urlGame)))
          .thenAnswer((_) async => http.Response(response, 200));
    }

    test('SportsRepository getAllGames retourne une liste de Game', () async {
      preparerMockPourRepondreAGetAvec200EtDeuxGame();
      final result = await sportsRepository.getAllGames();
      expect(result, isA<List<Game>>());
    });

    test('SportsRepository getAllGames retourne une liste de deux entités Game',
        () async {
      preparerMockPourRepondreAGetAvec200EtDeuxGame();
      final result = await sportsRepository.getAllGames();
      expect(result.length, 2);
    });

    const gamesRemote = [
      Game(
        gameId: 21022,
        season: 2025,
        status: 'Final',
        dateTime: '2024-10-22T19:30:00',
        awayTeam: 'NY',
        homeTeam: 'BOS',
        awayTeamId: 6,
        homeTeamId: 9,
        stadiumId: 9,
        awayTeamScore: 129,
        homeTeamScore: 156,
        isClosed: true,
        refereeId: 20000026,
        dateTimeUtc: '2024-10-22T23:30:00',
      ),
      Game(
        gameId: 21023,
        season: 2025,
        status: 'Final',
        dateTime: '2024-10-22T22:00:00',
        awayTeam: 'MIN',
        homeTeam: 'LAL',
        awayTeamId: 16,
        homeTeamId: 27,
        stadiumId: 27,
        awayTeamScore: 122,
        homeTeamScore: 130,
        isClosed: true,
        refereeId: 20000001,
        dateTimeUtc: '2024-10-23T02:00:00',
      )
    ];

    test(
        'SportsRepository getAllGames retourne une liste de deux entités Game avec les bonnes valeurs',
        () async {
      preparerMockPourRepondreAGetAvec200EtDeuxGame();
      final result = await sportsRepository.getAllGames();
      expect(result, gamesRemote);
    });
  });

  group('PlayerRemoteStorage', () {
    void preparerMockPourRepondreAGetAvec200EtDeuxPlayer() {
      const response =
          '[{"PlayerID":20000441,"Status":"Active","TeamID":29,"Team":"PHO","Jersey":3,"Position":"SG","FirstName":"Bradley","LastName":"Beal","BirthDate":"1993-06-28T00:00:00","BirthCity":"St. Louis","BirthCountry":"USA","Height":76,"Weight":207},{"PlayerID":20000452,"Status":"Active","TeamID":10,"Team":"TOR","Jersey":17,"Position":"SG","FirstName":"Garrett","LastName":"Temple","BirthDate":"1986-05-08T00:00:00","BirthCity":"Baton Rouge","BirthCountry":"USA","Height":77,"Weight":195}]';

      when(() => mockClient.get(Uri.parse(urlPlayer)))
          .thenAnswer((_) async => http.Response(response, 200));
    }

    test('SportsRepository getAllPlayers retourne une liste de Player',
        () async {
      preparerMockPourRepondreAGetAvec200EtDeuxPlayer();
      final result = await sportsRepository.getAllPlayers();
      expect(result, isA<List<Player>>());
    });

    test(
        'SportsRepository getAllPlayers retourne une liste de deux entités Player',
        () async {
      preparerMockPourRepondreAGetAvec200EtDeuxPlayer();
      final result = await sportsRepository.getAllPlayers();
      expect(result.length, 2);
    });

    const playersRemote = [
      Player(
        playerId: 20000441,
        status: 'Active',
        teamId: 29,
        team: 'PHO',
        jersey: 3,
        position: 'SG',
        firstName: 'Bradley',
        lastName: 'Beal',
        birthDate: '1993-06-28T00:00:00',
        birthCity: 'St. Louis',
        birthCountry: 'USA',
        height: 76,
        weight: 207,
      ),
      Player(
        playerId: 20000452,
        status: 'Active',
        teamId: 10,
        team: 'TOR',
        jersey: 17,
        position: 'SG',
        firstName: 'Garrett',
        lastName: 'Temple',
        birthDate: '1986-05-08T00:00:00',
        birthCity: 'Baton Rouge',
        birthCountry: 'USA',
        height: 77,
        weight: 195,
      )
    ];

    test(
        'SportsRepository getAllPlayers retourne une liste de deux entités Player avec les bonnes valeurs',
        () async {
      preparerMockPourRepondreAGetAvec200EtDeuxPlayer();
      final result = await sportsRepository.getAllPlayers();
      expect(result, playersRemote);
    });
  });

  group('StadiumRemoteStorage', () {
    void preparerMockPourRepondreAGetAvec200EtDeuxStadium() {
      const response =
          '[{"StadiumID":1,"Active":true,"Name":"Capital One Arena","Address":"601 F St. N.W.","City":"Washington","State":"DC","Zip":"20004","Country":"USA","Capacity":20290},{"StadiumID":2,"Active":true,"Name":"Spectrum Center","Address":"330 E. Trade St.","City":"Charlotte","State":"NC","Zip":"28202","Country":"USA","Capacity":19026}]';

      when(() => mockClient.get(Uri.parse(urlStadium)))
          .thenAnswer((_) async => http.Response(response, 200));
    }

    test('SportsRepository getAllStadiums retourne une liste de Stadium',
        () async {
      preparerMockPourRepondreAGetAvec200EtDeuxStadium();
      final result = await sportsRepository.getAllStadiums();
      expect(result, isA<List<Stadium>>());
    });

    test(
        'SportsRepository getAllStadiums retourne une liste de deux entités Stadium',
        () async {
      preparerMockPourRepondreAGetAvec200EtDeuxStadium();
      final result = await sportsRepository.getAllStadiums();
      expect(result.length, 2);
    });

    const stadiumsRemote = [
      Stadium(
        stadiumId: 1,
        active: true,
        name: 'Capital One Arena',
        address: '601 F St. N.W.',
        city: 'Washington',
        state: 'DC',
        zip: '20004',
        country: 'USA',
        capacity: 20290,
      ),
      Stadium(
        stadiumId: 2,
        active: true,
        name: 'Spectrum Center',
        address: '330 E. Trade St.',
        city: 'Charlotte',
        state: 'NC',
        zip: '28202',
        country: 'USA',
        capacity: 19026,
      )
    ];

    test(
        'SportsRepository getAllStadiums retourne une liste de deux entités Stadium avec les bonnes valeurs',
        () async {
      preparerMockPourRepondreAGetAvec200EtDeuxStadium();
      final result = await sportsRepository.getAllStadiums();
      expect(result, stadiumsRemote);
    });
  });

  group('TeamRemoteStorage', () {
    void preparerMockPourRepondreAGetAvec200EtDeuxTeam() {
      const response =
          '[{"TeamID":1,"Active":true,"Key":"WAS","City":"Washington","Name":"Wizards","HeadCoach":"Brian Keefe","WikipediaLogoUrl":"https://upload.wikimedia.org/wikipedia/en/0/02/Washington_Wizards_logo.svg"},{"TeamID":2,"Active":true,"Key":"CHA","City":"Charlotte","Name":"Hornets","HeadCoach":"Charles Lee","WikipediaLogoUrl":"https://upload.wikimedia.org/wikipedia/en/c/c4/Charlotte_Hornets_%282014%29.svg"}]';

      when(() => mockClient.get(Uri.parse(urlTeam)))
          .thenAnswer((_) async => http.Response(response, 200));
    }

    test('SportsRepository getAllTeams retourne une liste de Team', () async {
      preparerMockPourRepondreAGetAvec200EtDeuxTeam();
      final result = await sportsRepository.getAllTeams();
      expect(result, isA<List<Team>>());
    });

    test('SportsRepository getAllTeams retourne une liste de deux entités Team',
        () async {
      preparerMockPourRepondreAGetAvec200EtDeuxTeam();
      final result = await sportsRepository.getAllTeams();
      expect(result.length, 2);
    });

    const teamsRemote = [
      Team(
        teamId: 1,
        active: true,
        key: 'WAS',
        city: 'Washington',
        name: 'Wizards',
        headCoach: 'Brian Keefe',
        wikipediaLogoUrl:
            'https://upload.wikimedia.org/wikipedia/en/0/02/Washington_Wizards_logo.svg',
      ),
      Team(
        teamId: 2,
        active: true,
        key: 'CHA',
        city: 'Charlotte',
        name: 'Hornets',
        headCoach: 'Charles Lee',
        wikipediaLogoUrl:
            'https://upload.wikimedia.org/wikipedia/en/c/c4/Charlotte_Hornets_%282014%29.svg',
      )
    ];

    test(
        'SportsRepository getAllTeams retourne une liste de deux entités Team avec les bonnes valeurs',
        () async {
      preparerMockPourRepondreAGetAvec200EtDeuxTeam();
      final result = await sportsRepository.getAllTeams();
      expect(result, teamsRemote);
    });
  });
}
