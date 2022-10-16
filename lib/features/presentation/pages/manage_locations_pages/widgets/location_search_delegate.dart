import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:weather_app_task/features/presentation/connectivity/cubit/connectivity_cubit.dart';
import 'package:weather_app_task/features/presentation/pages/manage_locations_pages/bloc/manage_locations_bloc.dart';
import 'package:weather_app_task/theme/weather_colors.dart';

class LocationSearchDelegate extends SearchDelegate {
  static const List<String> searchSuggestions = [
    'cairo, egypt',
    'riyadh, saudi arabia',
    'new york, United States',
    'milano, italy',
    'tokyo, japan',
  ];

  @override
  ThemeData appBarTheme(BuildContext context) {
    return Theme.of(context).copyWith(
      appBarTheme: Theme.of(context).appBarTheme.copyWith(
            color: WeatherColors.weatherBlack,
          ),
      inputDecorationTheme: InputDecorationTheme(
        hintStyle: TextStyle(
            color: WeatherColors.weatherWhite.withOpacity(0.5),
            fontSize: 20.sp),
      ),
    );
  }

  @override
  String? get searchFieldLabel => 'ex: cairo, eg';

  @override
  List<Widget>? buildActions(BuildContext context) {
    return [
      IconButton(
          onPressed: () {
            if (query.isEmpty) {
              close(context, null);
            }
            query = '';
          },
          icon: const Icon(Icons.clear))
    ];
  }

  @override
  Widget? buildLeading(BuildContext context) {
    return IconButton(
        onPressed: () => close(context, null),
        icon: const Icon(Icons.arrow_back));
  }

  @override
  Widget buildResults(BuildContext context) {
    final connectivityState = context.watch<ConnectivityCubit>().state;
    connectivityState.when(
        nil: () {},
        connected: () {
          context
              .read<ManageLocationsBloc>()
              .add(SearchLocation(locationName: query));

          SchedulerBinding.instance.addPostFrameCallback((_) {
            Navigator.pop(context);
          });
        },
        disconnected: () {
          SchedulerBinding.instance.addPostFrameCallback((_) {
            ScaffoldMessenger.of(context)
              ..hideCurrentSnackBar()
              ..showSnackBar(const SnackBar(
                content: Text('no internet connection'),
              ));
          });
        });

    return const SizedBox();
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    // if we typed one of the suggestions show it alone in the list
    final suggestions = searchSuggestions.where((suggestion) {
      suggestion = suggestion.toLowerCase();
      return suggestion.contains(query.toLowerCase());
    }).toList();

    return ListView.builder(
      itemCount: suggestions.length,
      itemBuilder: (BuildContext context, int index) {
        return ListTile(
          title: Text(suggestions[index]),
          onTap: () {
            query = suggestions[index];
          },
        );
      },
    );
  }
}
