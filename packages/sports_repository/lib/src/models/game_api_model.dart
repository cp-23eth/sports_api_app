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
    this.awayTeamScore = 0,
    this.homeTeamScore = 0,
    this.stadiumId = 0,
    this.refereeId = 0,
  });

  factory GameApiModel.fromJson(Map<String, dynamic> json) {
    return GameApiModel(
      gameId: json['gameId'],
      season: json['season'],
      status: json['status'],
      isClosed: json['isClosed'],
      dateTime: /*DateTime.parse(json['dateTime'])*/ json['dateTime'],
      dateTimeUtc: /*DateTime.parse(json['dateTimeUtc'])*/ json['dateTimeUtc'],
      awayTeam: json['awayTeam'],
      awayTeamId: json['awayTeamId'],
      homeTeam: json['homeTeam'],
      homeTeamId: json['homeTeamId'],
      awayTeamScore: json['awayTeamScore'],
      homeTeamScore: json['homeTeamScore'],
      stadiumId: json['stadiumId'],
      refereeId: json['refereeId'],
    );
  }

  final int gameId;
  final int season;
  final String status;
  final bool isClosed;
  final DateTime dateTime;
  final DateTime dateTimeUtc;
  final String awayTeam;
  final int awayTeamId;
  final String homeTeam;
  final int homeTeamId;
  final int awayTeamScore;
  final int homeTeamScore;
  final int stadiumId;
  final int refereeId;
}
