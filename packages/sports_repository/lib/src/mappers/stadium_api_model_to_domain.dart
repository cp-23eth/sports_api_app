import 'package:domain_entities/domain_entities.dart';
import 'package:sports_repository/sports_repository.dart';

extension StadiumApiModelToDomain on StadiumApiModel {
  Stadium toDomainEntity() {
    return Stadium(
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
}
