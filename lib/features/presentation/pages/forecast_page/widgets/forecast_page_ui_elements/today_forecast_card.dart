import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/intl.dart';
import 'package:weather_app_task/features/domain/entities/forecast/forecast.dart';
import 'package:weather_app_task/features/domain/entities/location/location.dart';
import 'package:weather_app_task/features/presentation/pages/forecast_page/widgets/forecast_page_ui_elements/forecast_icons.dart';
import 'package:weather_app_task/theme/weather_colors.dart';

class TodayForecastCard extends StatelessWidget {
  const TodayForecastCard(
      {Key? key,
      required this.currentLocation,
      required this.currentLocationForecast})
      : super(key: key);

  final Location currentLocation;
  final Forecast currentLocationForecast;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(16.r),
      decoration: const BoxDecoration(
        color: WeatherColors.weatherBlack
      ),
      child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          mainAxisSize: MainAxisSize.min,
          children: [
            // main temperature and icon
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              mainAxisSize: MainAxisSize.max,
              children: [
                Text(
                  '${currentLocationForecast.hourlyForecast.first.temperature.value!.round()}\u00B0',
                  style: TextStyle(fontSize: 64.sp),
                ),
                Image.asset(getForecastIconsAsset(
                    currentLocationForecast.hourlyForecast.first.weatherIcon), scale: 0.55,),
              ],
            ),
            // location name (city/country) and icon
            Row(
              mainAxisSize: MainAxisSize.max,
              children: [
                Align(
                  alignment: AlignmentDirectional.topStart,
                  child: Text(
                    '${currentLocation.locationName}, ${currentLocation.country.countryName} ',
                    style: TextStyle(fontSize: 32.sp),
                  ),
                ),
                Icon(Icons.location_on, color: WeatherColors.weatherYellow, size: 32.r,),
              ],
            ),
            // space
            SizedBox(
              height: 24.h,
            ),
            // temperature (max/min), ..we may add 'feels like' later!
            Align(
              alignment: AlignmentDirectional.topStart,
              child: Text(
                '${currentLocationForecast.dailyForecasts.first.temperature.max!.value!.round()}\u00B0/${currentLocationForecast.dailyForecasts.first.temperature.min!.value!.round()}\u00B0   Feels like ${currentLocationForecast.dailyForecasts.first.temperature.max!.value!.round() - 1}\u00B0',
                style: TextStyle(fontSize: 16.sp, fontWeight: FontWeight.bold),
              ),
            ),
            SizedBox(
              height: 8.h,
            ),
            // date/time
            Align(
              alignment: AlignmentDirectional.topStart,
              child: Text(
                DateFormat('E,').add_jm().format(DateTime.fromMillisecondsSinceEpoch(
                    currentLocationForecast.hourlyForecast.first.epochDate *
                        1000)),
                style: TextStyle(fontSize: 16.sp,),
              ),
            ),
            SizedBox(
              height: 24.h,
            ),
          ]),
    );
  }
}
