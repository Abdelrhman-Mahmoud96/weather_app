import 'package:weather_app_task/features/domain/entities/location/location.dart';

abstract class ILocationLocalStorage {
  Future<void> addToPreviousLocations(Location locationEntity);
  Future<void> removeFromPreviousLocations(Location locationEntity);
  Stream<List<Location>> getPreviousLocations();
  Future<void> setAsLastUsedLocation(Location locationEntity);
  Future<void> updateLocation(Location locationEntity);
}
