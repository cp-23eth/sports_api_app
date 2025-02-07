class PlayerApiModel {
  const PlayerApiModel({
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

  factory PlayerApiModel.fromJson(Map<String, dynamic> json) {
    final playerId = json['PlayerID'];
    if (playerId == null) {
      throw ArgumentError('playerId is required');
    }

    final status = json['Status'];
    if (status == null) {
      throw ArgumentError('status is required');
    }

    final teamId = json['TeamId'];
    if (teamId == null) {
      throw ArgumentError('teamId is required');
    }

    final team = json['Team'];
    if (team == null) {
      throw ArgumentError('team is required');
    }

    final jersey = json['Jersey'];
    if (jersey == null) {
      throw ArgumentError('jersey is required');
    }

    final position = json['Position'];
    if (position == null) {
      throw ArgumentError('position is required');
    }

    final firstName = json['FirstName'];
    if (firstName == null) {
      throw ArgumentError('firstName is required');
    }

    final lastName = json['LastName'];
    if (lastName == null) {
      throw ArgumentError('lastName is required');
    }

    final birthDate = json['BirthDate'];
    if (birthDate == null) {
      throw ArgumentError('birthDate is required');
    }

    final birthCity = json['BirthCity'];
    if (birthCity == null) {
      throw ArgumentError('birthCity is required');
    }

    final birthCountry = json['BirthCountry'];
    if (birthCountry == null) {
      throw ArgumentError('birthCountry is required');
    }

    final height = json['Height'];
    if (height == null) {
      throw ArgumentError('height is required');
    }

    final weight = json['Weight'];
    if (weight == null) {
      throw ArgumentError('weight is required');
    }

    return PlayerApiModel(
      playerId: playerId,
      status: status,
      teamId: teamId,
      team: team,
      jersey: jersey,
      position: position,
      firstName: firstName,
      lastName: lastName,
      birthDate: birthDate,
      birthCity: birthCity,
      birthCountry: birthCountry,
      height: height,
      weight: weight,
    );
  }

  final int playerId;
  final bool status;
  final int teamId;
  final String team;
  final int jersey;
  final String position;
  final String firstName;
  final String lastName;
  final String birthDate;
  final String birthCity;
  final String birthCountry;
  final String height;
  final String weight;
}
