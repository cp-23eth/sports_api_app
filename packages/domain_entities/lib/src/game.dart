import 'package:equatable/equatable.dart';

class Game extends Equatable {
  const Game({
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

  @override
  List<Object?> get props => [
        gameId,
        season,
        status,
        isClosed,
        dateTime,
        dateTimeUtc,
        awayTeam,
        awayTeamId,
        homeTeam,
        homeTeamId,
        awayTeamScore,
        homeTeamScore,
        stadiumId,
        refereeId
      ];

  @override
  bool? get stringify => true;
}
