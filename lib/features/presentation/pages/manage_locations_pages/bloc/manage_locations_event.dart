part of 'manage_locations_bloc.dart';

@freezed
class ManageLocationsEvent {
  const factory ManageLocationsEvent.loadPreviousLocations() =
      LoadPreviousLocations;

  const factory ManageLocationsEvent.loadLastUsedLocation() =
      LoadLastUsedLocation;

  const factory ManageLocationsEvent.searchLocation(
      {required String locationName}) = SearchLocation;

  const factory ManageLocationsEvent.removeLocation(
      {required Location locationEntity}) = RemoveLocation;

  const factory ManageLocationsEvent.pickPreviousLocation(
      {required Location locationEntity}) = PickPreviousLocation;

  const factory ManageLocationsEvent.toggleIsFavoriteLocation(
      {required Location locationEntity,
      required bool isFavorite}) = ToggleIsFavoriteLocation;

  const factory ManageLocationsEvent.addToPreviousLocations(
      {required Location locationEntity}) = AddToPreviousLocations;
}
