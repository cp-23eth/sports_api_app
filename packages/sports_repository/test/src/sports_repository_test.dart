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

  const urlTeam =
      'https://api.sportsdata.io/v3/nba/scores/json/teams/2025?key=baec8b74561642bb974d3b5bc0091f65';
  const urlStadium =
      'https://api.sportsdata.io/v3/nba/scores/json/Stadiums?key=baec8b74561642bb974d3b5bc0091f65';
  const urlPlayer =
      'https://api.sportsdata.io/v3/nba/scores/json/Players/2025?key=baec8b74561642bb974d3b5bc0091f65';
  const urlGame =
      'https://api.sportsdata.io/v3/nba/scores/json/Games/2025?key=baec8b74561642bb974d3b5bc0091f65';

  setUp(() {
    sportsRepository = SportsRepository(
      storageGame: GameRemoteStorage(client: mockClient),
      storagePlayer: PlayerRemoteStorage(client: mockClient),
      storageStadium: StadiumRemoteStorage(client: mockClient),
      storageTeam: TeamRemoteStorage(client: mockClient),
    );
  });

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
}
