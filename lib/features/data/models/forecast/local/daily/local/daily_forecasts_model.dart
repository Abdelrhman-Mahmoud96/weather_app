import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:weather_app_task/features/data/models/forecast/forecast_data_types/daily_sun_info/daily_sun_info.dart';
import 'package:weather_app_task/features/data/models/forecast/forecast_data_types/daily_temperature/daily_temperature.dart';
import 'package:weather_app_task/features/data/models/forecast/forecast_data_types/day_and_night/day_night_time_info.dart';

part 'daily_forecasts_model.freezed.dart';
part 'daily_forecasts_model.g.dart';

@freezed
class DailyForecastsModel with _$DailyForecastsModel {
  const factory DailyForecastsModel({
   required int epochDate,
    required DailySunInfo sunInfo,
    required DailyTemperature temperature,
    required DayNightTimeInfo dayTimeInfo,
    required DayNightTimeInfo nightTimeInfo,
  }) = _DailyForecastsModel;  

  factory DailyForecastsModel.fromJson(Map<String, dynamic> data) =>
      _$DailyForecastsModelFromJson(data);
 
}
