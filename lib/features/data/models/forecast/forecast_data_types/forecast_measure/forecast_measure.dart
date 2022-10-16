import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'forecast_measure.g.dart';

@JsonSerializable()
class ForecastMeasure extends Equatable {
  const ForecastMeasure({
    this.value,
    this.unit,
  });

  @JsonKey(name: 'Value')
  final double? value;
  @JsonKey(name: 'Unit')
  final String? unit;

  static ForecastMeasure fromJson(Map<String, dynamic> data) =>
      _$ForecastMeasureFromJson(data);

  Map<String, dynamic> toJson() => _$ForecastMeasureToJson(this);
  
  @override
  List<Object?> get props => [value, unit];
}
