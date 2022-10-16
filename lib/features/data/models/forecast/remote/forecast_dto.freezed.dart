// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'forecast_dto.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

ForecastDTO _$ForecastDTOFromJson(Map<String, dynamic> json) {
  return _ForecastModel.fromJson(json);
}

/// @nodoc
mixin _$ForecastDTO {
  List<DailyForecastsDTO> get dailyForecasts =>
      throw _privateConstructorUsedError;
  List<HourlyForecastDTO> get hourlyForecasts =>
      throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ForecastDTOCopyWith<ForecastDTO> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ForecastDTOCopyWith<$Res> {
  factory $ForecastDTOCopyWith(
          ForecastDTO value, $Res Function(ForecastDTO) then) =
      _$ForecastDTOCopyWithImpl<$Res>;
  $Res call(
      {List<DailyForecastsDTO> dailyForecasts,
      List<HourlyForecastDTO> hourlyForecasts});
}

/// @nodoc
class _$ForecastDTOCopyWithImpl<$Res> implements $ForecastDTOCopyWith<$Res> {
  _$ForecastDTOCopyWithImpl(this._value, this._then);

  final ForecastDTO _value;
  // ignore: unused_field
  final $Res Function(ForecastDTO) _then;

  @override
  $Res call({
    Object? dailyForecasts = freezed,
    Object? hourlyForecasts = freezed,
  }) {
    return _then(_value.copyWith(
      dailyForecasts: dailyForecasts == freezed
          ? _value.dailyForecasts
          : dailyForecasts // ignore: cast_nullable_to_non_nullable
              as List<DailyForecastsDTO>,
      hourlyForecasts: hourlyForecasts == freezed
          ? _value.hourlyForecasts
          : hourlyForecasts // ignore: cast_nullable_to_non_nullable
              as List<HourlyForecastDTO>,
    ));
  }
}

/// @nodoc
abstract class _$$_ForecastModelCopyWith<$Res>
    implements $ForecastDTOCopyWith<$Res> {
  factory _$$_ForecastModelCopyWith(
          _$_ForecastModel value, $Res Function(_$_ForecastModel) then) =
      __$$_ForecastModelCopyWithImpl<$Res>;
  @override
  $Res call(
      {List<DailyForecastsDTO> dailyForecasts,
      List<HourlyForecastDTO> hourlyForecasts});
}

/// @nodoc
class __$$_ForecastModelCopyWithImpl<$Res>
    extends _$ForecastDTOCopyWithImpl<$Res>
    implements _$$_ForecastModelCopyWith<$Res> {
  __$$_ForecastModelCopyWithImpl(
      _$_ForecastModel _value, $Res Function(_$_ForecastModel) _then)
      : super(_value, (v) => _then(v as _$_ForecastModel));

  @override
  _$_ForecastModel get _value => super._value as _$_ForecastModel;

  @override
  $Res call({
    Object? dailyForecasts = freezed,
    Object? hourlyForecasts = freezed,
  }) {
    return _then(_$_ForecastModel(
      dailyForecasts: dailyForecasts == freezed
          ? _value._dailyForecasts
          : dailyForecasts // ignore: cast_nullable_to_non_nullable
              as List<DailyForecastsDTO>,
      hourlyForecasts: hourlyForecasts == freezed
          ? _value._hourlyForecasts
          : hourlyForecasts // ignore: cast_nullable_to_non_nullable
              as List<HourlyForecastDTO>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_ForecastModel implements _ForecastModel {
  const _$_ForecastModel(
      {required final List<DailyForecastsDTO> dailyForecasts,
      required final List<HourlyForecastDTO> hourlyForecasts})
      : _dailyForecasts = dailyForecasts,
        _hourlyForecasts = hourlyForecasts;

  factory _$_ForecastModel.fromJson(Map<String, dynamic> json) =>
      _$$_ForecastModelFromJson(json);

  final List<DailyForecastsDTO> _dailyForecasts;
  @override
  List<DailyForecastsDTO> get dailyForecasts {
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_dailyForecasts);
  }

  final List<HourlyForecastDTO> _hourlyForecasts;
  @override
  List<HourlyForecastDTO> get hourlyForecasts {
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_hourlyForecasts);
  }

  @override
  String toString() {
    return 'ForecastDTO(dailyForecasts: $dailyForecasts, hourlyForecasts: $hourlyForecasts)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_ForecastModel &&
            const DeepCollectionEquality()
                .equals(other._dailyForecasts, _dailyForecasts) &&
            const DeepCollectionEquality()
                .equals(other._hourlyForecasts, _hourlyForecasts));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(_dailyForecasts),
      const DeepCollectionEquality().hash(_hourlyForecasts));

  @JsonKey(ignore: true)
  @override
  _$$_ForecastModelCopyWith<_$_ForecastModel> get copyWith =>
      __$$_ForecastModelCopyWithImpl<_$_ForecastModel>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_ForecastModelToJson(
      this,
    );
  }
}

abstract class _ForecastModel implements ForecastDTO {
  const factory _ForecastModel(
          {required final List<DailyForecastsDTO> dailyForecasts,
          required final List<HourlyForecastDTO> hourlyForecasts}) =
      _$_ForecastModel;

  factory _ForecastModel.fromJson(Map<String, dynamic> json) =
      _$_ForecastModel.fromJson;

  @override
  List<DailyForecastsDTO> get dailyForecasts;
  @override
  List<HourlyForecastDTO> get hourlyForecasts;
  @override
  @JsonKey(ignore: true)
  _$$_ForecastModelCopyWith<_$_ForecastModel> get copyWith =>
      throw _privateConstructorUsedError;
}
