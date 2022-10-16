import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:weather_app_task/features/data/models/forecast/remote/daily/remote/daily_forecasts_dto.dart';
import 'package:weather_app_task/features/data/models/forecast/remote/hourly/remote/hourly_forecast_dto.dart';


part 'forecast_dto.freezed.dart';
part 'forecast_dto.g.dart';

@freezed
class ForecastDTO with _$ForecastDTO {
  const factory ForecastDTO({
   required List<DailyForecastsDTO> dailyForecasts,
   required List<HourlyForecastDTO> hourlyForecasts,
  }) = _ForecastModel;  

  factory ForecastDTO.fromJson(Map<String, dynamic> data) =>
      _$ForecastDTOFromJson(data);
 
}