import 'package:weather_app_task/features/domain/entities/location/location.dart';

abstract class ILocationRepository {
  Future<List<Location>> repositoryGetLocationsInfo(String locationName);
  Stream<List<Location>> repositoryGetPreviousLocations();
  Future<void> repositoryAddToPreviousLocation(Location location);
  Future<void> repositoryRemoveFromPreviousLocation(Location location);
  Future<void> repositorySetLastUsedLocation(Location locationEntity);
  Future<void> repositoryUpdatePreviousLocation(Location locationEntity);
}
