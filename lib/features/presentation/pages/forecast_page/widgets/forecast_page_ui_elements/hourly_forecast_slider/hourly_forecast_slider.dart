import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/intl.dart';
import 'package:weather_app_task/features/domain/entities/forecast/hourly/hourly_forecast.dart';
import 'package:weather_app_task/features/presentation/pages/forecast_page/widgets/forecast_page_ui_elements/custom_card_container.dart';
import 'package:weather_app_task/features/presentation/pages/forecast_page/widgets/forecast_page_ui_elements/forecast_icons.dart';
import 'package:weather_app_task/features/presentation/pages/forecast_page/widgets/forecast_page_ui_elements/hourly_forecast_slider/hourly_forecast_line_chart.dart';
import 'package:weather_app_task/theme/weather_colors.dart';

class HourlyForecastSlider extends StatelessWidget {
  const HourlyForecastSlider({Key? key, required this.hourlyForecast})
      : super(key: key);

  final List<HourlyForecast> hourlyForecast;

  @override
  Widget build(BuildContext context) {
    return CustomCardContainer(
      outerPadding: 8,
      innerPadding: 0,
      width: double.maxFinite,
      height: 150.h,
      child: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: Column(
          children: [
            Expanded(
              child: ListView.builder(
                physics: const NeverScrollableScrollPhysics(),                                
                shrinkWrap: true,     
                scrollDirection: Axis.horizontal,
                itemCount: hourlyForecast.length,
                itemBuilder: (context, index) {
                  final oneHourForecast = hourlyForecast[index];
                  return Row(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      // hour/icon/temperature
                      Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          // time
                          Padding(
                            padding: const EdgeInsets.symmetric(vertical:4.0),
                            child: Text(
                              DateFormat().add_j().format(
                                  DateTime.fromMillisecondsSinceEpoch(
                                      oneHourForecast.epochDate * 1000)),
                              style: TextStyle(fontSize: 12.sp),
                            ),
                          ),
                          // icon
                          Padding(
                            padding: const EdgeInsets.symmetric(vertical:4.0),
                            child: Image.asset(
                                getForecastIconsAsset(oneHourForecast.weatherIcon),),
                          ),
                          // temperature
                          Padding(
                            padding: const EdgeInsets.symmetric(vertical:4.0),
                            child: Text('${oneHourForecast.temperature.value!.round()}\u00B0', style: TextStyle(fontSize: 14.sp, fontWeight: FontWeight.bold)),
                          ),
                          // rain probability
                          Padding(
                            padding: const EdgeInsets.symmetric(vertical:4.0),
                            child: Row(                    
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        // raining probability
                        Icon(Icons.water_drop, color: WeatherColors.weatherYellow.withOpacity(0.5), size: 20.h,),
                        Text('${oneHourForecast.rainProbability}%',)
                        ]),
                          ),
                  
                        ],
                      ),
                    ],
                  );
                },
              ),
            ),
            // Expanded(child: HourlyForecastLineChart(hourlyForecastData: hourlyForecast,)),
            // Expanded(
            //   child: ListView.builder(                 
            //     physics: const NeverScrollableScrollPhysics(),                         
            //     shrinkWrap: true,     
            //     scrollDirection: Axis.horizontal,
            //     itemCount: hourlyForecast.length,
            //     itemBuilder: (context, index) {
            //       final oneHourForecast = hourlyForecast[index];
            //       return Container(                    
            //         padding: EdgeInsets.symmetric(horizontal: 15.w,),
            //         child: Row(                    
            //           mainAxisSize: MainAxisSize.min,
            //           children: [
            //             // raining probability
            //             Icon(Icons.water_drop, color: WeatherColors.weatherYellow.withOpacity(0.5),),
            //             Text('${oneHourForecast.rainProbability}%',)
            //             ]),
            //       );
            //     },
            //   ),
            // ),
          ],
        ),
      ),
    );
  }
}
