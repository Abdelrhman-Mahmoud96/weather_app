import 'package:weather_app_task/core/use_case/i_use_case.dart';
import 'package:weather_app_task/core/use_case/i_use_case_with_stream.dart';
import 'package:weather_app_task/features/domain/entities/location/location.dart';
import 'package:weather_app_task/features/domain/repositories/i_location_repository.dart';

class GetPreviousLocationsUseCase
    implements IUseCaseWithStream<List<Location>, NoParams> {
  GetPreviousLocationsUseCase({required this.locationRepository});

  ILocationRepository locationRepository;
  @override
  Stream<List<Location>> call({required NoParams params}) =>
      locationRepository.repositoryGetPreviousLocations();
}