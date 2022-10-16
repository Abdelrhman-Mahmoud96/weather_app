import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:weather_app_task/features/data/models/forecast/forecast_data_types/daily_sun_info/daily_sun_info.dart';
import 'package:weather_app_task/features/domain/entities/forecast/daily/daily_forecasts.dart';
import 'package:weather_app_task/features/presentation/pages/forecast_page/widgets/forecast_page_ui_elements/forecast_icons.dart';

class CustomForecastListTile extends StatelessWidget {
  const CustomForecastListTile({Key? key, required this.singleDayForecastData})
      : super(key: key);

  final DailyForecasts singleDayForecastData;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal:8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        mainAxisSize: MainAxisSize.min,
        children: [
          // date, ex: Sun, OCt 3
          Expanded(
            child: Text(DateFormat('E,').add_MMMd().format(
                DateTime.fromMillisecondsSinceEpoch(
                    singleDayForecastData.epochDate * 1000))),
          ),
          // weather icon
          Image.asset(getForecastIconsAsset(
              _dayOrNightIcon(singleDayForecastData.sunInfo))),
          // temperature
          Expanded(
            child: Align(
              alignment: AlignmentDirectional.topEnd,
              child: Text(
                  '${singleDayForecastData.temperature.max!.value!.round()}\u00B0/${singleDayForecastData.temperature.min!.value!.round()}\u00B0'),
            ),
          )
        ],
      ),
    );
  }

  int _dayOrNightIcon(DailySunInfo dailySunInfo) {
    final currentHour = DateTime.now().hour;
    final sunSet = int.parse(DateFormat().add_H().format(
        DateTime.fromMillisecondsSinceEpoch(dailySunInfo.setTime! * 1000)));
    final sunRise = int.parse(DateFormat().add_H().format(
        DateTime.fromMillisecondsSinceEpoch(dailySunInfo.riseTime! * 1000)));

    if (currentHour < sunSet && currentHour >= sunRise) {
      return singleDayForecastData.dayTimeInfo.weatherIcon!;
    }
    return singleDayForecastData.nightTimeInfo.weatherIcon!;
  }
}
