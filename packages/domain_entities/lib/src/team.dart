import 'package:equatable/equatable.dart';

class Team extends Equatable {
  const Team({
    required this.teamId,
    required this.active,
    required this.key,
    required this.city,
    required this.name,
    required this.headCoach,
    required this.wikipediaLogoUrl,
  });

  final int teamId;
  final bool active;
  final String key;
  final String city;
  final String name;
  final String headCoach;
  final String wikipediaLogoUrl;

  @override
  List<Object?> get props => [
        teamId,
        active,
        key,
        city,
        name,
        headCoach,
        wikipediaLogoUrl,
      ];

  @override
  bool? get stringify => true;
}
