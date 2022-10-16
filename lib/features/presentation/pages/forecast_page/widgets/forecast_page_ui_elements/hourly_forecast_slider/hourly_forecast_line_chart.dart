import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/intl.dart';
import 'package:weather_app_task/features/domain/entities/forecast/hourly/hourly_forecast.dart';
import 'package:weather_app_task/theme/weather_colors.dart';

class HourlyForecastLineChart extends StatelessWidget {
  const HourlyForecastLineChart({Key? key, required this.hourlyForecastData})
      : super(key: key);

  final List<HourlyForecast> hourlyForecastData;

  @override
  Widget build(BuildContext context) {
    final temperatureToHourSpots = hourlyForecastData.map(
      (oneHourData) {
        final hour = double.parse(DateFormat('H').format(
            DateTime.fromMillisecondsSinceEpoch(oneHourData.epochDate * 1000)));
        if (hour.toInt() > 12) {
          return FlSpot(hour - 12, oneHourData.temperature.value!.round().toDouble());
        } else if (hour.toInt() == 0) {
          return FlSpot(12, oneHourData.temperature.value!.round().toDouble());
        } else if (hour.toInt() == 12) {
          return FlSpot(0, oneHourData.temperature.value!.round().toDouble());
        }
        return FlSpot(hour, oneHourData.temperature.value!.round().toDouble());
      },
    ).toList();

    final x =DateFormat('H').format(
        DateTime.fromMillisecondsSinceEpoch(hourlyForecastData.first.epochDate * 1000));
    return SizedBox(
      width: 900.w,
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 34.0.w, vertical: 8.h),
        child: LineChart(LineChartData(
            minX: temperatureToHourSpots.first.x,
            maxX: 12,
            gridData: FlGridData(show: false),
            borderData: FlBorderData(show: false),
            titlesData: FlTitlesData(
              leftTitles: AxisTitles(sideTitles: SideTitles(showTitles: false)),
              rightTitles:
                  AxisTitles(sideTitles: SideTitles(showTitles: false)),
              bottomTitles:
                  AxisTitles(sideTitles: SideTitles(showTitles: false)),
              topTitles: AxisTitles(
                  sideTitles: SideTitles(
                showTitles: false,
              )),
            ),
            lineBarsData: [
              LineChartBarData(
                spots: temperatureToHourSpots,
                isCurved: false,
                dotData: FlDotData(show: true),
                color: WeatherColors.weatherYellow,
              )
            ])),
      ),
    );
  }
}
