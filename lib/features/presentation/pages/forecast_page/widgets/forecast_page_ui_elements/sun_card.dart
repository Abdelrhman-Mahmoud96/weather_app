import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/intl.dart';
import 'package:lottie/lottie.dart';
import 'package:weather_app_task/features/presentation/pages/forecast_page/widgets/forecast_page_ui_elements/custom_card_container.dart';
import 'package:weather_app_task/theme/weather_colors.dart';

class SunCard extends StatefulWidget {
  const SunCard({
    Key? key,
    required this.sunRise,
    required this.sunSet,
  }) : super(key: key);

  final int sunRise;
  final int sunSet;

  @override
  State<StatefulWidget> createState() => _SunCardState();
}

class _SunCardState extends State<SunCard> with TickerProviderStateMixin {
  late final AnimationController _sunAnimationController;

  @override
  void initState() {
    super.initState();
    _sunAnimationController = AnimationController(vsync: this)
      ..duration = const Duration(seconds: 7);
  }

  @override
  void dispose() {
    _sunAnimationController.dispose();
    super.dispose();
    
  }

  @override
  Widget build(BuildContext context) {
    final currentHour = int.parse(DateFormat('H').format(DateTime.now()));
    final sunRiseHour = int.parse(DateFormat('H')
        .format(DateTime.fromMillisecondsSinceEpoch(widget.sunRise * 1000)));

    final sunSetHour = int.parse(DateFormat('H')
        .format(DateTime.fromMillisecondsSinceEpoch(widget.sunSet * 1000)));

    return CustomCardContainer(
        height: 280,
        innerPadding: 0,
        child: Column(
          children: [
            Align(
                alignment: AlignmentDirectional.topStart,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text('Sunset and Sunrise',
                      style: TextStyle(
                          fontSize: 16.sp, fontWeight: FontWeight.bold)),
                )),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8.0),
              child: Lottie.asset(
                'assets/forecast_animations/sunrise_sunset_animation.json',
                controller: _sunAnimationController,
                width: double.maxFinite,
                height: 200,
                fit: BoxFit.fill,
                repeat: true,
                // we run the animation to reflect the location of the sun to the current hour
                // by dividing the total no. of frames on the no. of sun hours (no. of frame to animate for each single hour),
                // then getting the current hour to see how much time had passed since rising,
                // then multiply it by frame ratio to get the total number of
                // frames or (the no. of the last frame to animate to)
                // ex: 13:00 pm - 6:00 am = 7 hours
                // 24 frames / total hours between sunrise and sunset (12) = 2 frames ber hour
                // time passed (7) * frame ber hour(2) = animate to frame no 14 !!
                onLoaded: (composition) {
                  final numberOfFrames = composition.endFrame.ceil();
                  final numberOfSunHours = sunSetHour - sunRiseHour;

                  final framesToHours =
                      (numberOfFrames / numberOfSunHours).ceil();

                  if (currentHour < sunSetHour && currentHour >= sunRiseHour) {
                    final timeElapsedSinceRising = currentHour - sunRiseHour;
                    final totalNumberOfFramesToAnimate =
                        framesToHours * timeElapsedSinceRising;

                    _sunAnimationController.animateTo(
                      totalNumberOfFramesToAnimate / numberOfFrames,
                    );

                    _sunAnimationController.addStatusListener((status) {
                      if (status == AnimationStatus.completed) {
                        Future.delayed(Duration(milliseconds: 500), () {
                          _sunAnimationController.reset();
                          _sunAnimationController.animateTo(
                            totalNumberOfFramesToAnimate / numberOfFrames,
                          );
                        });
                      }
                    });
                  }
                },
              ),
            ),
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 12.0),
              child: Divider(color: WeatherColors.weatherYellow, height: 1),
            ),
            // ex: 6AM - - - - - - - 6PM
            Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 10.0, vertical: 8),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                mainAxisSize: MainAxisSize.max,
                children: [
                  Text(
                    DateFormat().add_jm().format(
                        DateTime.fromMillisecondsSinceEpoch(
                            widget.sunRise * 1000)),
                    style: const TextStyle(fontWeight: FontWeight.bold),
                  ),
                  Text(
                    DateFormat().add_jm().format(
                        DateTime.fromMillisecondsSinceEpoch(
                            widget.sunSet * 1000)),
                    style: const TextStyle(fontWeight: FontWeight.bold),
                  ),
                ],
              ),
            )
          ],
        ));
  }
}
