class GameApiModel {
  const GameApiModel({
    required this.gameId,
    required this.season,
    required this.status,
    required this.isClosed,
    required this.dateTime,
    required this.dateTimeUtc,
    required this.awayTeam,
    required this.awayTeamId,
    required this.homeTeam,
    required this.homeTeamId,
    required this.awayTeamScore,
    required this.homeTeamScore,
    required this.stadiumId,
    required this.refereeId,
  });

  factory GameApiModel.fromJson(Map<String, dynamic> json) {
    final gameId = json['GameID'];
    if (gameId == null) {
      throw ArgumentError('gameId is required');
    }

    final season = json['Season'];
    if (season == null) {
      throw ArgumentError('season is required');
    }

    final status = json['Status'];
    if (status == null) {
      throw ArgumentError('status is required');
    }

    final isClosed = json['IsClosed'];
    if (isClosed == null) {
      throw ArgumentError('isClosed is required');
    }

    var dateTime = json['DateTime'];
    dateTime ??= '0000-00-00';

    var dateTimeUtc = json['DateTimeUTC'];
    dateTimeUtc ??= '0000-00-00';

    final awayTeam = json['AwayTeam'];
    if (awayTeam == null) {
      throw ArgumentError('awayTeam is required');
    }

    final awayTeamId = json['AwayTeamID'];
    if (awayTeamId == null) {
      throw ArgumentError('awayTeamId is required');
    }

    final homeTeam = json['HomeTeam'];
    if (homeTeam == null) {
      throw ArgumentError('homeTeam is required');
    }

    final homeTeamId = json['HomeTeamID'];
    if (homeTeamId == null) {
      throw ArgumentError('homeTeamId is required');
    }

    var awayTeamScore = json['AwayTeamScore'];
    awayTeamScore ??= 0;

    var homeTeamScore = json['HomeTeamScore'];
    homeTeamScore ??= 0;

    var stadiumId = json['StadiumID'];
    stadiumId ??= 0;

    var refereeId = json['RefereeID'];
    refereeId ??= 0;

    return GameApiModel(
      gameId: gameId,
      season: season,
      status: status,
      isClosed: isClosed,
      dateTime: dateTime,
      dateTimeUtc: dateTimeUtc,
      awayTeam: awayTeam,
      awayTeamId: awayTeamId,
      homeTeam: homeTeam,
      homeTeamId: homeTeamId,
      awayTeamScore: awayTeamScore,
      homeTeamScore: homeTeamScore,
      stadiumId: stadiumId,
      refereeId: refereeId,
    );
  }

  final int gameId;
  final int season;
  final String status;
  final bool isClosed;
  final String dateTime;
  final String dateTimeUtc;
  final String awayTeam;
  final int awayTeamId;
  final String homeTeam;
  final int homeTeamId;
  final int awayTeamScore;
  final int homeTeamScore;
  final int stadiumId;
  final int refereeId;
}
