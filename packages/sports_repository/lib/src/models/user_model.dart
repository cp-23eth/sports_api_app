class UserModel {
  UserModel({
    required this.username,
    required this.favoriteTeams,
    required this.favoritePlayers,
    required this.appColorTeam,
    required this.homeScreenDesign,
  });

  final String username;
  final List<int> favoriteTeams;
  final List<int> favoritePlayers;
  String appColorTeam;
  final String homeScreenDesign;

  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
      username: json['username'],
      favoriteTeams: List<int>.from(json['favoriteTeams']),
      favoritePlayers: List<int>.from(json['favoritePlayers']),
      appColorTeam: json['appColorTeam'],
      homeScreenDesign: json['homeScreenDesign'],
    );
  }
}
