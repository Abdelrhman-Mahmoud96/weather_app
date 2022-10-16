import 'package:equatable/equatable.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:weather_app_task/features/data/models/forecast/forecast_data_types/forecast_measure/forecast_measure.dart';
import 'package:weather_app_task/features/data/models/forecast/forecast_data_types/hourly_wind_info/wind_info.dart';

part 'hourly_forecast_dto.g.dart';

@JsonSerializable()
class HourlyForecastDTO extends Equatable {
  const HourlyForecastDTO({
    this.epochDate,
    this.weatherIcon,
    this.temperaturePhrase,
    this.isDayLight = false,
    this.temperature,
    this.windInfo,
    this.humidity,
    this.rainProbability,
    this.snowProbability,
  });

  @JsonKey(name: 'EpochDateTime')
  final int? epochDate;

  @JsonKey(name: 'WeatherIcon')
  final int? weatherIcon;

  @JsonKey(name: 'IconPhrase')
  final String? temperaturePhrase;

  @JsonKey(name: 'IsDaylight')
  final bool isDayLight;

  @JsonKey(name: 'Temperature')
  final ForecastMeasure? temperature;

  @JsonKey(name: 'Wind')
  final WindInfo? windInfo;

  @JsonKey(name: 'RelativeHumidity')
  final int? humidity;

  @JsonKey(name: 'RainProbability')
  final int? rainProbability;

  @JsonKey(name: 'SnowProbability')
  final int? snowProbability;

  static HourlyForecastDTO fromJson(Map<String, dynamic> data) =>
      _$HourlyForecastDTOFromJson(data);
  Map<String, dynamic> toJson() => _$HourlyForecastDTOToJson(this);

  @override
  List<Object?> get props => [
        epochDate,
        weatherIcon,
        temperaturePhrase,
        isDayLight,
        temperature,
        windInfo,
        humidity,
        rainProbability,
        snowProbability,
      ];
}
