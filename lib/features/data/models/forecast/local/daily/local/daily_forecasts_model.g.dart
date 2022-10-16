// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'daily_forecasts_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_DailyForecastsModel _$$_DailyForecastsModelFromJson(
        Map<String, dynamic> json) =>
    _$_DailyForecastsModel(
      epochDate: json['epochDate'] as int,
      sunInfo: DailySunInfo.fromJson(json['sunInfo'] as Map<String, dynamic>),
      temperature: DailyTemperature.fromJson(
          json['temperature'] as Map<String, dynamic>),
      dayTimeInfo: DayNightTimeInfo.fromJson(
          json['dayTimeInfo'] as Map<String, dynamic>),
      nightTimeInfo: DayNightTimeInfo.fromJson(
          json['nightTimeInfo'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$_DailyForecastsModelToJson(
        _$_DailyForecastsModel instance) =>
    <String, dynamic>{
      'epochDate': instance.epochDate,
      'sunInfo': instance.sunInfo,
      'temperature': instance.temperature,
      'dayTimeInfo': instance.dayTimeInfo,
      'nightTimeInfo': instance.nightTimeInfo,
    };
