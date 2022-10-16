part of 'manage_locations_bloc.dart';

enum ManageLocationStatus { initial, loading, loaded, success, failure }

@freezed
class ManageLocationsState with _$ManageLocationsState {
  const factory ManageLocationsState({
    required ManageLocationStatus manageLocationStatus,
    Location? currentLocation,
    @Default([]) List<Location>? previousLocations,
    List<Location>? searchResultLocations,
    @Default('') String? errorMessage,
  }) = _ManageLocationsState;

  const ManageLocationsState._();

  List<Location> get favoriteLocations =>
      previousLocations!.where((location) => location.isFavorite == true).toList();
}
