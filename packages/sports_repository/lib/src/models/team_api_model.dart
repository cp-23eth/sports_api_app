class TeamApiModel {
  const TeamApiModel({
    required this.teamId,
    required this.active,
    required this.key,
    required this.city,
    required this.name,
    required this.headCoach,
    required this.logo,
  });

  factory TeamApiModel.fromJson(Map<String, dynamic> json) {
    final teamId = json['TeamID'];
    if (teamId == null) {
      throw ArgumentError('teamId is required');
    }

    final active = json['Active'];
    if (active == null) {
      throw ArgumentError('active is required');
    }

    final key = json['Key'];
    if (key == null) {
      throw ArgumentError('key is required');
    }

    final city = json['City'];
    if (city == null) {
      throw ArgumentError('city is required');
    }

    final name = json['Name'];
    if (name == null) {
      throw ArgumentError('name is required');
    }

    final headCoach = json['HeadCoach'];
    if (headCoach == null) {
      throw ArgumentError('headCoach is required');
    }

    // final wikipediaLogoUrl = json['WikipediaLogoUrl'];
    // if (wikipediaLogoUrl == null) {
    //   throw ArgumentError('wikipediaLogoUrl is required');
    // }

    final logo = key + '.svg';

    return TeamApiModel(
      teamId: teamId,
      active: active,
      key: key,
      city: city,
      name: name,
      headCoach: headCoach,
      logo: logo,
    );
  }

  final int teamId;
  final bool active;
  final String key;
  final String city;
  final String name;
  final String headCoach;
  final String logo;
}
