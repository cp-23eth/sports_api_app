class TeamApiModel {
  const TeamApiModel({
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

    String? primaryColor = json['PrimaryColor'];
    if (primaryColor == null) {
      primaryColor = '000000';
      throw ArgumentError('primaryColor is required');
    }

    String? secondaryColor = json['SecondaryColor'];
    if (secondaryColor == null) {
      secondaryColor = '000000';
      throw ArgumentError('secondaryColor is required');
    }

    String? tertiaryColor = json['TertiaryColor'];
    tertiaryColor ??= '000000';

    final logo = key + '.svg';

    return TeamApiModel(
      teamId: teamId,
      active: active,
      key: key,
      city: city,
      name: name,
      headCoach: headCoach,
      logo: logo,
      primaryColor: primaryColor,
      secondaryColor: secondaryColor,
      tertiaryColor: tertiaryColor,
    );
  }

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
}
