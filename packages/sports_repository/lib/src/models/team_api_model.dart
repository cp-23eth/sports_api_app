class TeamApiModel {
  const TeamApiModel({
    required this.teamId,
    required this.active,
    required this.key,
    required this.city,
    required this.name,
    required this.headCoach,
    required this.wikipediaLogoUrl,
  });

  factory TeamApiModel.fromJson(Map<String, dynamic> json) {
    return TeamApiModel(
      teamId: json['TeamID'],
      active: json['Active'],
      key: json['Key'],
      city: json['City'],
      name: json['Name'],
      headCoach: json['HeadCoach'],
      wikipediaLogoUrl: json['WikipediaLogoUrl'],
    );
  }

  final int teamId;
  final bool active;
  final String key;
  final String city;
  final String name;
  final String headCoach;
  final String wikipediaLogoUrl;
}
