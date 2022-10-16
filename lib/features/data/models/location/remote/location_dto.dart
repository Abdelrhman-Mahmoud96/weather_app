import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:weather_app_task/features/data/models/location/remote/country/country_dto.dart';

part 'location_dto.g.dart';

@JsonSerializable()
class LocationDTO {
  const LocationDTO({
    this.locationId,
    this.locationName,
    this.country,
  });

  @JsonKey(name: 'Key')
  final String? locationId;
  @JsonKey(name: 'LocalizedName')
  final String? locationName;
  @JsonKey(name: 'Country')
  final CountryDTO? country;

  static LocationDTO fromJson(Map<String, dynamic> data) =>
      _$LocationDTOFromJson(data);
  Map<String, dynamic> toJson() => _$LocationDTOToJson(this);
}
