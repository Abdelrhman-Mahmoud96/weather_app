// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'forecast_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_ForecastModel _$$_ForecastModelFromJson(Map<String, dynamic> json) =>
    _$_ForecastModel(
      dailyForecasts: (json['dailyForecasts'] as List<dynamic>)
          .map((e) => DailyForecastsModel.fromJson(e as Map<String, dynamic>))
          .toList(),
      hourlyForecasts: (json['hourlyForecasts'] as List<dynamic>)
          .map((e) => HourlyForecastModel.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$_ForecastModelToJson(_$_ForecastModel instance) =>
    <String, dynamic>{
      'dailyForecasts': instance.dailyForecasts,
      'hourlyForecasts': instance.hourlyForecasts,
    };
