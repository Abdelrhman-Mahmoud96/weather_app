// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'location_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

LocationModel _$LocationModelFromJson(Map<String, dynamic> json) {
  return _LocationModel.fromJson(json);
}

/// @nodoc
mixin _$LocationModel {
  String get locationId => throw _privateConstructorUsedError;
  String get locationName => throw _privateConstructorUsedError;
  CountryDTO get country => throw _privateConstructorUsedError;
  bool get isFavorite => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $LocationModelCopyWith<LocationModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $LocationModelCopyWith<$Res> {
  factory $LocationModelCopyWith(
          LocationModel value, $Res Function(LocationModel) then) =
      _$LocationModelCopyWithImpl<$Res>;
  $Res call(
      {String locationId,
      String locationName,
      CountryDTO country,
      bool isFavorite});
}

/// @nodoc
class _$LocationModelCopyWithImpl<$Res>
    implements $LocationModelCopyWith<$Res> {
  _$LocationModelCopyWithImpl(this._value, this._then);

  final LocationModel _value;
  // ignore: unused_field
  final $Res Function(LocationModel) _then;

  @override
  $Res call({
    Object? locationId = freezed,
    Object? locationName = freezed,
    Object? country = freezed,
    Object? isFavorite = freezed,
  }) {
    return _then(_value.copyWith(
      locationId: locationId == freezed
          ? _value.locationId
          : locationId // ignore: cast_nullable_to_non_nullable
              as String,
      locationName: locationName == freezed
          ? _value.locationName
          : locationName // ignore: cast_nullable_to_non_nullable
              as String,
      country: country == freezed
          ? _value.country
          : country // ignore: cast_nullable_to_non_nullable
              as CountryDTO,
      isFavorite: isFavorite == freezed
          ? _value.isFavorite
          : isFavorite // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc
abstract class _$$_LocationModelCopyWith<$Res>
    implements $LocationModelCopyWith<$Res> {
  factory _$$_LocationModelCopyWith(
          _$_LocationModel value, $Res Function(_$_LocationModel) then) =
      __$$_LocationModelCopyWithImpl<$Res>;
  @override
  $Res call(
      {String locationId,
      String locationName,
      CountryDTO country,
      bool isFavorite});
}

/// @nodoc
class __$$_LocationModelCopyWithImpl<$Res>
    extends _$LocationModelCopyWithImpl<$Res>
    implements _$$_LocationModelCopyWith<$Res> {
  __$$_LocationModelCopyWithImpl(
      _$_LocationModel _value, $Res Function(_$_LocationModel) _then)
      : super(_value, (v) => _then(v as _$_LocationModel));

  @override
  _$_LocationModel get _value => super._value as _$_LocationModel;

  @override
  $Res call({
    Object? locationId = freezed,
    Object? locationName = freezed,
    Object? country = freezed,
    Object? isFavorite = freezed,
  }) {
    return _then(_$_LocationModel(
      locationId: locationId == freezed
          ? _value.locationId
          : locationId // ignore: cast_nullable_to_non_nullable
              as String,
      locationName: locationName == freezed
          ? _value.locationName
          : locationName // ignore: cast_nullable_to_non_nullable
              as String,
      country: country == freezed
          ? _value.country
          : country // ignore: cast_nullable_to_non_nullable
              as CountryDTO,
      isFavorite: isFavorite == freezed
          ? _value.isFavorite
          : isFavorite // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_LocationModel implements _LocationModel {
  const _$_LocationModel(
      {required this.locationId,
      required this.locationName,
      required this.country,
      required this.isFavorite});

  factory _$_LocationModel.fromJson(Map<String, dynamic> json) =>
      _$$_LocationModelFromJson(json);

  @override
  final String locationId;
  @override
  final String locationName;
  @override
  final CountryDTO country;
  @override
  final bool isFavorite;

  @override
  String toString() {
    return 'LocationModel(locationId: $locationId, locationName: $locationName, country: $country, isFavorite: $isFavorite)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_LocationModel &&
            const DeepCollectionEquality()
                .equals(other.locationId, locationId) &&
            const DeepCollectionEquality()
                .equals(other.locationName, locationName) &&
            const DeepCollectionEquality().equals(other.country, country) &&
            const DeepCollectionEquality()
                .equals(other.isFavorite, isFavorite));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(locationId),
      const DeepCollectionEquality().hash(locationName),
      const DeepCollectionEquality().hash(country),
      const DeepCollectionEquality().hash(isFavorite));

  @JsonKey(ignore: true)
  @override
  _$$_LocationModelCopyWith<_$_LocationModel> get copyWith =>
      __$$_LocationModelCopyWithImpl<_$_LocationModel>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_LocationModelToJson(
      this,
    );
  }
}

abstract class _LocationModel implements LocationModel {
  const factory _LocationModel(
      {required final String locationId,
      required final String locationName,
      required final CountryDTO country,
      required final bool isFavorite}) = _$_LocationModel;

  factory _LocationModel.fromJson(Map<String, dynamic> json) =
      _$_LocationModel.fromJson;

  @override
  String get locationId;
  @override
  String get locationName;
  @override
  CountryDTO get country;
  @override
  bool get isFavorite;
  @override
  @JsonKey(ignore: true)
  _$$_LocationModelCopyWith<_$_LocationModel> get copyWith =>
      throw _privateConstructorUsedError;
}
