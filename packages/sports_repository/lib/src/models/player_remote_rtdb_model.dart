class PlayerRemoteRtdbModel {
  const PlayerRemoteRtdbModel({
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

  factory PlayerRemoteRtdbModel.fromJson(Map<String, dynamic> json){
    return PlayerRemoteRtdbModel(
      playerId: json['playerId'],
      status: json['status'],
      teamId: json['teamId'],
      team: json['team'],
      jersey: json['jersey'],
      position: json['position'],
      firstName: json['firstName'],
      lastName: json['lastName'],
      birthDate: /*DateTime.parse(json['birthDate'])*/ json['birthDate'],
      birthCity: json['birthCity'],
      birthCountry: json['birthCountry'],
      height: json['height'],
      weight: json['weight'],
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
  final DateTime birthDate;
  final String birthCity;
  final String birthCountry;
  final String height;
  final String weight;
}