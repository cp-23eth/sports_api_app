class UserModel {
  UserModel({
    required this.username,
    required this.favoriteTeams,
    required this.favoritePlayers,
    required this.headerFooterColor,
    required this.comingsMatchsColor,
    required this.latestsMatchsColor,
    required this.todaysMatchsColor,
    required this.teamsHeaderColor,
    required this.teamsStadiumColor,
    required this.teamsPlayersColor,
    required this.backgroundColor,
  });

  final String username;
  final List<int> favoriteTeams;
  final List<int> favoritePlayers;
  final String headerFooterColor;
  final String comingsMatchsColor;
  final String latestsMatchsColor;
  final String todaysMatchsColor;
  final String teamsHeaderColor;
  final String teamsStadiumColor;
  final String teamsPlayersColor;
  final String backgroundColor;

  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
      username: json['username'],
      favoriteTeams: List<int>.from(json['favoriteTeams']),
      favoritePlayers: List<int>.from(json['favoritePlayers']),
      headerFooterColor: json['headerFooterColor'],
      comingsMatchsColor: json['comingsMatchsColor'],
      latestsMatchsColor: json['latestsMatchsColor'],
      todaysMatchsColor: json['todaysMatchsColor'],
      teamsHeaderColor: json['teamsHeaderColor'],
      teamsStadiumColor: json['teamsStadiumColor'],
      teamsPlayersColor: json['teamsPlayersColor'],
      backgroundColor: json['backgroundColor'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'username': username,
      'favoriteTeams': favoriteTeams,
      'favoritePlayers': favoritePlayers,
    };
  }
}
