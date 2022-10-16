import 'package:weather_app_task/core/use_case/i_use_case.dart';
import 'package:weather_app_task/features/domain/entities/location/location.dart';
import 'package:weather_app_task/features/domain/repositories/i_location_repository.dart';

class AddToPreviousLocationsUseCase implements IUseCase<void, Location> {
  AddToPreviousLocationsUseCase({required this.locationRepository});

  ILocationRepository locationRepository;
  @override
  Future<void> call({required Location params}) =>
      locationRepository.repositoryAddToPreviousLocation(params);
}
