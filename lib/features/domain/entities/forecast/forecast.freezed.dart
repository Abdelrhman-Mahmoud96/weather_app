// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'forecast.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$Forecast {
  List<DailyForecasts> get dailyForecasts => throw _privateConstructorUsedError;
  List<HourlyForecast> get hourlyForecast => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $ForecastCopyWith<Forecast> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ForecastCopyWith<$Res> {
  factory $ForecastCopyWith(Forecast value, $Res Function(Forecast) then) =
      _$ForecastCopyWithImpl<$Res>;
  $Res call(
      {List<DailyForecasts> dailyForecasts,
      List<HourlyForecast> hourlyForecast});
}

/// @nodoc
class _$ForecastCopyWithImpl<$Res> implements $ForecastCopyWith<$Res> {
  _$ForecastCopyWithImpl(this._value, this._then);

  final Forecast _value;
  // ignore: unused_field
  final $Res Function(Forecast) _then;

  @override
  $Res call({
    Object? dailyForecasts = freezed,
    Object? hourlyForecast = freezed,
  }) {
    return _then(_value.copyWith(
      dailyForecasts: dailyForecasts == freezed
          ? _value.dailyForecasts
          : dailyForecasts // ignore: cast_nullable_to_non_nullable
              as List<DailyForecasts>,
      hourlyForecast: hourlyForecast == freezed
          ? _value.hourlyForecast
          : hourlyForecast // ignore: cast_nullable_to_non_nullable
              as List<HourlyForecast>,
    ));
  }
}

/// @nodoc
abstract class _$$_ForecastCopyWith<$Res> implements $ForecastCopyWith<$Res> {
  factory _$$_ForecastCopyWith(
          _$_Forecast value, $Res Function(_$_Forecast) then) =
      __$$_ForecastCopyWithImpl<$Res>;
  @override
  $Res call(
      {List<DailyForecasts> dailyForecasts,
      List<HourlyForecast> hourlyForecast});
}

/// @nodoc
class __$$_ForecastCopyWithImpl<$Res> extends _$ForecastCopyWithImpl<$Res>
    implements _$$_ForecastCopyWith<$Res> {
  __$$_ForecastCopyWithImpl(
      _$_Forecast _value, $Res Function(_$_Forecast) _then)
      : super(_value, (v) => _then(v as _$_Forecast));

  @override
  _$_Forecast get _value => super._value as _$_Forecast;

  @override
  $Res call({
    Object? dailyForecasts = freezed,
    Object? hourlyForecast = freezed,
  }) {
    return _then(_$_Forecast(
      dailyForecasts: dailyForecasts == freezed
          ? _value._dailyForecasts
          : dailyForecasts // ignore: cast_nullable_to_non_nullable
              as List<DailyForecasts>,
      hourlyForecast: hourlyForecast == freezed
          ? _value._hourlyForecast
          : hourlyForecast // ignore: cast_nullable_to_non_nullable
              as List<HourlyForecast>,
    ));
  }
}

/// @nodoc

class _$_Forecast implements _Forecast {
  const _$_Forecast(
      {required final List<DailyForecasts> dailyForecasts,
      required final List<HourlyForecast> hourlyForecast})
      : _dailyForecasts = dailyForecasts,
        _hourlyForecast = hourlyForecast;

  final List<DailyForecasts> _dailyForecasts;
  @override
  List<DailyForecasts> get dailyForecasts {
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_dailyForecasts);
  }

  final List<HourlyForecast> _hourlyForecast;
  @override
  List<HourlyForecast> get hourlyForecast {
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_hourlyForecast);
  }

  @override
  String toString() {
    return 'Forecast(dailyForecasts: $dailyForecasts, hourlyForecast: $hourlyForecast)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_Forecast &&
            const DeepCollectionEquality()
                .equals(other._dailyForecasts, _dailyForecasts) &&
            const DeepCollectionEquality()
                .equals(other._hourlyForecast, _hourlyForecast));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(_dailyForecasts),
      const DeepCollectionEquality().hash(_hourlyForecast));

  @JsonKey(ignore: true)
  @override
  _$$_ForecastCopyWith<_$_Forecast> get copyWith =>
      __$$_ForecastCopyWithImpl<_$_Forecast>(this, _$identity);
}

abstract class _Forecast implements Forecast {
  const factory _Forecast(
      {required final List<DailyForecasts> dailyForecasts,
      required final List<HourlyForecast> hourlyForecast}) = _$_Forecast;

  @override
  List<DailyForecasts> get dailyForecasts;
  @override
  List<HourlyForecast> get hourlyForecast;
  @override
  @JsonKey(ignore: true)
  _$$_ForecastCopyWith<_$_Forecast> get copyWith =>
      throw _privateConstructorUsedError;
}
