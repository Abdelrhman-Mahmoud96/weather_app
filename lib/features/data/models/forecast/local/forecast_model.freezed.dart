// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'forecast_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

ForecastModel _$ForecastModelFromJson(Map<String, dynamic> json) {
  return _ForecastModel.fromJson(json);
}

/// @nodoc
mixin _$ForecastModel {
  List<DailyForecastsModel> get dailyForecasts =>
      throw _privateConstructorUsedError;
  List<HourlyForecastModel> get hourlyForecasts =>
      throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ForecastModelCopyWith<ForecastModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ForecastModelCopyWith<$Res> {
  factory $ForecastModelCopyWith(
          ForecastModel value, $Res Function(ForecastModel) then) =
      _$ForecastModelCopyWithImpl<$Res>;
  $Res call(
      {List<DailyForecastsModel> dailyForecasts,
      List<HourlyForecastModel> hourlyForecasts});
}

/// @nodoc
class _$ForecastModelCopyWithImpl<$Res>
    implements $ForecastModelCopyWith<$Res> {
  _$ForecastModelCopyWithImpl(this._value, this._then);

  final ForecastModel _value;
  // ignore: unused_field
  final $Res Function(ForecastModel) _then;

  @override
  $Res call({
    Object? dailyForecasts = freezed,
    Object? hourlyForecasts = freezed,
  }) {
    return _then(_value.copyWith(
      dailyForecasts: dailyForecasts == freezed
          ? _value.dailyForecasts
          : dailyForecasts // ignore: cast_nullable_to_non_nullable
              as List<DailyForecastsModel>,
      hourlyForecasts: hourlyForecasts == freezed
          ? _value.hourlyForecasts
          : hourlyForecasts // ignore: cast_nullable_to_non_nullable
              as List<HourlyForecastModel>,
    ));
  }
}

/// @nodoc
abstract class _$$_ForecastModelCopyWith<$Res>
    implements $ForecastModelCopyWith<$Res> {
  factory _$$_ForecastModelCopyWith(
          _$_ForecastModel value, $Res Function(_$_ForecastModel) then) =
      __$$_ForecastModelCopyWithImpl<$Res>;
  @override
  $Res call(
      {List<DailyForecastsModel> dailyForecasts,
      List<HourlyForecastModel> hourlyForecasts});
}

/// @nodoc
class __$$_ForecastModelCopyWithImpl<$Res>
    extends _$ForecastModelCopyWithImpl<$Res>
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
              as List<DailyForecastsModel>,
      hourlyForecasts: hourlyForecasts == freezed
          ? _value._hourlyForecasts
          : hourlyForecasts // ignore: cast_nullable_to_non_nullable
              as List<HourlyForecastModel>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_ForecastModel implements _ForecastModel {
  const _$_ForecastModel(
      {required final List<DailyForecastsModel> dailyForecasts,
      required final List<HourlyForecastModel> hourlyForecasts})
      : _dailyForecasts = dailyForecasts,
        _hourlyForecasts = hourlyForecasts;

  factory _$_ForecastModel.fromJson(Map<String, dynamic> json) =>
      _$$_ForecastModelFromJson(json);

  final List<DailyForecastsModel> _dailyForecasts;
  @override
  List<DailyForecastsModel> get dailyForecasts {
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_dailyForecasts);
  }

  final List<HourlyForecastModel> _hourlyForecasts;
  @override
  List<HourlyForecastModel> get hourlyForecasts {
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_hourlyForecasts);
  }

  @override
  String toString() {
    return 'ForecastModel(dailyForecasts: $dailyForecasts, hourlyForecasts: $hourlyForecasts)';
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

abstract class _ForecastModel implements ForecastModel {
  const factory _ForecastModel(
          {required final List<DailyForecastsModel> dailyForecasts,
          required final List<HourlyForecastModel> hourlyForecasts}) =
      _$_ForecastModel;

  factory _ForecastModel.fromJson(Map<String, dynamic> json) =
      _$_ForecastModel.fromJson;

  @override
  List<DailyForecastsModel> get dailyForecasts;
  @override
  List<HourlyForecastModel> get hourlyForecasts;
  @override
  @JsonKey(ignore: true)
  _$$_ForecastModelCopyWith<_$_ForecastModel> get copyWith =>
      throw _privateConstructorUsedError;
}
