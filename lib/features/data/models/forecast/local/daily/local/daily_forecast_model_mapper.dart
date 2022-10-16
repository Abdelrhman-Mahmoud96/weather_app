import 'package:weather_app_task/core/mappers/domain_mapper.dart';
import 'package:weather_app_task/features/data/models/forecast/local/daily/local/daily_forecasts_model.dart';
import 'package:weather_app_task/features/domain/entities/forecast/daily/daily_forecasts.dart';


class DailyForecastsModelMapper
    extends DomainMapper<DailyForecasts, DailyForecastsModel> {

  @override
  DailyForecasts fromDomain(DailyForecastsModel domain) {
    return DailyForecasts(
        epochDate: domain.epochDate,
        sunInfo: domain.sunInfo,
        temperature: domain.temperature,
        dayTimeInfo: domain.dayTimeInfo,
        nightTimeInfo: domain.nightTimeInfo,
        );
  }

  @override
  DailyForecastsModel toDomain(DailyForecasts entity) {
    return DailyForecastsModel(
        epochDate: entity.epochDate,
        sunInfo: entity.sunInfo,
        temperature: entity.temperature,
        dayTimeInfo: entity.dayTimeInfo,
        nightTimeInfo: entity.nightTimeInfo,
        );
  }
}
