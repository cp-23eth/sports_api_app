class UserModel {
  UserModel({
    required this.username,
    required this.favoriteTeams,
    required this.favoritePlayers,
    required this.appColorTeam,
  });

  final String username;
  final List<int> favoriteTeams;
  final List<int> favoritePlayers;
  String appColorTeam;

  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
      username: json['username'],
      favoriteTeams: List<int>.from(json['favoriteTeams']),
      favoritePlayers: List<int>.from(json['favoritePlayers']),
      appColorTeam: json['appColorTeam'],
    );
  }
}
