import 'package:weather_app_task/features/domain/entities/forecast/forecast.dart';

abstract class IForecastLocalStorage {
  Future<void> cacheLocationForecastData(
      Forecast dailyForecastData, String locationId);

  Future<Forecast> loadLocationForecastData(String locationId);
  Future<List<Map<String, Forecast>>> loadAllLocationsForecastData();

  Future<void> deleteLocationForecastData(String locationId);
}
