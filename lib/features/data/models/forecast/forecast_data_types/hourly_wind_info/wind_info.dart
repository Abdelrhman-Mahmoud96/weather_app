import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:weather_app_task/features/data/models/forecast/forecast_data_types/forecast_measure/forecast_measure.dart';

part 'wind_info.g.dart';

@JsonSerializable()
class WindInfo extends Equatable {
  const WindInfo({
    this.speed,
  });

  @JsonKey(name: 'Speed')
  final ForecastMeasure? speed;

  static WindInfo fromJson(Map<String, dynamic> json) =>
      _$WindInfoFromJson(json);
  Map<String, dynamic> toJson() => _$WindInfoToJson(this);

  @override
  List<Object?> get props => [speed];
}
