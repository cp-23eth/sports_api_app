import 'package:equatable/equatable.dart';

class Team extends Equatable {
  const Team({
    required this.teamId,
    required this.active,
    required this.key,
    required this.city,
    required this.name,
    required this.headCoach,
    required this.logo,
    required this.primaryColor,
    required this.secondaryColor,
    required this.tertiaryColor,
  });

  final int teamId;
  final bool active;
  final String key;
  final String city;
  final String name;
  final String headCoach;
  final String logo;
  final String primaryColor;
  final String secondaryColor;
  final String tertiaryColor;

  @override
  List<Object?> get props => [
        teamId,
        active,
        key,
        city,
        name,
        headCoach,
        logo,
        primaryColor,
        secondaryColor,
        tertiaryColor,
      ];

  @override
  bool? get stringify => true;
}
