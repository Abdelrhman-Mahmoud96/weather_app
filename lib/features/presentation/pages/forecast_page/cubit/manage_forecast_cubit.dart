import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:weather_app_task/core/errors/local/shared_preference_exceptions.dart';
import 'package:weather_app_task/core/errors/remote/server_connection_exception.dart';
import 'package:weather_app_task/core/errors/remote/server_response_exception.dart';
import 'package:weather_app_task/core/use_case/i_use_case.dart';
import 'package:weather_app_task/features/domain/entities/forecast/forecast.dart';
import 'package:weather_app_task/features/domain/use_cases/forecast/delete_cached_location_forecast_usecase.dart';
import 'package:weather_app_task/features/domain/use_cases/forecast/get_all_locations_cached_forecast_usecase.dart';
import 'package:weather_app_task/features/domain/use_cases/forecast/get_cached_location_forecast_usecase.dart';
import 'package:weather_app_task/features/domain/use_cases/forecast/get_remote_location_forecast_usecase.dart';

part 'manage_forecast_state.dart';
part 'manage_forecast_cubit.freezed.dart';

class ManageForecastCubit extends Cubit<ManageForecastState> {
  ManageForecastCubit({
    required this.getRemoteLocationForecastUseCase,
    required this.getCacheLocationForecastUseCase,
    required this.deleteCacheLocationForecastUseCase,
    required this.getAllLocationsCachedForecastUseCase, 
  }) : super(const ManageForecastState());

  final GetRemoteLocationForecastUseCase getRemoteLocationForecastUseCase;
  final GetCachedLocationForecastUseCase getCacheLocationForecastUseCase;
  final DeleteCachedLocationForecastUseCase deleteCacheLocationForecastUseCase;
  final GetAllLocationsCachedForecastUseCase
      getAllLocationsCachedForecastUseCase;

  // get data
  void loadRemoteLocationForecastData(String locationId) async {
    emit(state.copyWith(manageForecastStatus: ManageForecastStatus.loading));
    try {
      final locationForecastData =
          await getRemoteLocationForecastUseCase(params: locationId);

      emit(state.copyWith(
          manageForecastStatus: ManageForecastStatus.loaded,
          forecast: locationForecastData));
    } on ServerConnectionException catch (error) {
      emit(state.copyWith(
          manageForecastStatus: ManageForecastStatus.failed,
          errorMessage:
              'NO INTERNET CONNECTION: ${error.exceptionMessage}, METHOD: "loadRemoteLocationForecastData"'));
    } on ServerResponseException catch (error) {
      emit(state.copyWith(
          manageForecastStatus: ManageForecastStatus.failed,
          errorMessage:
              'FAILED TO GET LOCATION\'S FORECAST: ${error.exceptionMessage}, METHOD: "loadRemoteLocationForecastData"'));
    }
  }

  void loadCachedLocationForecastData(String locationId) async {
    emit(state.copyWith(
      manageForecastStatus: ManageForecastStatus.loading,
    ));
    try {
      final locationForecastData =
          await getCacheLocationForecastUseCase(params: locationId);

      emit(state.copyWith(
          manageForecastStatus: ManageForecastStatus.loaded,
          forecast: locationForecastData));
    } on SharedPreferenceException catch (error) {
      emit(state.copyWith(
          manageForecastStatus: ManageForecastStatus.failed,
          errorMessage:
              'SHARED PREFERENCE EXCEPTION: ${error.exceptionMessage}, METHOD: "loadCachedLocationForecastData"'));
    }
  }

  // delete location's forecast when deleting the location
  void deleteCachedLocationForecast(String locationId) async {
    try {
      await deleteCacheLocationForecastUseCase(params: locationId);
    } on SharedPreferenceException catch (error) {
      emit(state.copyWith(
          manageForecastStatus: ManageForecastStatus.failed,
          errorMessage:
              'SHARED PREFERENCE EXCEPTION: ${error.exceptionMessage}, METHOD: "loadCachedLocationForecastData"'));
    }
  }

  void loadAllCachedLocationsForecastData() async {
    emit(state.copyWith(
      manageForecastStatus: ManageForecastStatus.loading,
    ));
    try {
      final locationsForecastData =
          await getAllLocationsCachedForecastUseCase(params: const NoParams());
      emit(state.copyWith(
          manageForecastStatus: ManageForecastStatus.loaded,
          allLocationsForecast: locationsForecastData));
    } on SharedPreferenceException catch (error) {
      emit(state.copyWith(
          manageForecastStatus: ManageForecastStatus.failed,
          errorMessage:
              'SHARED PREFERENCE EXCEPTION: ${error.exceptionMessage}, METHOD: "loadCachedLocationForecastData"'));
    }
  }
}
