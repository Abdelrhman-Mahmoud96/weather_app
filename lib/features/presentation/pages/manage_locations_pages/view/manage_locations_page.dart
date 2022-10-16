import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app_task/core/routes/weather_app_routes_generator.dart';
import 'package:weather_app_task/features/presentation/pages/forecast_page/cubit/manage_forecast_cubit.dart';
import 'package:weather_app_task/features/presentation/pages/manage_locations_pages/bloc/manage_locations_bloc.dart';
import 'package:weather_app_task/features/presentation/pages/manage_locations_pages/widgets/location_list_tile.dart';

class ManageLocationsPage extends StatelessWidget {
  const ManageLocationsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Locations'),
      ),
      body: MultiBlocListener(
        listeners: [
          // if we get failure as a state we show snackbar
          BlocListener<ManageLocationsBloc, ManageLocationsState>(
            listenWhen: (previous, current) =>
                previous.manageLocationStatus != current.manageLocationStatus &&
                current.manageLocationStatus == ManageLocationStatus.failure,
            listener: (context, state) {
              if (state.manageLocationStatus == ManageLocationStatus.failure) {
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
          // we get success as a state when we pick a location either
          // from the previous list or from the searched results list
          // then we pop the current screen
          BlocListener<ManageLocationsBloc, ManageLocationsState>(
            listenWhen: (previous, current) =>
                previous.manageLocationStatus != current.manageLocationStatus &&
                current.manageLocationStatus == ManageLocationStatus.success,
            listener: (context, state) {
              if (state.manageLocationStatus == ManageLocationStatus.success) {
                Navigator.pop(context);
              }
            },
          ),
        ],
        child: BlocBuilder<ManageLocationsBloc, ManageLocationsState>(
          builder: (context, state) {
            if (state.manageLocationStatus == ManageLocationStatus.loading ||
                state.manageLocationStatus == ManageLocationStatus.initial) {
              return const Center(child: CircularProgressIndicator());
            }
            // else we having a loaded state
            if (state.previousLocations!.isEmpty) {
              return const Center(
                child: Text('no locations added yet'),
              );
            }
            return ListView.builder(
              itemCount: state.previousLocations!.length,
              itemBuilder: (BuildContext context, int index) {
                final locations = state.previousLocations!.reversed.toList();
                final location = locations[index];
                return LocationsListTile(
                  locationEntity: location,
                  onDismissed: (_) {
                    context
                        .read<ManageLocationsBloc>()
                        .add(RemoveLocation(locationEntity: location));

                    context
                        .read<ManageForecastCubit>()
                        .deleteCacheLocationForecastUseCase(
                            params: location.locationId);

                    ScaffoldMessenger.of(context)
                      ..hideCurrentSnackBar()
                      ..showSnackBar(
                        SnackBar(
                          content:
                              Text('location ${location.locationName} Deleted'),
                        ),
                      );
                  },
                  onTap: () {
                    context
                        .read<ManageLocationsBloc>()
                        .add(PickPreviousLocation(locationEntity: location));
                  },
                  onToggleFavorite: (isFavorite) {
                    context.read<ManageLocationsBloc>().add(
                        ToggleIsFavoriteLocation(
                            locationEntity: location, isFavorite: isFavorite));
                  },
                );
              },
            );
          },
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: FloatingActionButton.extended(
          onPressed: () {
            Navigator.pushNamed(
                context, WeatherAppRoutesGenerator.searchLocations);
          },
          label: Row(
            children: const [
              Icon(Icons.add_location_alt_outlined),
              Text(' Search for new location'),
            ],
          )),
    );
  }
}
