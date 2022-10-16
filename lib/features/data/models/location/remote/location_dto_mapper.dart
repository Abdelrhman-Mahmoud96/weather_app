import 'package:weather_app_task/core/mappers/domain_mapper.dart';
import 'package:weather_app_task/features/data/models/location/remote/location_dto.dart';
import 'package:weather_app_task/features/domain/entities/location/location.dart';

class LocationDTOMapper implements DomainMapper<Location, LocationDTO> {
  @override
  Location fromDomain(LocationDTO dto) {
    return Location(
        locationId: dto.locationId!,
        locationName: dto.locationName!,
        country: dto.country!,
        isFavorite: false);
  }

  @override
  LocationDTO toDomain(Location entity) {
    return LocationDTO(
      locationId: entity.locationId,
      locationName: entity.locationName,
      country: entity.country,
    );
  }
}
