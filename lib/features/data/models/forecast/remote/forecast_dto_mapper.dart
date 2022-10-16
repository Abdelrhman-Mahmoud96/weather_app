import 'package:weather_app_task/core/mappers/domain_mapper.dart';
import 'package:weather_app_task/features/data/models/forecast/remote/daily/remote/daily_forecasts_dto.dart';
import 'package:weather_app_task/features/data/models/forecast/remote/forecast_dto.dart';
import 'package:weather_app_task/features/data/models/forecast/remote/hourly/remote/hourly_forecast_dto.dart';
import 'package:weather_app_task/features/domain/entities/forecast/daily/daily_forecasts.dart';
import 'package:weather_app_task/features/domain/entities/forecast/forecast.dart';
import 'package:weather_app_task/features/domain/entities/forecast/hourly/hourly_forecast.dart';

class ForecastDTOMapper implements DomainMapper<Forecast, ForecastDTO> {
  const ForecastDTOMapper({
    required this.dailyDomainMapper,
    required this.hourlyDomainMapper,
  });

  final DomainMapper<DailyForecasts, DailyForecastsDTO> dailyDomainMapper;
  final DomainMapper<HourlyForecast, HourlyForecastDTO> hourlyDomainMapper;

  @override
  Forecast fromDomain(ForecastDTO domain) {

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
  ForecastDTO toDomain(Forecast entity) {
    final dailyForecastDataModel = entity.dailyForecasts
        .map((location) => dailyDomainMapper.toDomain(location))
        .toList();
    
    final hourlyForecastDataModel = entity.hourlyForecast
        .map((location) => hourlyDomainMapper.toDomain(location))
        .toList();

    return ForecastDTO(
      dailyForecasts: dailyForecastDataModel,
      hourlyForecasts: hourlyForecastDataModel,
    );
  }  
}
