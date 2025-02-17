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
    final stadiumId = json['StadiumID'];
    if (stadiumId == null) {
      throw ArgumentError('stadiumId is required');
    }

    final active = json['Active'];
    if (active == null) {
      throw ArgumentError('active is required');
    }

    final name = json['Name'];
    if (name == null) {
      throw ArgumentError('name is required');
    }

    var address = json['Address'];
    address ??= "";

    final city = json['City'];
    if (city == null) {
      throw ArgumentError('city is required');
    }

    var state = json['State'];
    state ??= "";

    var zip = json['Zip'];
    zip ??= "";

    final country = json['Country'];
    if (country == null) {
      throw ArgumentError('country is required');
    }

    var capacity = json['Capacity'];
    capacity ??= 0;

    return StadiumApiModel(
      stadiumId: stadiumId,
      active: active,
      name: name,
      address: address,
      city: city,
      state: state,
      zip: zip,
      country: country,
      capacity: capacity,
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
