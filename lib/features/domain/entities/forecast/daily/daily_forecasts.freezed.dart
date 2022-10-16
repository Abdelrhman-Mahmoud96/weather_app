// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'daily_forecasts.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$DailyForecasts {
  int get epochDate => throw _privateConstructorUsedError;
  DailySunInfo get sunInfo => throw _privateConstructorUsedError;
  DailyTemperature get temperature => throw _privateConstructorUsedError;
  DayNightTimeInfo get dayTimeInfo => throw _privateConstructorUsedError;
  DayNightTimeInfo get nightTimeInfo => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $DailyForecastsCopyWith<DailyForecasts> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $DailyForecastsCopyWith<$Res> {
  factory $DailyForecastsCopyWith(
          DailyForecasts value, $Res Function(DailyForecasts) then) =
      _$DailyForecastsCopyWithImpl<$Res>;
  $Res call(
      {int epochDate,
      DailySunInfo sunInfo,
      DailyTemperature temperature,
      DayNightTimeInfo dayTimeInfo,
      DayNightTimeInfo nightTimeInfo});
}

/// @nodoc
class _$DailyForecastsCopyWithImpl<$Res>
    implements $DailyForecastsCopyWith<$Res> {
  _$DailyForecastsCopyWithImpl(this._value, this._then);

  final DailyForecasts _value;
  // ignore: unused_field
  final $Res Function(DailyForecasts) _then;

  @override
  $Res call({
    Object? epochDate = freezed,
    Object? sunInfo = freezed,
    Object? temperature = freezed,
    Object? dayTimeInfo = freezed,
    Object? nightTimeInfo = freezed,
  }) {
    return _then(_value.copyWith(
      epochDate: epochDate == freezed
          ? _value.epochDate
          : epochDate // ignore: cast_nullable_to_non_nullable
              as int,
      sunInfo: sunInfo == freezed
          ? _value.sunInfo
          : sunInfo // ignore: cast_nullable_to_non_nullable
              as DailySunInfo,
      temperature: temperature == freezed
          ? _value.temperature
          : temperature // ignore: cast_nullable_to_non_nullable
              as DailyTemperature,
      dayTimeInfo: dayTimeInfo == freezed
          ? _value.dayTimeInfo
          : dayTimeInfo // ignore: cast_nullable_to_non_nullable
              as DayNightTimeInfo,
      nightTimeInfo: nightTimeInfo == freezed
          ? _value.nightTimeInfo
          : nightTimeInfo // ignore: cast_nullable_to_non_nullable
              as DayNightTimeInfo,
    ));
  }
}

/// @nodoc
abstract class _$$_DailyForecastsCopyWith<$Res>
    implements $DailyForecastsCopyWith<$Res> {
  factory _$$_DailyForecastsCopyWith(
          _$_DailyForecasts value, $Res Function(_$_DailyForecasts) then) =
      __$$_DailyForecastsCopyWithImpl<$Res>;
  @override
  $Res call(
      {int epochDate,
      DailySunInfo sunInfo,
      DailyTemperature temperature,
      DayNightTimeInfo dayTimeInfo,
      DayNightTimeInfo nightTimeInfo});
}

/// @nodoc
class __$$_DailyForecastsCopyWithImpl<$Res>
    extends _$DailyForecastsCopyWithImpl<$Res>
    implements _$$_DailyForecastsCopyWith<$Res> {
  __$$_DailyForecastsCopyWithImpl(
      _$_DailyForecasts _value, $Res Function(_$_DailyForecasts) _then)
      : super(_value, (v) => _then(v as _$_DailyForecasts));

  @override
  _$_DailyForecasts get _value => super._value as _$_DailyForecasts;

  @override
  $Res call({
    Object? epochDate = freezed,
    Object? sunInfo = freezed,
    Object? temperature = freezed,
    Object? dayTimeInfo = freezed,
    Object? nightTimeInfo = freezed,
  }) {
    return _then(_$_DailyForecasts(
      epochDate: epochDate == freezed
          ? _value.epochDate
          : epochDate // ignore: cast_nullable_to_non_nullable
              as int,
      sunInfo: sunInfo == freezed
          ? _value.sunInfo
          : sunInfo // ignore: cast_nullable_to_non_nullable
              as DailySunInfo,
      temperature: temperature == freezed
          ? _value.temperature
          : temperature // ignore: cast_nullable_to_non_nullable
              as DailyTemperature,
      dayTimeInfo: dayTimeInfo == freezed
          ? _value.dayTimeInfo
          : dayTimeInfo // ignore: cast_nullable_to_non_nullable
              as DayNightTimeInfo,
      nightTimeInfo: nightTimeInfo == freezed
          ? _value.nightTimeInfo
          : nightTimeInfo // ignore: cast_nullable_to_non_nullable
              as DayNightTimeInfo,
    ));
  }
}

/// @nodoc

class _$_DailyForecasts implements _DailyForecasts {
  const _$_DailyForecasts(
      {required this.epochDate,
      required this.sunInfo,
      required this.temperature,
      required this.dayTimeInfo,
      required this.nightTimeInfo});

  @override
  final int epochDate;
  @override
  final DailySunInfo sunInfo;
  @override
  final DailyTemperature temperature;
  @override
  final DayNightTimeInfo dayTimeInfo;
  @override
  final DayNightTimeInfo nightTimeInfo;

  @override
  String toString() {
    return 'DailyForecasts(epochDate: $epochDate, sunInfo: $sunInfo, temperature: $temperature, dayTimeInfo: $dayTimeInfo, nightTimeInfo: $nightTimeInfo)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_DailyForecasts &&
            const DeepCollectionEquality().equals(other.epochDate, epochDate) &&
            const DeepCollectionEquality().equals(other.sunInfo, sunInfo) &&
            const DeepCollectionEquality()
                .equals(other.temperature, temperature) &&
            const DeepCollectionEquality()
                .equals(other.dayTimeInfo, dayTimeInfo) &&
            const DeepCollectionEquality()
                .equals(other.nightTimeInfo, nightTimeInfo));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(epochDate),
      const DeepCollectionEquality().hash(sunInfo),
      const DeepCollectionEquality().hash(temperature),
      const DeepCollectionEquality().hash(dayTimeInfo),
      const DeepCollectionEquality().hash(nightTimeInfo));

  @JsonKey(ignore: true)
  @override
  _$$_DailyForecastsCopyWith<_$_DailyForecasts> get copyWith =>
      __$$_DailyForecastsCopyWithImpl<_$_DailyForecasts>(this, _$identity);
}

abstract class _DailyForecasts implements DailyForecasts {
  const factory _DailyForecasts(
      {required final int epochDate,
      required final DailySunInfo sunInfo,
      required final DailyTemperature temperature,
      required final DayNightTimeInfo dayTimeInfo,
      required final DayNightTimeInfo nightTimeInfo}) = _$_DailyForecasts;

  @override
  int get epochDate;
  @override
  DailySunInfo get sunInfo;
  @override
  DailyTemperature get temperature;
  @override
  DayNightTimeInfo get dayTimeInfo;
  @override
  DayNightTimeInfo get nightTimeInfo;
  @override
  @JsonKey(ignore: true)
  _$$_DailyForecastsCopyWith<_$_DailyForecasts> get copyWith =>
      throw _privateConstructorUsedError;
}
