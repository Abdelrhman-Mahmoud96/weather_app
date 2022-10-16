import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:weather_app_task/features/data/models/forecast/local/daily/local/daily_forecasts_model.dart';
import 'package:weather_app_task/features/data/models/forecast/local/hourly/local/hourly_forecast_model.dart';


part 'forecast_model.freezed.dart';
part 'forecast_model.g.dart';

@freezed
class ForecastModel with _$ForecastModel {
  const factory ForecastModel({
   required List<DailyForecastsModel> dailyForecasts,
   required List<HourlyForecastModel> hourlyForecasts,
  }) = _ForecastModel;  

  factory ForecastModel.fromJson(Map<String, dynamic> data) =>
      _$ForecastModelFromJson(data);
 
}