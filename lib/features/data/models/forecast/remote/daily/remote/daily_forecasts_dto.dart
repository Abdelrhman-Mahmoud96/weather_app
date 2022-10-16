import 'package:equatable/equatable.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:weather_app_task/features/data/models/forecast/forecast_data_types/daily_sun_info/daily_sun_info.dart';
import 'package:weather_app_task/features/data/models/forecast/forecast_data_types/daily_temperature/daily_temperature.dart';
import 'package:weather_app_task/features/data/models/forecast/forecast_data_types/day_and_night/day_night_time_info.dart';

part 'daily_forecasts_dto.g.dart';

@JsonSerializable()
class DailyForecastsDTO extends Equatable {
  const DailyForecastsDTO({
    this.epochDate,
    this.sunInfo,
    this.temperature,
    this.dayTimeInfo,
    this.nightTimeInfo,
  });

  @JsonKey(name: 'EpochDate')
  final int? epochDate;

  @JsonKey(name: 'Sun')
  final DailySunInfo? sunInfo;

  @JsonKey(name: 'Temperature')
  final DailyTemperature? temperature;
  
  @JsonKey(name: 'Day')
  final DayNightTimeInfo? dayTimeInfo;
  @JsonKey(name: 'Night')
  final DayNightTimeInfo? nightTimeInfo;

  static DailyForecastsDTO fromJson(Map<String, dynamic> data) =>
      _$DailyForecastsDTOFromJson(data);
  Map<String, dynamic> toJson() => _$DailyForecastsDTOToJson(this);

  @override
  List<Object?> get props => [
        epochDate,
        sunInfo,
        temperature,
        dayTimeInfo,
        nightTimeInfo,
      ];
}
