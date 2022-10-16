import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:weather_app_task/core/routes/weather_app_routes_generator.dart';
import 'package:weather_app_task/features/domain/entities/forecast/forecast.dart';
import 'package:weather_app_task/features/presentation/pages/forecast_page/cubit/manage_forecast_cubit.dart';
import 'package:weather_app_task/features/presentation/pages/forecast_page/widgets/forecast_page_ui_elements/forecast_icons.dart';
import 'package:weather_app_task/features/presentation/pages/manage_locations_pages/bloc/manage_locations_bloc.dart';
import 'package:weather_app_task/theme/weather_colors.dart';

class ManageLocationsDrawer extends StatelessWidget {
  const ManageLocationsDrawer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final favoriteLocations =
        context.watch<ManageLocationsBloc>().state.favoriteLocations;
    final previousLocations =
        context.watch<ManageLocationsBloc>().state.previousLocations;

    List<Map<String, Forecast>>? allForecastData =
        context.watch<ManageForecastCubit>().state.allLocationsForecast;

    return Drawer(
      child: MultiBlocListener(
          listeners: [
            BlocListener<ManageLocationsBloc, ManageLocationsState>(
              listenWhen: (previous, current) =>
                  previous.manageLocationStatus !=
                      current.manageLocationStatus &&
                  current.manageLocationStatus == ManageLocationStatus.failure,
              listener: (context, state) {
                if (state.manageLocationStatus ==
                    ManageLocationStatus.failure) {
                  ScaffoldMessenger.of(context)
                    ..hideCurrentSnackBar()
                    ..showSnackBar(
                      SnackBar(
                        content: Text(state.errorMessage!),
                      ),
                    );
                }
              },
            ),
            BlocListener<ManageForecastCubit, ManageForecastState>(
              listenWhen: (previous, current) =>
                  previous.manageForecastStatus !=
                      current.manageForecastStatus &&
                  current.manageForecastStatus == ManageForecastStatus.failed,
              listener: (context, state) {
                if (state.manageForecastStatus == ManageForecastStatus.failed) {
                  // it will only fail here if the user got a new location but disconnected before loading the forecast
                  // and there will be no cached data fore that location
                  ScaffoldMessenger.of(context)
                    ..hideCurrentSnackBar()
                    ..showSnackBar(
                      const SnackBar(
                        content: Text('no internet connection'),
                      ),
                    );
                }
              },
            ),
          ],
          child: Padding(
            padding: EdgeInsets.all(24.r),
            child: Column(
              children: [
                // favorite locations header
                Padding(
                  padding:
                      EdgeInsets.only(top: MediaQuery.of(context).padding.top),
                  child: const ListTile(
                    leading: Icon(Icons.star),
                    title: Text('Favorite Locations'),
                  ),
                ),

                // favorite locations titles
                favoriteLocations.isEmpty
                    ? const Center(child: Text('no favorite locations yet'))
                    : BlocBuilder<ManageForecastCubit, ManageForecastState>(
                        builder: (context, state) {
                          if (state.manageForecastStatus ==
                                  ManageForecastStatus.initial ||
                              state.manageForecastStatus ==
                                  ManageForecastStatus.loaded) {
                            return const Center(
                              child: CircularProgressIndicator(
                                  color: WeatherColors.weatherYellow),
                            );
                          }
                          return Expanded(
                            child: ListView.builder(
                                padding: const EdgeInsets.only(top: 0),
                                itemCount: favoriteLocations.length,
                                itemBuilder: (context, index) {
                                  // we use location id to get its related forecast from the other list
                                  //(we sort locations by last picking order but not the forecast data, both lists connected by location id)
                                  final currentLocationForecast =
                                      allForecastData!
                                          .firstWhere((locationMap) =>
                                              locationMap.containsKey(
                                                  favoriteLocations[index]
                                                      .locationId))
                                          .values
                                          .first;
                                  return ListTile(
                                      title: Text(favoriteLocations[index]
                                          .locationName),
                                      trailing: Row(
                                        mainAxisSize: MainAxisSize.min,
                                        children: [
                                          Image.asset(getForecastIconsAsset(
                                              currentLocationForecast
                                                  .hourlyForecast
                                                  .first
                                                  .weatherIcon)),
                                          Text(
                                              '${currentLocationForecast.hourlyForecast.first.temperature.value!.round()}\u00B0'),
                                        ],
                                      ));
                                }),
                          );
                        },
                      ),

                const Divider(
                  indent: 20,
                  endIndent: 20,
                ),

                // previously used locations header
                const ListTile(
                  leading: Icon(Icons.list_alt_sharp),
                  title: Text('Previously Used Locations'),
                ),

                // previously used locations title and forecast
                previousLocations!.isEmpty
                    ? const Center(child: Text('no previous locations yet'))
                    : BlocBuilder<ManageForecastCubit, ManageForecastState>(
                        builder: (context, state) {
                          if (state.manageForecastStatus ==
                                  ManageForecastStatus.initial ||
                              state.manageForecastStatus ==
                                  ManageForecastStatus.loading) {
                            return const Center(
                              child: CircularProgressIndicator(
                                  color: WeatherColors.weatherYellow),
                            );
                          }
                          return Expanded(
                            child: ListView.builder(
                                padding: const EdgeInsets.only(top: 0),
                                itemCount: previousLocations.length,
                                itemBuilder: (context, index) {
                                  final currentLocationForecast =
                                      allForecastData!
                                          .firstWhere((locationMap) =>
                                              locationMap.containsKey(
                                                  previousLocations[index]
                                                      .locationId))
                                          .values
                                          .first;
                                  return ListTile(
                                      title: Text(previousLocations[index]
                                          .locationName),
                                      trailing: Row(
                                        mainAxisSize: MainAxisSize.min,
                                        children: [
                                          Image.asset(getForecastIconsAsset(
                                              currentLocationForecast
                                                  .hourlyForecast
                                                  .first
                                                  .weatherIcon)),
                                          Text(
                                              '${currentLocationForecast.hourlyForecast.first.temperature.value!.round()}\u00B0'),
                                        ],
                                      ));
                                }),
                          );
                        },
                      ),

                const Divider(
                  indent: 20,
                  endIndent: 20,
                ),

                // manage locations button
                Flexible(
                  child: Padding(
                    padding:
                        EdgeInsets.symmetric(vertical: 16.h, horizontal: 48.w),
                    child: ElevatedButton(
                        onPressed: () {
                          context
                              .read<ManageLocationsBloc>()
                              .add(const LoadPreviousLocations());

                          Navigator.pop(context);

                          Navigator.pushNamed(context,
                              WeatherAppRoutesGenerator.manageLocations);
                        },
                        child: const Text('Manage Locations')),
                  ),
                ),
              ],
            ),
          )),
    );
  }

//   List<_LocationForecastCustomObject> _getLocationsForecastData(
//       List<Location> locations, BuildContext context) {
//     List<_LocationForecastCustomObject> data = [];
//     for (Location location in locations) {
//       context
//           .read<ManageForecastCubit>()
//           .loadCachedLocationForecastData(location.locationId);
//       final forecastState =
//           context.select((ManageForecastCubit cubit) => cubit.state);
//       if (forecastState is Loaded) {
//         final temperature =
//             forecastState.forecast!.hourlyForecast.first.temperature.value;
//         final icon = forecastState.forecast!.hourlyForecast.first.weatherIcon;
//         data.add(_LocationForecastCustomObject(
//             locationName: location.locationName,
//             temperature: temperature!,
//             forecastIcon: icon));
//       }
//     }
//     return data;
//   }
// }

// class _LocationForecastCustomObject {
//   const _LocationForecastCustomObject({
//     required this.locationName,
//     required this.temperature,
//     required this.forecastIcon,
//   });

//   final String locationName;
//   final double temperature;
//   final int forecastIcon;
}
