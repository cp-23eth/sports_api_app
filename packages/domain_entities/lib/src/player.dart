import 'package:equatable/equatable.dart';

class Player extends Equatable {
  const Player({
    required this.playerId,
    required this.status,
    required this.teamId,
    required this.team,
    required this.jersey,
    required this.position,
    required this.firstName,
    required this.lastName,
    required this.birthDate,
    required this.birthCity,
    required this.birthCountry,
    required this.height,
    required this.weight,
  });

  final int playerId;
  final String status;
  final int teamId;
  final String team;
  final int jersey;
  final String position;
  final String firstName;
  final String lastName;
  final String birthDate;
  final String birthCity;
  final String birthCountry;
  final int height;
  final int weight;

  @override
  List<Object?> get props => [
        playerId,
        status,
        teamId,
        team,
        jersey,
        position,
        firstName,
        lastName,
        birthDate,
        birthCity,
        birthCountry,
        height,
        weight,
      ];

  @override
  bool? get stringify => true;
}
