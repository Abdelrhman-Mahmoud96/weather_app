import 'package:weather_app_task/core/mappers/domain_mapper.dart';
import 'package:weather_app_task/features/data/models/location/local/location_model.dart';
import 'package:weather_app_task/features/domain/entities/location/location.dart';

class LocationModelMapper implements DomainMapper<Location, LocationModel> {
  @override
  Location fromDomain(LocationModel model) {
    return Location(
        locationId: model.locationId,
        locationName: model.locationName,
        country: model.country,
        isFavorite: model.isFavorite);
  }

  @override
  LocationModel toDomain(Location entity) {
    return LocationModel(
        locationId: entity.locationId,
        locationName: entity.locationName,
        country: entity.country,
        isFavorite: entity.isFavorite);
  }
}
