import 'package:weather_app_task/core/use_case/i_use_case.dart';
import 'package:weather_app_task/features/domain/entities/forecast/forecast.dart';
import 'package:weather_app_task/features/domain/repositories/i_forecast_repository.dart';

class GetAllLocationsCachedForecastUseCase
    implements IUseCase<List<Map<String,Forecast>>, NoParams> {
  const GetAllLocationsCachedForecastUseCase({required this.forecastRepository});

  final IForecastRepository forecastRepository;

  @override
  Future<List<Map<String,Forecast>>> call({required NoParams params}) {
    return forecastRepository.getAllLocationsCachedForecast();
  }
}