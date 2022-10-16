import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'daily_sun_info.g.dart';

@JsonSerializable()
class DailySunInfo extends Equatable{
  const DailySunInfo({this.riseTime, this.setTime});

  @JsonKey(name: 'EpochRise')
  final int? riseTime;
  @JsonKey(name: 'EpochSet')
  final int? setTime;

  static DailySunInfo fromJson(Map<String, dynamic> json) => _$DailySunInfoFromJson(json);
   Map<String, dynamic> toJson() => _$DailySunInfoToJson(this);
  
  @override
  List<Object?> get props => [riseTime, setTime];
}
