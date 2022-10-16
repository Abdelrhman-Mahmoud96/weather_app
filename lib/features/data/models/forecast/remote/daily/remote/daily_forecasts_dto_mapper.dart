import 'package:weather_app_task/core/mappers/domain_mapper.dart';
import 'package:weather_app_task/features/data/models/forecast/remote/daily/remote/daily_forecasts_dto.dart';
import 'package:weather_app_task/features/domain/entities/forecast/daily/daily_forecasts.dart';


class DailyForecastsDTOMapper
    extends DomainMapper<DailyForecasts, DailyForecastsDTO> {
      
  @override
  DailyForecasts fromDomain(DailyForecastsDTO domain) {
    return DailyForecasts(
        epochDate: domain.epochDate!,
        sunInfo: domain.sunInfo!,
        temperature: domain.temperature!,
        dayTimeInfo: domain.dayTimeInfo!,
        nightTimeInfo: domain.nightTimeInfo!,
        );
  }

  @override
  DailyForecastsDTO toDomain(DailyForecasts entity) {
    return DailyForecastsDTO(
        epochDate: entity.epochDate,
        sunInfo: entity.sunInfo,
        temperature: entity.temperature,
        dayTimeInfo: entity.dayTimeInfo,
        nightTimeInfo: entity.nightTimeInfo,
        );
  }
}
