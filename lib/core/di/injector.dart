import 'package:get_it/get_it.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:weather_app_task/core/mappers/domain_mapper.dart';
import 'package:weather_app_task/features/data/data_sources/local/forecast/forecast_local_storage_imp.dart';
import 'package:weather_app_task/features/data/data_sources/local/forecast/i_forecast_local_storage.dart';
import 'package:weather_app_task/features/data/data_sources/local/location/i_location_local_storage.dart';
import 'package:weather_app_task/features/data/data_sources/local/location/location_local_storage_impl.dart';
import 'package:weather_app_task/features/data/data_sources/local/shared_preference_helper.dart';
import 'package:weather_app_task/features/data/data_sources/remote/forecast/forecast_api_data_fetcher_imp.dart';
import 'package:weather_app_task/features/data/data_sources/remote/forecast/forecast_http_service.dart';
import 'package:weather_app_task/features/data/data_sources/remote/forecast/i_forecast_api_data_fetcher.dart';
import 'package:weather_app_task/features/data/data_sources/remote/location/i_location_api_data_fetcher.dart';
import 'package:weather_app_task/features/data/data_sources/remote/location/location_api_data_fetcher_imp.dart';
import 'package:weather_app_task/features/data/data_sources/remote/location/location_http_service.dart';
import 'package:weather_app_task/features/data/models/forecast/local/daily/local/daily_forecast_model_mapper.dart';
import 'package:weather_app_task/features/data/models/forecast/local/daily/local/daily_forecasts_model.dart';
import 'package:weather_app_task/features/data/models/forecast/local/forecast_model.dart';
import 'package:weather_app_task/features/data/models/forecast/local/forecast_model_mapper.dart';
import 'package:weather_app_task/features/data/models/forecast/local/hourly/local/hourly_forecast_model.dart';
import 'package:weather_app_task/features/data/models/forecast/local/hourly/local/hourly_forecast_model_mapper.dart';
import 'package:weather_app_task/features/data/models/forecast/remote/daily/remote/daily_forecasts_dto.dart';
import 'package:weather_app_task/features/data/models/forecast/remote/daily/remote/daily_forecasts_dto_mapper.dart';
import 'package:weather_app_task/features/data/models/forecast/remote/forecast_dto.dart';
import 'package:weather_app_task/features/data/models/forecast/remote/forecast_dto_mapper.dart';
import 'package:weather_app_task/features/data/models/forecast/remote/hourly/remote/hourly_forecast_dto.dart';
import 'package:weather_app_task/features/data/models/forecast/remote/hourly/remote/hourly_forecast_dto_mapper.dart';
import 'package:weather_app_task/features/data/models/location/local/location_model.dart';
import 'package:weather_app_task/features/data/models/location/local/location_model_mapper.dart';
import 'package:weather_app_task/features/data/models/location/remote/location_dto.dart';
import 'package:weather_app_task/features/data/models/location/remote/location_dto_mapper.dart';
import 'package:weather_app_task/features/data/repositories/forecast_repository_imp.dart';
import 'package:weather_app_task/features/data/repositories/location_repository_imp.dart';
import 'package:weather_app_task/features/domain/entities/forecast/daily/daily_forecasts.dart';
import 'package:weather_app_task/features/domain/entities/forecast/forecast.dart';
import 'package:weather_app_task/features/domain/entities/forecast/hourly/hourly_forecast.dart';
import 'package:weather_app_task/features/domain/entities/location/location.dart';
import 'package:weather_app_task/features/domain/repositories/i_forecast_repository.dart';
import 'package:weather_app_task/features/domain/repositories/i_location_repository.dart';
import 'package:weather_app_task/features/domain/use_cases/forecast/delete_cached_location_forecast_usecase.dart';
import 'package:weather_app_task/features/domain/use_cases/forecast/get_all_locations_cached_forecast_usecase.dart';
import 'package:weather_app_task/features/domain/use_cases/forecast/get_cached_location_forecast_usecase.dart';
import 'package:weather_app_task/features/domain/use_cases/forecast/get_remote_location_forecast_usecase.dart';
import 'package:weather_app_task/features/domain/use_cases/location/add_to_previous_locations_usecase.dart';
import 'package:weather_app_task/features/domain/use_cases/location/get_previous_locations_usecase.dart';
import 'package:weather_app_task/features/domain/use_cases/location/pick_previous_location_usecase.dart';
import 'package:weather_app_task/features/domain/use_cases/location/remove_previous_location_usecase.dart';
import 'package:weather_app_task/features/domain/use_cases/location/search_location_usecase.dart';
import 'package:weather_app_task/features/domain/use_cases/location/toggle_location_as_favorite_usecase.dart';
import 'package:weather_app_task/features/presentation/connectivity/connectivity_helper.dart';
import 'package:weather_app_task/features/presentation/connectivity/cubit/connectivity_cubit.dart';
import 'package:weather_app_task/features/presentation/pages/forecast_page/cubit/manage_forecast_cubit.dart';
import 'package:weather_app_task/features/presentation/pages/manage_locations_pages/bloc/manage_locations_bloc.dart';

final getIt = GetIt.instance;

Future<void> initDependencies() async {
  final sharedPreferencePlugin = await SharedPreferences.getInstance();
  

// mappers
  getIt.registerLazySingleton<DomainMapper<Location, LocationDTO>>(
      () => LocationDTOMapper());
  getIt.registerLazySingleton<DomainMapper<Location, LocationModel>>(
      () => LocationModelMapper());

  getIt.registerLazySingleton<DomainMapper<HourlyForecast, HourlyForecastDTO>>(
      () => HourlyForecastDTOMapper());

  getIt.registerLazySingleton<DomainMapper<DailyForecasts, DailyForecastsDTO>>(
      () => DailyForecastsDTOMapper());

  getIt.registerLazySingleton<DomainMapper<Forecast, ForecastDTO>>(() =>
      ForecastDTOMapper(
          dailyDomainMapper: getIt(), hourlyDomainMapper: getIt()));

  getIt
      .registerLazySingleton<DomainMapper<HourlyForecast, HourlyForecastModel>>(
          () => HourlyForecastModelMapper());

  getIt
      .registerLazySingleton<DomainMapper<DailyForecasts, DailyForecastsModel>>(
          () => DailyForecastsModelMapper());

  getIt.registerLazySingleton<DomainMapper<Forecast, ForecastModel>>(() =>
      ForecastModelMapper(
          dailyDomainMapper: getIt(), hourlyDomainMapper: getIt()));
//
//
//services
  getIt.registerLazySingleton<ConnectivityHelper>(() => ConnectivityHelper());

  getIt.registerLazySingleton<SharedPreferenceHelper>(
      () => SharedPreferenceHelper(plugin: sharedPreferencePlugin),
      instanceName: 'location_sharedPreference');

  getIt.registerLazySingleton<SharedPreferenceHelper>(
      () => SharedPreferenceHelper(plugin: sharedPreferencePlugin),
      instanceName: 'forecast_sharedPreference');
//
//
// Repositories
  getIt.registerLazySingleton<ILocationLocalStorage>(() =>
      LocationLocalStorageImp(
          sharedPreferenceHelper: getIt<SharedPreferenceHelper>(
              instanceName: 'location_sharedPreference'),
          domainMapper: getIt()));

  getIt.registerLazySingleton<IForecastLocalStorage>(
      () => ForecastLocalStorageImp(
            sharedPreferenceHelper: getIt<SharedPreferenceHelper>(
                instanceName: 'forecast_sharedPreference'),
            domainMapper: getIt(),
          ));

  getIt.registerLazySingleton<LocationHttpService>(() => LocationHttpService());
  getIt.registerLazySingleton<ForecastHttpService>(() => ForecastHttpService());

  getIt.registerLazySingleton<ILocationsApiDataFetcher>(
    () => LocationApiDataFetcherImp(
        locationHttpService: getIt(), domainMapper: getIt()),
  );

  getIt.registerLazySingleton<IForecastApiDataFetcher>(() =>
      ForecastApiDataFetcherImp(
          forecastHttpService: getIt(), domainMapper: getIt()));

  getIt.registerLazySingleton<ILocationRepository>(() => LocationRepositoryImp(
      locationLocalStorage: getIt(), locationRemotely: getIt()));

  getIt.registerLazySingleton<IForecastRepository>(() => ForecastRepositoryImp(
      forecastLocalStorage: getIt(), forecastRemotely: getIt()));
//
//
// Use Cases
  getIt.registerLazySingleton<GetPreviousLocationsUseCase>(
      () => GetPreviousLocationsUseCase(locationRepository: getIt()));

  getIt.registerLazySingleton<PickPreviousLocationUseCase>(
      () => PickPreviousLocationUseCase(locationRepository: getIt()));

  getIt.registerLazySingleton<SearchALocationUseCase>(
      () => SearchALocationUseCase(locationRepository: getIt()));

  getIt.registerLazySingleton<RemovePreviousLocationUseCase>(
      () => RemovePreviousLocationUseCase(locationRepository: getIt()));

  getIt.registerLazySingleton<ToggleIsFavoriteLocationUseCase>(
      () => ToggleIsFavoriteLocationUseCase(locationRepository: getIt()));

  getIt.registerLazySingleton<AddToPreviousLocationsUseCase>(
      () => AddToPreviousLocationsUseCase(locationRepository: getIt()));

  getIt.registerLazySingleton<GetRemoteLocationForecastUseCase>(
      () => GetRemoteLocationForecastUseCase(forecastRepository: getIt()));

  getIt.registerLazySingleton<GetCachedLocationForecastUseCase>(
      () => GetCachedLocationForecastUseCase(forecastRepository: getIt()));
  
  getIt.registerLazySingleton<DeleteCachedLocationForecastUseCase>(
      () => DeleteCachedLocationForecastUseCase(forecastRepository: getIt()));
  
  getIt.registerLazySingleton<GetAllLocationsCachedForecastUseCase>(
      () => GetAllLocationsCachedForecastUseCase(forecastRepository: getIt()));
//
//
// State Management
  getIt.registerFactory<ManageLocationsBloc>(() => ManageLocationsBloc(
        getPreviousLocationsUseCase: getIt(),
        pickPreviousLocationUseCase: getIt(),
        removePreviousLocationUseCase: getIt(),
        searchALocationUseCase: getIt(),
        toggleIsFavoriteLocationUseCase: getIt(),
        addToPreviousLocationsUseCase: getIt(),
      ));

  getIt.registerFactory<ManageForecastCubit>(() => ManageForecastCubit(
      getRemoteLocationForecastUseCase: getIt(),
      getCacheLocationForecastUseCase: getIt(),
      deleteCacheLocationForecastUseCase: getIt(),
      getAllLocationsCachedForecastUseCase: getIt(),
      ));

  getIt.registerFactory<ConnectivityCubit>(
      () => ConnectivityCubit(connectivityHelper: getIt()));
}
