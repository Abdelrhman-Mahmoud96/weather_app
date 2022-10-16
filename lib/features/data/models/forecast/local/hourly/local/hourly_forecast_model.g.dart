// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'hourly_forecast_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_HourlyForecastModel _$$_HourlyForecastModelFromJson(
        Map<String, dynamic> json) =>
    _$_HourlyForecastModel(
      date: json['date'] as int,
      weatherIcon: json['weatherIcon'] as int,
      temperaturePhrase: json['temperaturePhrase'] as String,
      isDayLight: json['isDayLight'] as bool,
      temperature:
          ForecastMeasure.fromJson(json['temperature'] as Map<String, dynamic>),
      windInfo: WindInfo.fromJson(json['windInfo'] as Map<String, dynamic>),
      humidity: json['humidity'] as int,
      rainProbability: json['rainProbability'] as int,
      snowProbability: json['snowProbability'] as int,
    );

Map<String, dynamic> _$$_HourlyForecastModelToJson(
        _$_HourlyForecastModel instance) =>
    <String, dynamic>{
      'date': instance.date,
      'weatherIcon': instance.weatherIcon,
      'temperaturePhrase': instance.temperaturePhrase,
      'isDayLight': instance.isDayLight,
      'temperature': instance.temperature,
      'windInfo': instance.windInfo,
      'humidity': instance.humidity,
      'rainProbability': instance.rainProbability,
      'snowProbability': instance.snowProbability,
    };
