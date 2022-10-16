import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pull_to_refresh_flutter3/pull_to_refresh_flutter3.dart';
import 'package:weather_app_task/features/presentation/connectivity/cubit/connectivity_cubit.dart';
import 'package:weather_app_task/features/presentation/pages/forecast_page/cubit/manage_forecast_cubit.dart';
import 'package:weather_app_task/features/presentation/pages/forecast_page/widgets/custom_smart_refresher.dart';
import 'package:weather_app_task/features/presentation/pages/forecast_page/widgets/forecast_page_ui_elements/hourly_forecast_slider/hourly_forecast_slider.dart';
import 'package:weather_app_task/features/presentation/pages/forecast_page/widgets/forecast_page_ui_elements/humidity_card.dart';
import 'package:weather_app_task/features/presentation/pages/forecast_page/widgets/forecast_page_ui_elements/next_five_days_list/next_five_days_forecasts_list.dart';
import 'package:weather_app_task/features/presentation/pages/forecast_page/widgets/forecast_page_ui_elements/sun_card.dart';
import 'package:weather_app_task/features/presentation/pages/forecast_page/widgets/forecast_page_ui_elements/today_forecast_card.dart';
import 'package:weather_app_task/features/presentation/pages/forecast_page/widgets/forecast_page_ui_elements/wind_card.dart';
import 'package:weather_app_task/features/presentation/pages/forecast_page/widgets/manage_locations_drawer.dart';
import 'package:weather_app_task/features/presentation/pages/manage_locations_pages/bloc/manage_locations_bloc.dart';
import 'package:weather_app_task/theme/weather_colors.dart';

// main page contains today's weather and a forecast summery of the next 5 days,
class ForecastPage extends StatefulWidget {
  const ForecastPage({Key? key}) : super(key: key);

  @override
  State<ForecastPage> createState() => _ForecastPageState();
}

class _ForecastPageState extends State<ForecastPage> {
  @override
  void initState() {
    super.initState();
    SchedulerBinding.instance.addPostFrameCallback((_) {
      // context.read<ManageLocationsBloc>().add(const LoadLastUsedLocation());
      context.read<ManageLocationsBloc>().add(const LoadPreviousLocations());
      context.read<ManageForecastCubit>().loadAllCachedLocationsForecastData();
    });
  }

  @override
  Widget build(BuildContext context) {
    final connectivityState = context.watch<ConnectivityCubit>().state;
    // listen for loading current location info failure
    return Scaffold(
      appBar: AppBar(
        title: const Text(''),
      ),
      drawer: const ManageLocationsDrawer(),
      // TODO: 10/11/22 drawer is slugish because of event that load the locations and its forecast data
      onDrawerChanged: (isOpened) {
        if (isOpened) {
         
          // context
          //     .read<ManageLocationsBloc>()
          //     .add(const LoadPreviousLocations());
          // context
          //     .read<ManageForecastCubit>()
          //     .loadAllCachedLocationsForecastData();
        }
      },
      body: MultiBlocListener(
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
              }),
          BlocListener<ManageLocationsBloc, ManageLocationsState>(
            listenWhen: (previous, current) =>
                previous.manageLocationStatus != current.manageLocationStatus &&
                current.manageLocationStatus == ManageLocationStatus.success,
            listener: (context, state) {
              if (state.manageLocationStatus == ManageLocationStatus.success) {
                connectivityState.when(
                    nil: () {},
                    connected: () {
                      context
                          .read<ManageForecastCubit>()
                          .loadRemoteLocationForecastData(
                              state.currentLocation!.locationId);
                    },
                    disconnected: () {
                      context
                          .read<ManageForecastCubit>()
                          .loadCachedLocationForecastData(
                              state.currentLocation!.locationId);
                    });
              }
            },
          ),
          // BlocListener<ManageLocationsBloc, ManageLocationsState>(
          //   listenWhen: (previous, current) =>
          //       previous.manageLocationStatus != current.manageLocationStatus &&
          //       current.manageLocationStatus == ManageLocationStatus.loaded,
          //   listener: (context, state) {
          //     if (state.manageLocationStatus == ManageLocationStatus.loaded &&
          //         state.currentLocation != null) {
          //       connectivityState.when(
          //           nil: () {},
          //           connected: () {
          //             context
          //                 .read<ManageForecastCubit>()
          //                 .loadRemoteLocationForecastData(
          //                     state.currentLocation!.locationId);
          //           },
          //           disconnected: () {
          //             context
          //                 .read<ManageForecastCubit>()
          //                 .loadCachedLocationForecastData(
          //                     state.currentLocation!.locationId);
          //           });
          //     }
          //   },
          // ),
        ],
        child: BlocBuilder<ManageLocationsBloc, ManageLocationsState>(
          builder: (context, state) {
            if (state.currentLocation == null) {
              return const Center(
                  child: Text('please choose a location to get the weather'));
            }
            if (connectivityState is Connected) {
              context
                  .read<ManageForecastCubit>()
                  .loadRemoteLocationForecastData(
                      state.currentLocation!.locationId);
              return const ForecastView();
            }
            context.read<ManageForecastCubit>().loadCachedLocationForecastData(
                state.currentLocation!.locationId);
            return const ForecastView();
          },
        ),
      ),
    );
  }
}

class ForecastView extends StatelessWidget {
  const ForecastView({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final refreshController = RefreshController(initialRefresh: false);
    final connectivityState = context.watch<ConnectivityCubit>().state;
    final currentLocation = context
        .select((ManageLocationsBloc bloc) => bloc.state.currentLocation);
    // listen for loading current location forecast failure
    return CustomSmartRefresher(
      controller: refreshController,
      header: const WaterDropHeader(
        waterDropColor: WeatherColors.weatherYellow,
      ),
      onRefresh: () {
        connectivityState.when(
            nil: () {},
            connected: () {
              context
                  .read<ManageForecastCubit>()
                  .loadRemoteLocationForecastData(currentLocation!.locationId);
              refreshController.refreshCompleted();
            },
            disconnected: () {
              ScaffoldMessenger.of(context)
                ..hideCurrentSnackBar()
                ..showSnackBar(
                  const SnackBar(
                    content: Text('no internet connection'),
                  ),
                );
              refreshController.refreshCompleted();
            });
      },
      customChild: BlocListener<ManageForecastCubit, ManageForecastState>(
        listenWhen: (previous, current) =>
            previous.manageForecastStatus != current.manageForecastStatus &&
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
        child: BlocBuilder<ManageForecastCubit, ManageForecastState>(
            builder: (context, state) {
          if (state.manageForecastStatus == ManageForecastStatus.initial ||
              state.manageForecastStatus == ManageForecastStatus.loading) {
            return const Center(child: CircularProgressIndicator());
          }

          if (state.forecast!.dailyForecasts.isEmpty ||
              state.forecast!.hourlyForecast.isEmpty) {
            return const Center(
              child: Text('no data provided check your internet'),
            );
          }
          return Column(
            children: [
              TodayForecastCard(
                  currentLocation: currentLocation!,
                  currentLocationForecast: state.forecast!),
              HourlyForecastSlider(
                  hourlyForecast: state.forecast!.hourlyForecast),
              NextDaysForecast(
                  dailyForecastsData: state.forecast!.dailyForecasts),
              WindCard(
                  speedValue: state
                      .forecast!.hourlyForecast.first.windInfo.speed!.value!),
              HumidityCard(
                  humidityValue: state.forecast!.hourlyForecast.first.humidity),
              SunCard(
                  sunRise:
                      state.forecast!.dailyForecasts.first.sunInfo.riseTime!,
                  sunSet:
                      state.forecast!.dailyForecasts.first.sunInfo.setTime!),
            ],
          );
        }),
      ),
    );
  }
}
