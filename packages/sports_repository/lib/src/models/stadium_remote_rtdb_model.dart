class StadiumRemoteRtdbModel {
  const StadiumRemoteRtdbModel({
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

  factory StadiumRemoteRtdbModel.fromJson(Map<String, dynamic> json){
    return StadiumRemoteRtdbModel(
      stadiumId: json['stadiumId'],
      active: json['active'],
      name: json['name'],
      address: json['address'],
      city: json['city'],
      state: json['state'],
      zip: json['zip'],
      country: json['country'],
      capacity: json['capacity'],
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