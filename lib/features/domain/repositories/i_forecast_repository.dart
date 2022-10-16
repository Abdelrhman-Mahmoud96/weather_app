import 'package:weather_app_task/features/domain/entities/forecast/forecast.dart';

abstract class IForecastRepository {
  Future<Forecast> getRemoteLocationForecast(String locationId);
  Future<Forecast> getCachedLocationForecast(String locationId);
  Future<List<Map<String, Forecast>>> getAllLocationsCachedForecast();
  Future<void> deleteCachedLocationForecast(String locationId);
}
