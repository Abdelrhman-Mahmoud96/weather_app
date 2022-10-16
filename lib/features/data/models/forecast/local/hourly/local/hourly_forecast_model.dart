import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:weather_app_task/features/data/models/forecast/forecast_data_types/forecast_measure/forecast_measure.dart';
import 'package:weather_app_task/features/data/models/forecast/forecast_data_types/hourly_wind_info/wind_info.dart';

part 'hourly_forecast_model.freezed.dart';
part 'hourly_forecast_model.g.dart';

@freezed
class HourlyForecastModel with _$HourlyForecastModel {
  const factory HourlyForecastModel({
   required int date,
   required int weatherIcon,
   required String temperaturePhrase,
   required bool isDayLight,
   required ForecastMeasure temperature,
   required WindInfo windInfo,
   required int humidity,
   required int rainProbability,
   required int snowProbability,
  }) = _HourlyForecastModel;  

  factory HourlyForecastModel.fromJson(Map<String, dynamic> data) =>
      _$HourlyForecastModelFromJson(data);
 
}
