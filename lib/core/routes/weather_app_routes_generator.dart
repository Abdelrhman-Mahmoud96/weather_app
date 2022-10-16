import 'package:flutter/material.dart';
import 'package:weather_app_task/features/presentation/pages/forecast_page/view/forecast_page.dart';
import 'package:weather_app_task/features/presentation/pages/manage_locations_pages/view/manage_locations_page.dart';
import 'package:weather_app_task/features/presentation/pages/manage_locations_pages/view/search_locations_page.dart';
class WeatherAppRoutesGenerator{
  WeatherAppRoutesGenerator._();

  static const mainPage = '/';
  static const details = '/details';
  static const manageLocations = '/manage_locations';
  static const searchLocations = '/search_locations';
  
  static Route<dynamic> generateRoute(RouteSettings settings){
    switch(settings.name){
      case mainPage:
        return MaterialPageRoute<void>(
          builder: (_) => const ForecastPage(),
        );
      // case details:
      //   return MaterialPageRoute<void>(
      //     builder: (_) => const MainPage(),
      //   );
      
      case manageLocations:
        return MaterialPageRoute<void>(
          builder: (_) => const ManageLocationsPage(),
        );
      
      case searchLocations:
        return MaterialPageRoute<void>(
          builder: (_) => const SearchLocationsPage(),
        );

      default:
        throw const FormatException('ROUTE NOT FOUND');
    }
  }
} 