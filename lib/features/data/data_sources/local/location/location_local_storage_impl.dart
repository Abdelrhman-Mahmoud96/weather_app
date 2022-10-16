import 'dart:convert';
import 'package:rxdart/rxdart.dart';
import 'package:weather_app_task/core/errors/local/shared_preference_exceptions.dart';
import 'package:weather_app_task/core/mappers/domain_mapper.dart';
import 'package:weather_app_task/features/data/data_sources/local/location/i_location_local_storage.dart';
import 'package:weather_app_task/features/data/data_sources/local/shared_preference_helper.dart';
import 'package:weather_app_task/features/data/models/location/local/location_model.dart';
import 'package:weather_app_task/features/domain/entities/location/location.dart';

class LocationLocalStorageImp implements ILocationLocalStorage {
  LocationLocalStorageImp(
      {required this.sharedPreferenceHelper, required this.domainMapper}) {
    _initLocationsStreamController();
  }

  final SharedPreferenceHelper sharedPreferenceHelper;
  final _locationStreamController =
      BehaviorSubject<List<Location>>.seeded(const []);
      
  final DomainMapper<Location, LocationModel> domainMapper;
  final storageKey = 'locations';

  void _initLocationsStreamController() {
    final locationsJson = sharedPreferenceHelper.getValue(storageKey);
    if (locationsJson != null) {
      final locations = List<Map>.from(json.decode(locationsJson) as List)
          .map((locationJson) => domainMapper.fromDomain(
              LocationModel.fromJson(Map<String, dynamic>.from(locationJson))))
          .toList();

      _locationStreamController.add(locations);
    } else {
      _locationStreamController.add([]);
    }
  }

  @override
  Future<void> addToPreviousLocations(Location newLocation) async {
    final currentLocations = [..._locationStreamController.value];
    final newLocationIndex = currentLocations.indexWhere(
        (location) => location.locationId == newLocation.locationId);
    if (newLocationIndex < 0) {
      // only add new locations (no duplicate)
      currentLocations.add(newLocation);
    }
    // updating the stream with updated list of locations
    _locationStreamController.add(currentLocations);
    // to keep the data class structure consistent with both domainModel and DTO
    final locationsToDomainModel = _locationsToModelLocations(currentLocations);
    await sharedPreferenceHelper.setValue(storageKey, json.encode(locationsToDomainModel));
  }

  @override
  Stream<List<Location>> getPreviousLocations() {
    return _locationStreamController.asBroadcastStream();
  }

  @override
  Future<void> removeFromPreviousLocations(Location deletedLocation) async {
    final currentLocations = [..._locationStreamController.value];
    final deletedLocationIndex = currentLocations.indexWhere(
        (location) => location.locationId == deletedLocation.locationId);
    if (deletedLocationIndex == -1) {
      // location doesn't exist in the list
      throw SharedPreferenceException(
          exceptionMessage:
              'TRIED TO REMOVE A NON EXISTING LOCATION, METHOD: "removeFromPreviousLocations"');
    } else {
      currentLocations.removeAt(deletedLocationIndex);
      _locationStreamController.add(currentLocations);
      final locationsToDomainModel =
          _locationsToModelLocations(currentLocations);
      await sharedPreferenceHelper
          .setValue(storageKey, json.encode(locationsToDomainModel));
    }
  }

  @override
  Future<void> setAsLastUsedLocation(Location locationEntity) async {
    final currentLocations = [..._locationStreamController.value];

    final locationIndex = currentLocations.indexWhere(
        (location) => location.locationName == locationEntity.locationName);

    if (locationIndex < 0) {
      throw SharedPreferenceException(
          exceptionMessage:
              'TRIED TO REMOVE A NON EXISTING LOCATION, METHOD: "setAsLastAddedLocation"');
    }
    final location = currentLocations.removeAt(locationIndex);

    currentLocations.add(location);

    _locationStreamController.add(currentLocations);

    final locationsToDomainModel = _locationsToModelLocations(currentLocations);

    await sharedPreferenceHelper.setValue(storageKey, json.encode(locationsToDomainModel));
  }

  @override
  Future<void> updateLocation(Location locationEntity) async {
    final currentLocations = [..._locationStreamController.value];

    final locationIndex = currentLocations.indexWhere(
        (location) => location.locationId == locationEntity.locationId);

    currentLocations[locationIndex] = locationEntity;

    _locationStreamController.add(currentLocations);
    final locationsToDomainModel = _locationsToModelLocations(currentLocations);

    await sharedPreferenceHelper.setValue(storageKey, json.encode(locationsToDomainModel));
  }

  List<LocationModel> _locationsToModelLocations(List<Location> locations) {
    return locations
        .map((location) => domainMapper.toDomain(location))
        .toList();
  }
}
