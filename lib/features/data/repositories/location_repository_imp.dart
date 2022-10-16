import 'package:weather_app_task/features/data/data_sources/local/location/i_location_local_storage.dart';
import 'package:weather_app_task/features/data/data_sources/remote/location/i_location_api_data_fetcher.dart';
import 'package:weather_app_task/features/domain/entities/location/location.dart';
import 'package:weather_app_task/features/domain/repositories/i_location_repository.dart';

class LocationRepositoryImp implements ILocationRepository {
  LocationRepositoryImp({
    required this.locationLocalStorage,
    required this.locationRemotely,
  });

  final ILocationLocalStorage locationLocalStorage;
  final ILocationsApiDataFetcher locationRemotely;

  // searching for a (probably) new location,
  // and getting a list of results to pick from
  @override
  Future<List<Location>> repositoryGetLocationsInfo(String locationName) async {
    final locationsSearchResults =
        await locationRemotely.getDataFromApi(locationName);
    return locationsSearchResults;
  }

  @override
  Stream<List<Location>> repositoryGetPreviousLocations() {
    return locationLocalStorage.getPreviousLocations();
  }

  @override
  Future<void> repositoryAddToPreviousLocation(Location location) async {
    locationLocalStorage.getPreviousLocations().listen((previousLocations) {
      final duplicate = previousLocations.where((previousLocation) =>
          previousLocation.locationId == location.locationId);

      // meaning a new location
      if (duplicate.isEmpty) {
        // save it to local storage, so we don't have to fetch the location from internet again
        locationLocalStorage.addToPreviousLocations(location);
      }
    });
  }

  @override
  Future<void> repositoryRemoveFromPreviousLocation(Location location) {
    return locationLocalStorage.removeFromPreviousLocations(location);
  }

  // this method here is for when we pick a location
  // from the list of a previously used locations section
  // in the manage location setting.
  //
  // we move the picked location to the end of the locations list,
  // like when we add a new location to the locations stream, the newly added location
  // (most recent) will be at the end of the list
  @override
  Future<void> repositorySetLastUsedLocation(Location locationEntity) async {
    await locationLocalStorage.setAsLastUsedLocation(locationEntity);
  }

  @override
  Future<void> repositoryUpdatePreviousLocation(Location locationEntity) {
    return locationLocalStorage.updateLocation(locationEntity);
  }
}
