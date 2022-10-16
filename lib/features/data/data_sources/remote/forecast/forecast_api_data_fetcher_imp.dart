import 'dart:convert';
import 'package:weather_app_task/core/mappers/domain_mapper.dart';
import 'package:weather_app_task/features/data/data_sources/remote/constants.dart';
import 'package:weather_app_task/features/data/data_sources/remote/forecast/forecast_http_service.dart';
import 'package:weather_app_task/features/data/data_sources/remote/forecast/i_forecast_api_data_fetcher.dart';
import 'package:weather_app_task/features/data/models/forecast/remote/daily/remote/daily_forecasts_dto.dart';
import 'package:weather_app_task/features/data/models/forecast/remote/forecast_dto.dart';
import 'package:weather_app_task/features/data/models/forecast/remote/hourly/remote/hourly_forecast_dto.dart';
import 'package:weather_app_task/features/domain/entities/forecast/forecast.dart';

class ForecastApiDataFetcherImp implements IForecastApiDataFetcher {
  const ForecastApiDataFetcherImp({
    required this.forecastHttpService,
    required this.domainMapper,
  });


  final ForecastHttpService forecastHttpService;
  final DomainMapper<Forecast, ForecastDTO> domainMapper;

  @override
  Future<Forecast> getForecastDataFromApi(String locationId) async {
    final dailyForecastApiData = await _getDailyForecastDataFromApi(locationId);
    final hourlyForecastApiData =
        await _getHourlyForecastDataFromApi(locationId);

    return domainMapper.fromDomain(ForecastDTO(
        dailyForecasts: dailyForecastApiData,
        hourlyForecasts: hourlyForecastApiData));
  }

  Future<List<DailyForecastsDTO>> _getDailyForecastDataFromApi(
    String locationId,
  ) async {
    final returnedResponse = await forecastHttpService.sendRequest(
        locationId, kLocationDailyForecastPath);

    final responseJson =
        json.decode(returnedResponse.body) as Map<String, dynamic>;

    return responseJson['DailyForecasts']
        .map<DailyForecastsDTO>((dailyForecastJson) => DailyForecastsDTO.fromJson(
            Map<String, dynamic>.from(dailyForecastJson)))
        .toList();    
  }

  Future<List<HourlyForecastDTO>> _getHourlyForecastDataFromApi(
      String locationId) async {
    final returnedResponse = await forecastHttpService.sendRequest(
        locationId, kLocationHourlyForecastPath);

    return List<Map>.from(json.decode(returnedResponse.body) as List)
        .map((hourlyForecastJson) => HourlyForecastDTO.fromJson(
            Map<String, dynamic>.from(hourlyForecastJson)))
        .toList();
  }
}
