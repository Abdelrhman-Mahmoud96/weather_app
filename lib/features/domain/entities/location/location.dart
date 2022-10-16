import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:weather_app_task/features/data/models/location/remote/country/country_dto.dart';

part 'location.freezed.dart';

@freezed
class Location with _$Location {
  const factory Location({
    required String locationId,
    required String locationName,
    required CountryDTO country,
    required bool isFavorite,
  }) = _Location;
}
