// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'daily_forecasts_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

DailyForecastsModel _$DailyForecastsModelFromJson(Map<String, dynamic> json) {
  return _DailyForecastsModel.fromJson(json);
}

/// @nodoc
mixin _$DailyForecastsModel {
  int get epochDate => throw _privateConstructorUsedError;
  DailySunInfo get sunInfo => throw _privateConstructorUsedError;
  DailyTemperature get temperature => throw _privateConstructorUsedError;
  DayNightTimeInfo get dayTimeInfo => throw _privateConstructorUsedError;
  DayNightTimeInfo get nightTimeInfo => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $DailyForecastsModelCopyWith<DailyForecastsModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $DailyForecastsModelCopyWith<$Res> {
  factory $DailyForecastsModelCopyWith(
          DailyForecastsModel value, $Res Function(DailyForecastsModel) then) =
      _$DailyForecastsModelCopyWithImpl<$Res>;
  $Res call(
      {int epochDate,
      DailySunInfo sunInfo,
      DailyTemperature temperature,
      DayNightTimeInfo dayTimeInfo,
      DayNightTimeInfo nightTimeInfo});
}

/// @nodoc
class _$DailyForecastsModelCopyWithImpl<$Res>
    implements $DailyForecastsModelCopyWith<$Res> {
  _$DailyForecastsModelCopyWithImpl(this._value, this._then);

  final DailyForecastsModel _value;
  // ignore: unused_field
  final $Res Function(DailyForecastsModel) _then;

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
abstract class _$$_DailyForecastsModelCopyWith<$Res>
    implements $DailyForecastsModelCopyWith<$Res> {
  factory _$$_DailyForecastsModelCopyWith(_$_DailyForecastsModel value,
          $Res Function(_$_DailyForecastsModel) then) =
      __$$_DailyForecastsModelCopyWithImpl<$Res>;
  @override
  $Res call(
      {int epochDate,
      DailySunInfo sunInfo,
      DailyTemperature temperature,
      DayNightTimeInfo dayTimeInfo,
      DayNightTimeInfo nightTimeInfo});
}

/// @nodoc
class __$$_DailyForecastsModelCopyWithImpl<$Res>
    extends _$DailyForecastsModelCopyWithImpl<$Res>
    implements _$$_DailyForecastsModelCopyWith<$Res> {
  __$$_DailyForecastsModelCopyWithImpl(_$_DailyForecastsModel _value,
      $Res Function(_$_DailyForecastsModel) _then)
      : super(_value, (v) => _then(v as _$_DailyForecastsModel));

  @override
  _$_DailyForecastsModel get _value => super._value as _$_DailyForecastsModel;

  @override
  $Res call({
    Object? epochDate = freezed,
    Object? sunInfo = freezed,
    Object? temperature = freezed,
    Object? dayTimeInfo = freezed,
    Object? nightTimeInfo = freezed,
  }) {
    return _then(_$_DailyForecastsModel(
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
@JsonSerializable()
class _$_DailyForecastsModel implements _DailyForecastsModel {
  const _$_DailyForecastsModel(
      {required this.epochDate,
      required this.sunInfo,
      required this.temperature,
      required this.dayTimeInfo,
      required this.nightTimeInfo});

  factory _$_DailyForecastsModel.fromJson(Map<String, dynamic> json) =>
      _$$_DailyForecastsModelFromJson(json);

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
    return 'DailyForecastsModel(epochDate: $epochDate, sunInfo: $sunInfo, temperature: $temperature, dayTimeInfo: $dayTimeInfo, nightTimeInfo: $nightTimeInfo)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_DailyForecastsModel &&
            const DeepCollectionEquality().equals(other.epochDate, epochDate) &&
            const DeepCollectionEquality().equals(other.sunInfo, sunInfo) &&
            const DeepCollectionEquality()
                .equals(other.temperature, temperature) &&
            const DeepCollectionEquality()
                .equals(other.dayTimeInfo, dayTimeInfo) &&
            const DeepCollectionEquality()
                .equals(other.nightTimeInfo, nightTimeInfo));
  }

  @JsonKey(ignore: true)
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
  _$$_DailyForecastsModelCopyWith<_$_DailyForecastsModel> get copyWith =>
      __$$_DailyForecastsModelCopyWithImpl<_$_DailyForecastsModel>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_DailyForecastsModelToJson(
      this,
    );
  }
}

abstract class _DailyForecastsModel implements DailyForecastsModel {
  const factory _DailyForecastsModel(
      {required final int epochDate,
      required final DailySunInfo sunInfo,
      required final DailyTemperature temperature,
      required final DayNightTimeInfo dayTimeInfo,
      required final DayNightTimeInfo nightTimeInfo}) = _$_DailyForecastsModel;

  factory _DailyForecastsModel.fromJson(Map<String, dynamic> json) =
      _$_DailyForecastsModel.fromJson;

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
  _$$_DailyForecastsModelCopyWith<_$_DailyForecastsModel> get copyWith =>
      throw _privateConstructorUsedError;
}
