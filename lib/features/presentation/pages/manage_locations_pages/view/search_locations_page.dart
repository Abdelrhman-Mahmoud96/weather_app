import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app_task/features/presentation/pages/forecast_page/cubit/manage_forecast_cubit.dart';
import 'package:weather_app_task/features/presentation/pages/manage_locations_pages/bloc/manage_locations_bloc.dart';
import 'package:weather_app_task/features/presentation/pages/manage_locations_pages/widgets/location_search_delegate.dart';
import 'package:weather_app_task/theme/weather_colors.dart';

class SearchLocationsPage extends StatelessWidget {
  const SearchLocationsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Search Location'),
        actions: [
          IconButton(
            onPressed: () {
              showSearch(
                context: context,
                delegate: LocationSearchDelegate(),
              );
            },
            icon: const Icon(Icons.search),
          ),
        ],
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
            if (state.searchResultLocations == null ||
                state.searchResultLocations!.isEmpty) {
              return const Center(
                child: Text('no locations found yet'),
              );
            }
            return ListView.builder(
              itemCount: state.searchResultLocations!.length,
              itemBuilder: (BuildContext context, int index) {
                final location = state.searchResultLocations![index];
                return ListTile(
                  title: Text(
                    location.locationName,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: const TextStyle(
                      color: WeatherColors.weatherWhite,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                  subtitle: Text(
                    location.country.countryName!,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: const TextStyle(
                      color: WeatherColors.weatherWhite,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                  onTap: () {
                    context
                        .read<ManageLocationsBloc>()
                        .add(AddToPreviousLocations(locationEntity: location));                    
                  },
                );
              },
            );
          },
        ),
      ),
    );
  }
}
