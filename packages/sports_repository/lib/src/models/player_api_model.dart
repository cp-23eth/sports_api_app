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
    return PlayerApiModel(
      playerId: json['PlayerID'],
      status: json['Status'],
      teamId: json['TeamId'],
      team: json['Team'],
      jersey: json['Jersey'],
      position: json['Position'],
      firstName: json['FirstName'],
      lastName: json['LastName'],
      birthDate: /*DateTime.parse(json['birthDate'])*/ json['BirthDate'],
      birthCity: json['BirthCity'],
      birthCountry: json['BirthCountry'],
      height: json['Height'],
      weight: json['Weight'],
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
