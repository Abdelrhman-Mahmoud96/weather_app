import 'dart:async';
import 'dart:developer';
import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:weather_app_task/core/app/weather_app.dart';
import 'package:weather_app_task/core/app/weather_app_bloc_observer.dart';

Future<void> bootstrap() async {
  FlutterError.onError =
      (details) => log(details.exceptionAsString(), stackTrace: details.stack);

  Bloc.observer = WeatherAppBlocObserver();

  runZonedGuarded(
    ()  => runApp(const WeatherApp()),      
    (error, stackTrace) => log(error.toString(), stackTrace: stackTrace),
  );
}
