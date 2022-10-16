import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:weather_app_task/features/data/models/forecast/forecast_data_types/hourly_wind_info/wind_info.dart';
import 'package:weather_app_task/features/data/models/forecast/forecast_data_types/forecast_measure/forecast_measure.dart';

part 'hourly_forecast.freezed.dart';

@freezed
class HourlyForecast with _$HourlyForecast{
  const factory HourlyForecast({
    required int epochDate,
    required int weatherIcon,
    required String temperaturePhrase,
    required bool isDayLight,
    required ForecastMeasure temperature,
    required WindInfo windInfo,
    required int humidity,
    required int rainProbability,
    required int snowProbability,    
  }) = _HourlyForecast;
}