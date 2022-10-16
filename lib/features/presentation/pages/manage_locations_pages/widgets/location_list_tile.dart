import 'package:custom_check_box/custom_check_box.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:weather_app_task/features/domain/entities/location/location.dart';
import 'package:weather_app_task/theme/weather_colors.dart';

class LocationsListTile extends StatelessWidget {
  const LocationsListTile({
    Key? key,
    required this.locationEntity,
    required this.onDismissed,
    required this.onTap,
    required this.onToggleFavorite,
  }) : super(key: key);

  final Location locationEntity;
  final DismissDirectionCallback? onDismissed;
  final VoidCallback? onTap;
  final ValueChanged<bool> onToggleFavorite;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(8.r),
      child: Dismissible(
        key: Key('note_list_dismissible_${locationEntity.locationId}'),
        onDismissed: onDismissed,
        direction: DismissDirection.endToStart,
        // dismissed background that show when we swipe the tile
        background: Container(
          color: Theme.of(context).colorScheme.error,
          alignment: Alignment.centerRight,
          padding: EdgeInsets.symmetric(horizontal: 16.w),
          child: const Text(
            'Delete?',
            style: TextStyle(color: WeatherColors.weatherWhite),
          ),
        ),
        child: Material(
          color: WeatherColors.weatherYellow,
          elevation: 0,
          child: ListTile(
            title: Text(
              locationEntity.locationName,
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              style: const TextStyle(
                color: WeatherColors.weatherWhite,
                overflow: TextOverflow.ellipsis,
              ),
            ),
            //is favorite checkbox
            trailing: CustomCheckBox(
              value: locationEntity.isFavorite,
              checkedIcon: Icons.star,
              checkedIconColor: WeatherColors.weatherYellow,
              uncheckedIcon: Icons.star_border,
              uncheckedIconColor: WeatherColors.weatherYellow,
              checkedFillColor: WeatherColors.weatherDarkGray,
              uncheckedFillColor: WeatherColors.weatherDarkGray,
              borderColor: WeatherColors.weatherDarkGray,
              borderRadius: 0.0,
              checkBoxSize: 21,
              onChanged: (value) => onToggleFavorite(value),
            ),
            onTap: onTap,
          ),
        ),
      ),
    );
  }
}
