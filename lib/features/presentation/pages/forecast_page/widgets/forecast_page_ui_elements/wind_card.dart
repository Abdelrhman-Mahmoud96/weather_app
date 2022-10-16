import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lottie/lottie.dart';
import 'package:weather_app_task/features/presentation/pages/forecast_page/widgets/forecast_page_ui_elements/custom_card_container.dart';

class WindCard extends StatelessWidget {
  const WindCard({Key? key, required this.speedValue}) : super(key: key);

  final double speedValue;

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
              child: Text('Wind',
                  style: TextStyle(
                      fontSize: 16.sp,
                      fontWeight: FontWeight.bold)),
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
                  frameRate: FrameRate.max,                 
                  'assets/forecast_animations/windmill_animation.json',
                  repeat: true,                  
                ),
                // value
                Expanded(
                  child: Align(
                    alignment: AlignmentDirectional.center,
                    child: Text.rich(TextSpan(children: [
                        TextSpan(
                            text: speedValue.toString(),
                            style: TextStyle(
                                fontSize: 48.sp,
                                fontWeight: FontWeight.bold)),
                        TextSpan(
                            text: 'km/h',
                            style: TextStyle(
                              fontSize: 18.sp,
                            )),
                      ])),
                    ),
                  ),               
              ],
            ),
          )
        ],
      ),
    );
  }
}
