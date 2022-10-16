part of 'manage_forecast_cubit.dart';

enum ManageForecastStatus { initial, loading, loaded, failed }

@freezed
class ManageForecastState with _$ManageForecastState {
  const factory ManageForecastState({
    @Default(ManageForecastStatus.initial) ManageForecastStatus? manageForecastStatus,
    Forecast? forecast,
    List<Map<String, Forecast>>? allLocationsForecast,
    @Default('') String? errorMessage,
  }) = _ManageForecastState;
}




