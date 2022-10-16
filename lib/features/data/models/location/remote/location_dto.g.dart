// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'location_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

LocationDTO _$LocationDTOFromJson(Map<String, dynamic> json) => LocationDTO(
      locationId: json['Key'] as String?,
      locationName: json['LocalizedName'] as String?,
      country: json['Country'] == null
          ? null
          : CountryDTO.fromJson(json['Country'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$LocationDTOToJson(LocationDTO instance) =>
    <String, dynamic>{
      'Key': instance.locationId,
      'LocalizedName': instance.locationName,
      'Country': instance.country,
    };
