// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'forecast_measure.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ForecastMeasure _$ForecastMeasureFromJson(Map<String, dynamic> json) =>
    ForecastMeasure(
      value: (json['Value'] as num?)?.toDouble(),
      unit: json['Unit'] as String?,
    );

Map<String, dynamic> _$ForecastMeasureToJson(ForecastMeasure instance) =>
    <String, dynamic>{
      'Value': instance.value,
      'Unit': instance.unit,
    };
