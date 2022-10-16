import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'day_night_time_info.g.dart';

// silly class for one member, but thats what we need from that json for now,
// we can add more info later
@JsonSerializable()
class DayNightTimeInfo extends Equatable {
  const DayNightTimeInfo({
    this.weatherIcon,
  });

  @JsonKey(name: 'Icon')
  final int? weatherIcon;

  static DayNightTimeInfo fromJson(Map<String, dynamic> json) =>
      _$DayNightTimeInfoFromJson(json);
  Map<String, dynamic> toJson() => _$DayNightTimeInfoToJson(this);

  @override
  List<Object?> get props => [weatherIcon];
}
