import 'package:flutter/material.dart';
import 'package:weather_app_task/features/domain/entities/forecast/daily/daily_forecasts.dart';
import 'package:weather_app_task/features/presentation/pages/forecast_page/widgets/forecast_page_ui_elements/custom_card_container.dart';
import 'package:weather_app_task/features/presentation/pages/forecast_page/widgets/forecast_page_ui_elements/next_five_days_list/custom_forecast_list_tile.dart';
import 'package:weather_app_task/theme/weather_colors.dart';

class NextDaysForecast extends StatelessWidget {
  const NextDaysForecast({Key? key, required this.dailyForecastsData})
      : super(key: key);

  final List<DailyForecasts> dailyForecastsData;

  @override
  Widget build(BuildContext context) {
    List<DailyForecasts> list = List.from(dailyForecastsData.skip(1));
    
    return CustomCardContainer(
      height: 250,
      child: ListView.separated(
        physics: const NeverScrollableScrollPhysics(),
        separatorBuilder: (context, index) {
          return const Divider(
            color: WeatherColors.weatherBlack,
          );
        },
        itemCount: list.length,
        itemBuilder: (context, index) {
          return CustomForecastListTile(
            singleDayForecastData: list[index],
          );
        },
      ),
    );
  }
}
