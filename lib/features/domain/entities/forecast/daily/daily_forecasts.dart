import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:weather_app_task/features/data/models/forecast/forecast_data_types/daily_sun_info/daily_sun_info.dart';
import 'package:weather_app_task/features/data/models/forecast/forecast_data_types/daily_temperature/daily_temperature.dart';
import 'package:weather_app_task/features/data/models/forecast/forecast_data_types/day_and_night/day_night_time_info.dart';


part 'daily_forecasts.freezed.dart';

@freezed
class DailyForecasts with _$DailyForecasts {
  const factory DailyForecasts({
    required int epochDate,
    required DailySunInfo sunInfo,
    required DailyTemperature temperature,
    required DayNightTimeInfo dayTimeInfo,
    required DayNightTimeInfo nightTimeInfo,
  }) = _DailyForecasts;
}
