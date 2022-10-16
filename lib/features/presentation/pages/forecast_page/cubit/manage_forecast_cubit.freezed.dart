// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'manage_forecast_cubit.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$ManageForecastState {
  ManageForecastStatus? get manageForecastStatus =>
      throw _privateConstructorUsedError;
  Forecast? get forecast => throw _privateConstructorUsedError;
  List<Map<String, Forecast>>? get allLocationsForecast =>
      throw _privateConstructorUsedError;
  String? get errorMessage => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $ManageForecastStateCopyWith<ManageForecastState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ManageForecastStateCopyWith<$Res> {
  factory $ManageForecastStateCopyWith(
          ManageForecastState value, $Res Function(ManageForecastState) then) =
      _$ManageForecastStateCopyWithImpl<$Res>;
  $Res call(
      {ManageForecastStatus? manageForecastStatus,
      Forecast? forecast,
      List<Map<String, Forecast>>? allLocationsForecast,
      String? errorMessage});

  $ForecastCopyWith<$Res>? get forecast;
}

/// @nodoc
class _$ManageForecastStateCopyWithImpl<$Res>
    implements $ManageForecastStateCopyWith<$Res> {
  _$ManageForecastStateCopyWithImpl(this._value, this._then);

  final ManageForecastState _value;
  // ignore: unused_field
  final $Res Function(ManageForecastState) _then;

  @override
  $Res call({
    Object? manageForecastStatus = freezed,
    Object? forecast = freezed,
    Object? allLocationsForecast = freezed,
    Object? errorMessage = freezed,
  }) {
    return _then(_value.copyWith(
      manageForecastStatus: manageForecastStatus == freezed
          ? _value.manageForecastStatus
          : manageForecastStatus // ignore: cast_nullable_to_non_nullable
              as ManageForecastStatus?,
      forecast: forecast == freezed
          ? _value.forecast
          : forecast // ignore: cast_nullable_to_non_nullable
              as Forecast?,
      allLocationsForecast: allLocationsForecast == freezed
          ? _value.allLocationsForecast
          : allLocationsForecast // ignore: cast_nullable_to_non_nullable
              as List<Map<String, Forecast>>?,
      errorMessage: errorMessage == freezed
          ? _value.errorMessage
          : errorMessage // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }

  @override
  $ForecastCopyWith<$Res>? get forecast {
    if (_value.forecast == null) {
      return null;
    }

    return $ForecastCopyWith<$Res>(_value.forecast!, (value) {
      return _then(_value.copyWith(forecast: value));
    });
  }
}

/// @nodoc
abstract class _$$_ManageForecastStateCopyWith<$Res>
    implements $ManageForecastStateCopyWith<$Res> {
  factory _$$_ManageForecastStateCopyWith(_$_ManageForecastState value,
          $Res Function(_$_ManageForecastState) then) =
      __$$_ManageForecastStateCopyWithImpl<$Res>;
  @override
  $Res call(
      {ManageForecastStatus? manageForecastStatus,
      Forecast? forecast,
      List<Map<String, Forecast>>? allLocationsForecast,
      String? errorMessage});

  @override
  $ForecastCopyWith<$Res>? get forecast;
}

/// @nodoc
class __$$_ManageForecastStateCopyWithImpl<$Res>
    extends _$ManageForecastStateCopyWithImpl<$Res>
    implements _$$_ManageForecastStateCopyWith<$Res> {
  __$$_ManageForecastStateCopyWithImpl(_$_ManageForecastState _value,
      $Res Function(_$_ManageForecastState) _then)
      : super(_value, (v) => _then(v as _$_ManageForecastState));

  @override
  _$_ManageForecastState get _value => super._value as _$_ManageForecastState;

  @override
  $Res call({
    Object? manageForecastStatus = freezed,
    Object? forecast = freezed,
    Object? allLocationsForecast = freezed,
    Object? errorMessage = freezed,
  }) {
    return _then(_$_ManageForecastState(
      manageForecastStatus: manageForecastStatus == freezed
          ? _value.manageForecastStatus
          : manageForecastStatus // ignore: cast_nullable_to_non_nullable
              as ManageForecastStatus?,
      forecast: forecast == freezed
          ? _value.forecast
          : forecast // ignore: cast_nullable_to_non_nullable
              as Forecast?,
      allLocationsForecast: allLocationsForecast == freezed
          ? _value._allLocationsForecast
          : allLocationsForecast // ignore: cast_nullable_to_non_nullable
              as List<Map<String, Forecast>>?,
      errorMessage: errorMessage == freezed
          ? _value.errorMessage
          : errorMessage // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc

class _$_ManageForecastState implements _ManageForecastState {
  const _$_ManageForecastState(
      {this.manageForecastStatus = ManageForecastStatus.initial,
      this.forecast,
      final List<Map<String, Forecast>>? allLocationsForecast,
      this.errorMessage = ''})
      : _allLocationsForecast = allLocationsForecast;

  @override
  @JsonKey()
  final ManageForecastStatus? manageForecastStatus;
  @override
  final Forecast? forecast;
  final List<Map<String, Forecast>>? _allLocationsForecast;
  @override
  List<Map<String, Forecast>>? get allLocationsForecast {
    final value = _allLocationsForecast;
    if (value == null) return null;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  @JsonKey()
  final String? errorMessage;

  @override
  String toString() {
    return 'ManageForecastState(manageForecastStatus: $manageForecastStatus, forecast: $forecast, allLocationsForecast: $allLocationsForecast, errorMessage: $errorMessage)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_ManageForecastState &&
            const DeepCollectionEquality()
                .equals(other.manageForecastStatus, manageForecastStatus) &&
            const DeepCollectionEquality().equals(other.forecast, forecast) &&
            const DeepCollectionEquality()
                .equals(other._allLocationsForecast, _allLocationsForecast) &&
            const DeepCollectionEquality()
                .equals(other.errorMessage, errorMessage));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(manageForecastStatus),
      const DeepCollectionEquality().hash(forecast),
      const DeepCollectionEquality().hash(_allLocationsForecast),
      const DeepCollectionEquality().hash(errorMessage));

  @JsonKey(ignore: true)
  @override
  _$$_ManageForecastStateCopyWith<_$_ManageForecastState> get copyWith =>
      __$$_ManageForecastStateCopyWithImpl<_$_ManageForecastState>(
          this, _$identity);
}

abstract class _ManageForecastState implements ManageForecastState {
  const factory _ManageForecastState(
      {final ManageForecastStatus? manageForecastStatus,
      final Forecast? forecast,
      final List<Map<String, Forecast>>? allLocationsForecast,
      final String? errorMessage}) = _$_ManageForecastState;

  @override
  ManageForecastStatus? get manageForecastStatus;
  @override
  Forecast? get forecast;
  @override
  List<Map<String, Forecast>>? get allLocationsForecast;
  @override
  String? get errorMessage;
  @override
  @JsonKey(ignore: true)
  _$$_ManageForecastStateCopyWith<_$_ManageForecastState> get copyWith =>
      throw _privateConstructorUsedError;
}
