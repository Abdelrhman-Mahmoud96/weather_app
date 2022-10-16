import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:weather_app_task/theme/weather_colors.dart';

class CustomCardContainer extends StatelessWidget {
  const CustomCardContainer(
      {Key? key,
      required this.child,
      this.width = double.maxFinite,
      this.height = 100,
      this.innerPadding = 8, 
      this.outerPadding = 8})
      : super(key: key);

  final Widget child;
  final double width;
  final double height;
  final double? innerPadding;
  final double? outerPadding;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(outerPadding!.r),
      child: Container(
        padding: EdgeInsets.all(innerPadding!.r),
        width: width,
        height: height,
        decoration: BoxDecoration(
          color: WeatherColors.weatherDarkGray,
          borderRadius: BorderRadius.circular(16.r),
        ),
        child: child,
      ),
    );
  }
}
