// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'daily_forecasts_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

DailyForecastsDTO _$DailyForecastsDTOFromJson(Map<String, dynamic> json) =>
    DailyForecastsDTO(
      epochDate: json['EpochDate'] as int?,
      sunInfo: json['Sun'] == null
          ? null
          : DailySunInfo.fromJson(json['Sun'] as Map<String, dynamic>),
      temperature: json['Temperature'] == null
          ? null
          : DailyTemperature.fromJson(
              json['Temperature'] as Map<String, dynamic>),
      dayTimeInfo: json['Day'] == null
          ? null
          : DayNightTimeInfo.fromJson(json['Day'] as Map<String, dynamic>),
      nightTimeInfo: json['Night'] == null
          ? null
          : DayNightTimeInfo.fromJson(json['Night'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$DailyForecastsDTOToJson(DailyForecastsDTO instance) =>
    <String, dynamic>{
      'EpochDate': instance.epochDate,
      'Sun': instance.sunInfo,
      'Temperature': instance.temperature,
      'Day': instance.dayTimeInfo,
      'Night': instance.nightTimeInfo,
    };
