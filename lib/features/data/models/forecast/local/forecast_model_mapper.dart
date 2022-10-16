import 'package:weather_app_task/core/mappers/domain_mapper.dart';
import 'package:weather_app_task/features/data/models/forecast/local/daily/local/daily_forecasts_model.dart';
import 'package:weather_app_task/features/data/models/forecast/local/forecast_model.dart';
import 'package:weather_app_task/features/data/models/forecast/local/hourly/local/hourly_forecast_model.dart';
import 'package:weather_app_task/features/domain/entities/forecast/daily/daily_forecasts.dart';

import 'package:weather_app_task/features/domain/entities/forecast/forecast.dart';
import 'package:weather_app_task/features/domain/entities/forecast/hourly/hourly_forecast.dart';

class ForecastModelMapper implements DomainMapper<Forecast, ForecastModel> {
  const ForecastModelMapper({
    required this.dailyDomainMapper,
    required this.hourlyDomainMapper,
  });

  final DomainMapper<DailyForecasts, DailyForecastsModel> dailyDomainMapper;
  final DomainMapper<HourlyForecast, HourlyForecastModel> hourlyDomainMapper;

  @override
  Forecast fromDomain(ForecastModel domain) {

    final dailyForecastData = domain.dailyForecasts
        .map((location) => dailyDomainMapper.fromDomain(location))
        .toList();
    
    final hourlyForecastData = domain.hourlyForecasts
        .map((location) => hourlyDomainMapper.fromDomain(location))
        .toList();

    return Forecast(
      dailyForecasts: dailyForecastData,
      hourlyForecast: hourlyForecastData,
    );
  }

  @override
  ForecastModel toDomain(Forecast entity) {
    final dailyForecastDataModel = entity.dailyForecasts
        .map((location) => dailyDomainMapper.toDomain(location))
        .toList();
    
    final hourlyForecastDataModel = entity.hourlyForecast
        .map((location) => hourlyDomainMapper.toDomain(location))
        .toList();

    return ForecastModel(
      dailyForecasts: dailyForecastDataModel,
      hourlyForecasts: hourlyForecastDataModel,
    );
  }  
}
