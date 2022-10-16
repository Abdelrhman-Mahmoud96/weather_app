import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:weather_app_task/theme/weather_colors.dart';

class WeatherTheme {
  static ThemeData get main {
    return ThemeData(
      scaffoldBackgroundColor: WeatherColors.weatherBlack,
      appBarTheme: AppBarTheme(
        systemOverlayStyle: const SystemUiOverlayStyle(
            statusBarColor: WeatherColors.weatherBlack,
            statusBarIconBrightness: Brightness.light),
        backgroundColor: WeatherColors.weatherBlack,
        
        elevation: 0,
        titleTextStyle:
            TextStyle(fontSize: 24.sp, color: WeatherColors.weatherWhite),
        // shape: Border(bottom: BorderSide(color: Colors.grey[350]!, width: 2.w)),
        iconTheme: const IconThemeData(color: WeatherColors.weatherYellow),
      ),      
      textTheme: const TextTheme(
        bodyText1: TextStyle(),
        bodyText2: TextStyle(),
        headline6: TextStyle(),
      ).apply(
        displayColor: WeatherColors.weatherWhite,
        bodyColor: WeatherColors.weatherWhite,        
      ),
      colorScheme: ColorScheme.fromSwatch(
        accentColor: WeatherColors.weatherDarkGray,
        primarySwatch: Colors.amber,
      ),
      snackBarTheme: const SnackBarThemeData(
        backgroundColor: WeatherColors.weatherYellow,
        contentTextStyle: TextStyle(color: WeatherColors.weatherBlack),
        behavior: SnackBarBehavior.floating,
      ),
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ButtonStyle(
          backgroundColor:
              MaterialStateProperty.all<Color>(WeatherColors.weatherYellow),
        ),
      ),
      scrollbarTheme: ScrollbarThemeData(
        thumbColor:
            MaterialStateProperty.all<Color>(WeatherColors.weatherYellow),
      ),
      unselectedWidgetColor: WeatherColors.weatherYellow,
      toggleableActiveColor: WeatherColors.weatherYellow,
      drawerTheme:
          const DrawerThemeData(backgroundColor: WeatherColors.weatherDarkGray),
      listTileTheme: const ListTileThemeData(
        iconColor: WeatherColors.weatherYellow,
        textColor: WeatherColors.weatherWhite,
        tileColor: WeatherColors.weatherDarkGray,
        enableFeedback: true,
        selectedTileColor:WeatherColors.weatherYellow, 
        ),
      dividerTheme: const DividerThemeData(color: WeatherColors.weatherWhite),
      
    );
  }
}
