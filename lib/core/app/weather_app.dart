import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:weather_app_task/core/di/injector.dart';
import 'package:weather_app_task/core/routes/weather_app_routes_generator.dart';
import 'package:weather_app_task/features/presentation/connectivity/cubit/connectivity_cubit.dart';
import 'package:weather_app_task/features/presentation/pages/forecast_page/cubit/manage_forecast_cubit.dart';
import 'package:weather_app_task/features/presentation/pages/manage_locations_pages/bloc/manage_locations_bloc.dart';
import 'package:weather_app_task/theme/weather_colors.dart';
import 'package:weather_app_task/theme/weather_theme.dart';

// starting point of our app
class WeatherApp extends StatelessWidget {
  const WeatherApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<ConnectivityCubit>(
          create: (context) =>
              getIt<ConnectivityCubit>()..checkInternetConnection(),
        ),
        BlocProvider<ManageLocationsBloc>(
          create: (context) => getIt<ManageLocationsBloc>(),
        ),
         BlocProvider<ManageForecastCubit>(
          create: (context) => getIt<ManageForecastCubit>(),
         ),
      ],
      child: ScreenUtilInit(
          designSize: const Size(360, 690),
          minTextAdapt: true,
          builder: (context, child) {
            return MaterialApp(
              debugShowCheckedModeBanner: false,
              title: 'Weather App',              
              color: WeatherColors.weatherYellow,
              theme: WeatherTheme.main,
              darkTheme: WeatherTheme.main,
              localizationsDelegates: const [
                GlobalMaterialLocalizations.delegate,
              ],
              supportedLocales: const [
                Locale('en', 'US'),
              ],
              onGenerateRoute: WeatherAppRoutesGenerator.generateRoute,
              initialRoute: WeatherAppRoutesGenerator.mainPage,
            );
          }),
    );
  }
}
