import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:weather_app_task/features/data/models/location/remote/country/country_dto.dart';

part 'location_model.freezed.dart';
part 'location_model.g.dart';

@freezed
class LocationModel with _$LocationModel{
  const factory LocationModel({
    required String locationId,
    required String locationName,
    required CountryDTO country,
    required bool isFavorite,
  }) = _LocationModel;

  factory LocationModel.fromJson(Map<String, dynamic> data) =>
        _$LocationModelFromJson(data);  
}
