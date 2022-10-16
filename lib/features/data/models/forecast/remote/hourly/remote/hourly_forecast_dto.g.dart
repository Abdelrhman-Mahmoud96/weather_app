// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'hourly_forecast_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

HourlyForecastDTO _$HourlyForecastDTOFromJson(Map<String, dynamic> json) =>
    HourlyForecastDTO(
      epochDate: json['EpochDateTime'] as int?,
      weatherIcon: json['WeatherIcon'] as int?,
      temperaturePhrase: json['IconPhrase'] as String?,
      isDayLight: json['IsDaylight'] as bool? ?? false,
      temperature: json['Temperature'] == null
          ? null
          : ForecastMeasure.fromJson(
              json['Temperature'] as Map<String, dynamic>),
      windInfo: json['Wind'] == null
          ? null
          : WindInfo.fromJson(json['Wind'] as Map<String, dynamic>),
      humidity: json['RelativeHumidity'] as int?,
      rainProbability: json['RainProbability'] as int?,
      snowProbability: json['SnowProbability'] as int?,
    );

Map<String, dynamic> _$HourlyForecastDTOToJson(HourlyForecastDTO instance) =>
    <String, dynamic>{
      'EpochDateTime': instance.epochDate,
      'WeatherIcon': instance.weatherIcon,
      'IconPhrase': instance.temperaturePhrase,
      'IsDaylight': instance.isDayLight,
      'Temperature': instance.temperature,
      'Wind': instance.windInfo,
      'RelativeHumidity': instance.humidity,
      'RainProbability': instance.rainProbability,
      'SnowProbability': instance.snowProbability,
    };
