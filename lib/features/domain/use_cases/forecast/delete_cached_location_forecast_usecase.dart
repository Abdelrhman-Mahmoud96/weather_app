import 'package:weather_app_task/core/use_case/i_use_case.dart';
import 'package:weather_app_task/features/domain/repositories/i_forecast_repository.dart';

class DeleteCachedLocationForecastUseCase
    implements IUseCase<void, String> {
  const DeleteCachedLocationForecastUseCase({required this.forecastRepository});

  final IForecastRepository forecastRepository;

  @override
  Future<void> call({required String params}) {
    return forecastRepository.deleteCachedLocationForecast(params);
  }
}