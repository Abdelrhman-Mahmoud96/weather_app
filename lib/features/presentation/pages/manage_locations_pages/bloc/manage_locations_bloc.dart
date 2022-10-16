import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:weather_app_task/core/errors/local/shared_preference_exceptions.dart';
import 'package:weather_app_task/core/errors/remote/server_connection_exception.dart';
import 'package:weather_app_task/core/errors/remote/server_response_exception.dart';
import 'package:weather_app_task/core/use_case/i_use_case.dart';
import 'package:weather_app_task/features/domain/entities/location/location.dart';
import 'package:weather_app_task/features/domain/use_cases/location/add_to_previous_locations_usecase.dart';
import 'package:weather_app_task/features/domain/use_cases/location/get_previous_locations_usecase.dart';
import 'package:weather_app_task/features/domain/use_cases/location/pick_previous_location_usecase.dart';
import 'package:weather_app_task/features/domain/use_cases/location/remove_previous_location_usecase.dart';
import 'package:weather_app_task/features/domain/use_cases/location/search_location_usecase.dart';
import 'package:weather_app_task/features/domain/use_cases/location/toggle_location_as_favorite_usecase.dart';


part 'manage_locations_event.dart';
part 'manage_locations_state.dart';
part 'manage_locations_bloc.freezed.dart';

class ManageLocationsBloc
    extends Bloc<ManageLocationsEvent, ManageLocationsState> {
  ManageLocationsBloc({
    required this.getPreviousLocationsUseCase,
    required this.pickPreviousLocationUseCase,
    required this.removePreviousLocationUseCase,
    required this.searchALocationUseCase,
    required this.toggleIsFavoriteLocationUseCase,
    required this.addToPreviousLocationsUseCase,
  }) : super(const ManageLocationsState(
            manageLocationStatus: ManageLocationStatus.initial)) {
    // events
    on<LoadPreviousLocations>(_onLoadPreviousLocations);

    // on<LoadLastUsedLocation>(_onLoadLastUsedLocation);

    on<SearchLocation>(_onSearchLocation);

    on<RemoveLocation>(_onRemoveLocation);

    on<PickPreviousLocation>(_onPickPreviousLocation);

    on<ToggleIsFavoriteLocation>(_onToggleIsFavoriteLocation);
    // when we pick a location from the search results,
    // we cache it in the shared preference as a previous location
    on<AddToPreviousLocations>(_onAddToPreviousLocations);
  }
  // use cases
  final GetPreviousLocationsUseCase getPreviousLocationsUseCase;
  final PickPreviousLocationUseCase pickPreviousLocationUseCase;
  final RemovePreviousLocationUseCase removePreviousLocationUseCase;
  final SearchALocationUseCase searchALocationUseCase;
  final ToggleIsFavoriteLocationUseCase toggleIsFavoriteLocationUseCase;
  final AddToPreviousLocationsUseCase addToPreviousLocationsUseCase;

  Future<void> _onLoadPreviousLocations(
      LoadPreviousLocations event, Emitter<ManageLocationsState> emit) async {
    emit(state.copyWith(manageLocationStatus: ManageLocationStatus.loading));

    await emit.forEach<List<Location>>(
      getPreviousLocationsUseCase(params: const NoParams()),
      onData: (locations) => state.copyWith(
          manageLocationStatus: ManageLocationStatus.loaded,
          previousLocations: locations,
          currentLocation: locations.last,
          ),
      onError: (error, stacktrace) => state.copyWith(
          manageLocationStatus: ManageLocationStatus.failure,
          errorMessage:
              'FAILED TO LOAD THE PREVIOUS LOCATION WITH ERROR: $error, STACKTRACE: $stacktrace'),
    );
  }

  // Future<void> _onLoadLastUsedLocation(
  //     LoadLastUsedLocation event, Emitter<ManageLocationsState> emit) async {
  //   emit(state.copyWith(manageLocationStatus: ManageLocationStatus.loading));

  //   await emit.forEach<List<Location>>(
  //     getPreviousLocationsUseCase(params: const NoParams()),
  //     onData: (locations) {
  //       if (locations.isEmpty) {
  //         return state.copyWith(
  //             manageLocationStatus: ManageLocationStatus.loaded,
  //             currentLocation: null);
  //       }
  //       return state.copyWith(
  //           manageLocationStatus: ManageLocationStatus.loaded,
  //           currentLocation: locations.last);
  //     },
  //     onError: (error, stacktrace) => state.copyWith(
  //         manageLocationStatus: ManageLocationStatus.failure,
  //         errorMessage:
  //             'FAILED LOADING LAST USED LOCATIONS WITH ERROR: $error, EVENT: "LoadLastUsedLocation", STACKTRACE: $stacktrace'),
  //   );
  // }

  Future<void> _onSearchLocation(
      SearchLocation event, Emitter<ManageLocationsState> emit) async {
    emit(state.copyWith(manageLocationStatus: ManageLocationStatus.loading));

    try {
      final searchedLocationsResults =
          await searchALocationUseCase(params: event.locationName);

      emit(state.copyWith(
          manageLocationStatus: ManageLocationStatus.loaded,
          searchResultLocations: searchedLocationsResults));
    } on ServerConnectionException catch (error) {
      emit(state.copyWith(
          manageLocationStatus: ManageLocationStatus.failure,
          errorMessage:
              'FAILED GETTING LOCATION WITH ERROR: ${error.exceptionMessage}, EVENT: "SearchLocation"'));
    } on ServerResponseException catch (error) {
      emit(state.copyWith(
          manageLocationStatus: ManageLocationStatus.failure,
          errorMessage:
              'FAILED GETTING LOCATION WITH ERROR: ${error.exceptionMessage}, EVENT: "SearchLocation"'));
    }
  }

  Future<void> _onRemoveLocation(
      RemoveLocation event, Emitter<ManageLocationsState> emit) async {
    try {
      await removePreviousLocationUseCase(params: event.locationEntity);
    } on SharedPreferenceException catch (error) {
      emit(state.copyWith(
          manageLocationStatus: ManageLocationStatus.failure,
          errorMessage:
              'FAILED DELETING LOCATION WITH ERROR: ${error.exceptionMessage}, EVENT: "RemoveLocation"'));
    }
  }

  Future<void> _onPickPreviousLocation(
      PickPreviousLocation event, Emitter<ManageLocationsState> emit) async {
    emit(state.copyWith(
        manageLocationStatus: ManageLocationStatus.success,
        currentLocation: event.locationEntity));

    try {
      await pickPreviousLocationUseCase(params: event.locationEntity);
    } on SharedPreferenceException catch (error) {
      emit(state.copyWith(
          manageLocationStatus: ManageLocationStatus.failure,
          errorMessage:
              'FAILED SETTING LOCATION AS LAST USED WITH ERROR: ${error.exceptionMessage}, EVENT: "PickPreviousLocation"'));
    }
  }

  Future<void> _onToggleIsFavoriteLocation(ToggleIsFavoriteLocation event,
      Emitter<ManageLocationsState> emit) async {
    final newLocation =
        event.locationEntity.copyWith(isFavorite: event.isFavorite);
    try {
      // update location with the new isFavorite value
      await toggleIsFavoriteLocationUseCase(params: newLocation);
    } on SharedPreferenceException catch (error) {
      emit(state.copyWith(
          manageLocationStatus: ManageLocationStatus.failure,
          errorMessage:
              'FAILED UPDATE LOCATION\'S IS FAVORITE WITH ERROR: ${error.exceptionMessage}, EVENT: "ToggleIsFavoriteLocation"'));
    }
  }

  // successfully picked a new location, and it will be cached to our shared preference
  Future<void> _onAddToPreviousLocations(
      AddToPreviousLocations event, Emitter<ManageLocationsState> emit) async {
    try {
      // update location with the new isFavorite value
      await addToPreviousLocationsUseCase(params: event.locationEntity);

      emit(state.copyWith(
        manageLocationStatus: ManageLocationStatus.success,
        currentLocation: event.locationEntity,
      ));
    } on SharedPreferenceException catch (error) {
      emit(state.copyWith(
          manageLocationStatus: ManageLocationStatus.failure,
          errorMessage:
              'FAILED UPDATE LOCATION\'S IS FAVORITE WITH ERROR: ${error.exceptionMessage}, EVENT: "ToggleIsFavoriteLocation"'));
    }
  }
}
