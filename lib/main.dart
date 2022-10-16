import 'package:flutter/material.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:weather_app_task/bootstrap.dart';
import 'package:weather_app_task/core/di/injector.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await initDependencies();
  bootstrap();
  FlutterNativeSplash.remove();
}
