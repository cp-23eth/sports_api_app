class UserModel {
  UserModel({
    required this.username,
    required this.favoriteTeams,
    required this.favoritePlayers,
  });

  final String username;
  final List<int> favoriteTeams;
  final List<int> favoritePlayers;

  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
      username: json['username'],
      favoriteTeams: List<int>.from(json['favoriteTeams']),
      favoritePlayers: List<int>.from(json['favoritePlayers']),
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
