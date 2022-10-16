import 'dart:convert';
import 'package:weather_app_task/core/mappers/domain_mapper.dart';
import 'package:weather_app_task/features/data/data_sources/remote/location/i_location_api_data_fetcher.dart';
import 'package:weather_app_task/features/data/data_sources/remote/location/location_http_service.dart';
import 'package:weather_app_task/features/data/models/location/remote/location_dto.dart';
import 'package:weather_app_task/features/domain/entities/location/location.dart';

class LocationApiDataFetcherImp
    implements ILocationsApiDataFetcher {
  const LocationApiDataFetcherImp(
      {required this.locationHttpService, required this.domainMapper});

  final LocationHttpService locationHttpService;
  final DomainMapper<Location, LocationDTO> domainMapper;

  @override
  Future<List<Location>> getDataFromApi(String locationName) async {
    final returnedResponse =
        await locationHttpService.sendRequest(locationName);
    
    return List<Map>.from(json.decode(returnedResponse.body) as List)
        .map((locationJson) => domainMapper.fromDomain(
            LocationDTO.fromJson(Map<String, dynamic>.from(locationJson))))
        .toList();
  }
}
