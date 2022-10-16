import 'package:weather_app_task/core/mappers/domain_mapper.dart';
import 'package:weather_app_task/features/data/models/forecast/local/hourly/local/hourly_forecast_model.dart';
import 'package:weather_app_task/features/domain/entities/forecast/hourly/hourly_forecast.dart';

class HourlyForecastModelMapper
    extends DomainMapper<HourlyForecast, HourlyForecastModel> {
  @override
  HourlyForecast fromDomain(HourlyForecastModel domain) {
    return HourlyForecast(
        epochDate: domain.date,
        weatherIcon: domain.weatherIcon,
        temperaturePhrase: domain.temperaturePhrase,
        isDayLight: domain.isDayLight,
        temperature: domain.temperature,
        windInfo: domain.windInfo,
        humidity: domain.humidity,
        rainProbability: domain.rainProbability,
        snowProbability: domain.snowProbability);
  }

  @override
  HourlyForecastModel toDomain(HourlyForecast entity) {
    return HourlyForecastModel(
        date: entity.epochDate,
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
