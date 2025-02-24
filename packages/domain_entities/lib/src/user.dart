import 'package:equatable/equatable.dart';

class User extends Equatable {
  const User({
    required this.username,
    required this.favoriteTeams,
    required this.favoritePlayers,
  });

  final String username;
  final List<int> favoriteTeams;
  final List<int> favoritePlayers;

  @override
  List<Object?> get props => [
        username,
        favoriteTeams,
        favoritePlayers,
      ];

  @override
  bool? get stringify => true;
}
