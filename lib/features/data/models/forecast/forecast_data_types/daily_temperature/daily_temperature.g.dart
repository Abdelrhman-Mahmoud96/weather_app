// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'daily_temperature.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

DailyTemperature _$DailyTemperatureFromJson(Map<String, dynamic> json) =>
    DailyTemperature(
      min: json['Minimum'] == null
          ? null
          : ForecastMeasure.fromJson(json['Minimum'] as Map<String, dynamic>),
      max: json['Maximum'] == null
          ? null
          : ForecastMeasure.fromJson(json['Maximum'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$DailyTemperatureToJson(DailyTemperature instance) =>
    <String, dynamic>{
      'Minimum': instance.min,
      'Maximum': instance.max,
    };
