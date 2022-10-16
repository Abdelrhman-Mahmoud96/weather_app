import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:weather_app_task/features/data/models/forecast/forecast_data_types/forecast_measure/forecast_measure.dart';


part 'daily_temperature.g.dart';

@JsonSerializable()
class DailyTemperature extends Equatable{
  const DailyTemperature({this.min, this.max});

  @JsonKey(name: 'Minimum')
  final ForecastMeasure? min;
  @JsonKey(name: 'Maximum')
  final ForecastMeasure? max;

  static DailyTemperature fromJson(Map<String, dynamic> json) => _$DailyTemperatureFromJson(json);
   Map<String, dynamic> toJson() => _$DailyTemperatureToJson(this);
  
  @override
  List<Object?> get props => [min, max];
}