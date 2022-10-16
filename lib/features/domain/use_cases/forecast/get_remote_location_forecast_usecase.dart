import 'package:weather_app_task/core/use_case/i_use_case.dart';
import 'package:weather_app_task/features/domain/entities/forecast/forecast.dart';
import 'package:weather_app_task/features/domain/repositories/i_forecast_repository.dart';

class GetRemoteLocationForecastUseCase implements IUseCase<Forecast, String> {
  const GetRemoteLocationForecastUseCase({required this.forecastRepository});

  final IForecastRepository forecastRepository;

  @override
  Future<Forecast> call({required String params}) {
    return forecastRepository.getRemoteLocationForecast(params);
  }
}
