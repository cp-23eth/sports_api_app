import 'package:equatable/equatable.dart';

class Stadium extends Equatable {
  const Stadium({
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

  final int stadiumId;
  final bool active;
  final String name;
  final String address;
  final String city;
  final String state;
  final String zip;
  final String country;
  final int capacity;

  @override
  List<Object?> get props => [
        stadiumId,
        active,
        name,
        address,
        city,
        state,
        zip,
        country,
        capacity,
      ];

  @override
  bool? get stringify => true;
}
