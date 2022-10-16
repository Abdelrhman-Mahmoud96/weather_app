import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'country_dto.g.dart';

@JsonSerializable()
class CountryDTO extends Equatable {
  const CountryDTO({this.countryName});

  @JsonKey(name: 'LocalizedName')
  final String? countryName;

  static CountryDTO fromJson(Map<String, dynamic> data) =>
      _$CountryDTOFromJson(data);

  Map<String, dynamic> toJson() => _$CountryDTOToJson(this);

  @override
  List<Object?> get props => [countryName];
}
