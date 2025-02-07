class StadiumApiModel {
  const StadiumApiModel({
    required this.stadiumId,
    required this.active,
    required this.name,
    required this.address,
    required this.city,
    required this.state,
    required this.zip,
    required this.country,
    required this.capacity,
  });

  factory StadiumApiModel.fromJson(Map<String, dynamic> json) {
    return StadiumApiModel(
      stadiumId: json['StadiumID'],
      active: json['Active'],
      name: json['Name'],
      address: json['Address'],
      city: json['City'],
      state: json['State'],
      zip: json['Zip'],
      country: json['Country'],
      capacity: json['Capacity'],
    );
  }

  final int stadiumId;
  final bool active;
  final String name;
  final String address;
  final String city;
  final String state;
  final String zip;
  final String country;
  final int capacity;
}
