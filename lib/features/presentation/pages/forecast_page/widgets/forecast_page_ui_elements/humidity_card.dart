import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lottie/lottie.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';
import 'package:weather_app_task/features/presentation/pages/forecast_page/widgets/forecast_page_ui_elements/custom_card_container.dart';
import 'package:weather_app_task/theme/weather_colors.dart';

class HumidityCard extends StatelessWidget {
  const HumidityCard({Key? key, required this.humidityValue}) : super(key: key);

  final int humidityValue;

  @override
  Widget build(BuildContext context) {
    return CustomCardContainer(
      height: 200,    
      child: Column(
        children: [
          // card label
          Align(
            alignment: AlignmentDirectional.topStart,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text('Humidity',
                  style:
                      TextStyle(fontSize: 16.sp, fontWeight: FontWeight.bold)),
            ),
          ),
          // animation and value
          Center(
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                // animation
                Lottie.asset(
                  width: 120,
                  height: 120,
                  'assets/forecast_animations/humidity_animation.json',
                  repeat: true,
                ),
                // value
                Expanded(
                  child: Align(
                    alignment: AlignmentDirectional.center,
                    child: CircularPercentIndicator(
                      radius: 50,
                      percent: humidityValue / 100,
                      progressColor: WeatherColors.weatherYellow,
                      center: Text.rich(TextSpan(children: [
                        TextSpan(
                            text: humidityValue.toString(),
                            style: TextStyle(
                                fontSize: 48.sp,
                                fontWeight: FontWeight.bold)),
                        TextSpan(
                            text: '%',
                            style: TextStyle(
                              fontSize: 20.sp,
                            )),
                      ])),
                    ),
                  ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
