import 'package:weather_app_task/core/mappers/domain_mapper.dart';
import 'package:weather_app_task/features/data/models/forecast/remote/hourly/remote/hourly_forecast_dto.dart';
import 'package:weather_app_task/features/domain/entities/forecast/hourly/hourly_forecast.dart';

class HourlyForecastDTOMapper
    extends DomainMapper<HourlyForecast, HourlyForecastDTO> {
  @override
  HourlyForecast fromDomain(HourlyForecastDTO domain) {
    return HourlyForecast(
        epochDate: domain.epochDate!,
        weatherIcon: domain.weatherIcon!,
        temperaturePhrase: domain.temperaturePhrase!,
        isDayLight: domain.isDayLight,
        temperature: domain.temperature!,
        windInfo: domain.windInfo!,
        humidity: domain.humidity!,
        rainProbability: domain.rainProbability!,
        snowProbability: domain.snowProbability!);
  }

  @override
  HourlyForecastDTO toDomain(HourlyForecast entity) {
    return HourlyForecastDTO(
        epochDate: entity.epochDate,
        weatherIcon: entity.weatherIcon,
        temperaturePhrase: entity.temperaturePhrase,
        isDayLight: entity.isDayLight,
        temperature: entity.temperature,
        windInfo: entity.windInfo,
        humidity: entity.humidity,
        rainProbability: entity.rainProbability,
        snowProbability: entity.snowProbability);
  }
}
