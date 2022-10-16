import 'package:weather_app_task/features/domain/entities/location/location.dart';

abstract class ILocationsApiDataFetcher {
  Future<List<Location>> getDataFromApi(String locationName);
}
