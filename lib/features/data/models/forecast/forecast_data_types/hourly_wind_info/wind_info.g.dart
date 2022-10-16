// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'wind_info.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

WindInfo _$WindInfoFromJson(Map<String, dynamic> json) => WindInfo(
      speed: json['Speed'] == null
          ? null
          : ForecastMeasure.fromJson(json['Speed'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$WindInfoToJson(WindInfo instance) => <String, dynamic>{
      'Speed': instance.speed,
    };
