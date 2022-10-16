import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:weather_app_task/features/domain/entities/forecast/daily/daily_forecasts.dart';
import 'package:weather_app_task/features/domain/entities/forecast/hourly/hourly_forecast.dart';


part 'forecast.freezed.dart';

@freezed
class Forecast with _$Forecast{
  const factory Forecast({
    required List<DailyForecasts> dailyForecasts,
    required List<HourlyForecast> hourlyForecast,
  }) = _Forecast;
}