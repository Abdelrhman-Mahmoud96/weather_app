import 'dart:convert';
import 'package:weather_app_task/core/errors/local/shared_preference_exceptions.dart';
import 'package:weather_app_task/core/mappers/domain_mapper.dart';
import 'package:weather_app_task/features/data/data_sources/local/forecast/i_forecast_local_storage.dart';
import 'package:weather_app_task/features/data/data_sources/local/shared_preference_helper.dart';
import 'package:weather_app_task/features/data/models/forecast/local/forecast_model.dart';
import 'package:weather_app_task/features/domain/entities/forecast/forecast.dart';

class ForecastLocalStorageImp implements IForecastLocalStorage {
  ForecastLocalStorageImp({
    required this.sharedPreferenceHelper,
    required this.domainMapper,
  });

  final SharedPreferenceHelper sharedPreferenceHelper;
  final DomainMapper<Forecast, ForecastModel> domainMapper;

  @override
  Future<void> cacheLocationForecastData(
      Forecast forecastData, String locationId) async {
    final forecastModel = domainMapper.toDomain(Forecast(
        dailyForecasts: forecastData.dailyForecasts,
        hourlyForecast: forecastData.hourlyForecast));

    await sharedPreferenceHelper.setValue(
        locationId, json.encode(forecastModel));
  }

  @override
  Future<Forecast> loadLocationForecastData(String locationId) async {
    final locationCachedForecast = sharedPreferenceHelper.getValue(locationId);

    if (locationCachedForecast != null) {
      final locationForecastJson =
          json.decode(locationCachedForecast) as Map<String, dynamic>;
      return domainMapper
          .fromDomain(ForecastModel.fromJson(locationForecastJson));
    } else {
      throw SharedPreferenceException(
          exceptionMessage:
              'TRIED TO LOAD FORECAST DATA FORE A NON EXISTING LOCATION, METHOD: loadLocationForecastData');
      // return const Forecast(dailyForecasts: [], hourlyForecast: []);
    }
  }

  @override
  Future<void> deleteLocationForecastData(String locationId) async {
    final locationCachedForecast = sharedPreferenceHelper.getValue(locationId);

    if (locationCachedForecast != null) {
      sharedPreferenceHelper.deleteValue(locationId);
    } else {
      throw SharedPreferenceException(
          exceptionMessage:
              'TRIED TO DELETE FORECAST DATA FORE A NON EXISTING LOCATION, METHOD: loadLocationForecastData');
      // return const Forecast(dailyForecasts: [], hourlyForecast: []);
    }
  }

  @override
  Future<List<Map<String, Forecast>>> loadAllLocationsForecastData() async {
    final keys = sharedPreferenceHelper.getKeys();
    final locationsForecastList = <Map<String, Forecast>>[];

    if (keys.isNotEmpty) {
      for (String key in keys) {
        final locationCachedForecast = sharedPreferenceHelper.getValue(key);
        if (locationCachedForecast != null) {
          final locationForecastJson =
              json.decode(locationCachedForecast) as Map<String, dynamic>;
          locationsForecastList.add({
            key: domainMapper
                .fromDomain(ForecastModel.fromJson(locationForecastJson))
          });
        } else {
          throw SharedPreferenceException(
              exceptionMessage:
                  'TRIED TO LOAD FORECAST DATA FOR A NON EXISTING LOCATION(S), METHOD: loadLocationForecastData');
          // return const Forecast(dailyForecasts: [], hourlyForecast: []);
        }
      }
    }
    return locationsForecastList;
  }
}
