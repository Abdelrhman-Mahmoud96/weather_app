// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'location_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_LocationModel _$$_LocationModelFromJson(Map<String, dynamic> json) =>
    _$_LocationModel(
      locationId: json['locationId'] as String,
      locationName: json['locationName'] as String,
      country: CountryDTO.fromJson(json['country'] as Map<String, dynamic>),
      isFavorite: json['isFavorite'] as bool,
    );

Map<String, dynamic> _$$_LocationModelToJson(_$_LocationModel instance) =>
    <String, dynamic>{
      'locationId': instance.locationId,
      'locationName': instance.locationName,
      'country': instance.country,
      'isFavorite': instance.isFavorite,
    };
