import 'package:weather_app_task/features/data/data_sources/local/forecast/i_forecast_local_storage.dart';
import 'package:weather_app_task/features/data/data_sources/remote/forecast/i_forecast_api_data_fetcher.dart';
import 'package:weather_app_task/features/domain/entities/forecast/forecast.dart';
import 'package:weather_app_task/features/domain/repositories/i_forecast_repository.dart';

class ForecastRepositoryImp implements IForecastRepository {
  const ForecastRepositoryImp({
    required this.forecastLocalStorage,
    required this.forecastRemotely,
  });

  final IForecastLocalStorage forecastLocalStorage;
  final IForecastApiDataFetcher forecastRemotely;

  @override
  Future<Forecast> getCachedLocationForecast(String locationId) async {
    // and load the cached data
    final currentLocationCachedData =
        await forecastLocalStorage.loadLocationForecastData(locationId);
    return currentLocationCachedData;
  }

  @override
  Future<Forecast> getRemoteLocationForecast(String locationId) async {
    // get the data form api
    Forecast currentLocationForecastApiData =
        await forecastRemotely.getForecastDataFromApi(locationId);
    // cache it in local shared preference
    await forecastLocalStorage.cacheLocationForecastData(
        currentLocationForecastApiData, locationId);

    return currentLocationForecastApiData;
  }

  @override
  Future<void> deleteCachedLocationForecast(String locationId) async {
    await forecastLocalStorage.deleteLocationForecastData(locationId);
  }

  @override
  Future<List<Map<String, Forecast>>> getAllLocationsCachedForecast() async {
    // and load the cached data
    final allLocationsCachedData =
        await forecastLocalStorage.loadAllLocationsForecastData();
    return allLocationsCachedData;
  }
}
