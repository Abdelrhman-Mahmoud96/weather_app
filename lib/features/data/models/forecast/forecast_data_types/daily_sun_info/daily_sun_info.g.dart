// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'daily_sun_info.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

DailySunInfo _$DailySunInfoFromJson(Map<String, dynamic> json) => DailySunInfo(
      riseTime: json['EpochRise'] as int?,
      setTime: json['EpochSet'] as int?,
    );

Map<String, dynamic> _$DailySunInfoToJson(DailySunInfo instance) =>
    <String, dynamic>{
      'EpochRise': instance.riseTime,
      'EpochSet': instance.setTime,
    };
