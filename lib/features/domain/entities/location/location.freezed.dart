// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'location.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$Location {
  String get locationId => throw _privateConstructorUsedError;
  String get locationName => throw _privateConstructorUsedError;
  CountryDTO get country => throw _privateConstructorUsedError;
  bool get isFavorite => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $LocationCopyWith<Location> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $LocationCopyWith<$Res> {
  factory $LocationCopyWith(Location value, $Res Function(Location) then) =
      _$LocationCopyWithImpl<$Res>;
  $Res call(
      {String locationId,
      String locationName,
      CountryDTO country,
      bool isFavorite});
}

/// @nodoc
class _$LocationCopyWithImpl<$Res> implements $LocationCopyWith<$Res> {
  _$LocationCopyWithImpl(this._value, this._then);

  final Location _value;
  // ignore: unused_field
  final $Res Function(Location) _then;

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
abstract class _$$_LocationCopyWith<$Res> implements $LocationCopyWith<$Res> {
  factory _$$_LocationCopyWith(
          _$_Location value, $Res Function(_$_Location) then) =
      __$$_LocationCopyWithImpl<$Res>;
  @override
  $Res call(
      {String locationId,
      String locationName,
      CountryDTO country,
      bool isFavorite});
}

/// @nodoc
class __$$_LocationCopyWithImpl<$Res> extends _$LocationCopyWithImpl<$Res>
    implements _$$_LocationCopyWith<$Res> {
  __$$_LocationCopyWithImpl(
      _$_Location _value, $Res Function(_$_Location) _then)
      : super(_value, (v) => _then(v as _$_Location));

  @override
  _$_Location get _value => super._value as _$_Location;

  @override
  $Res call({
    Object? locationId = freezed,
    Object? locationName = freezed,
    Object? country = freezed,
    Object? isFavorite = freezed,
  }) {
    return _then(_$_Location(
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

class _$_Location implements _Location {
  const _$_Location(
      {required this.locationId,
      required this.locationName,
      required this.country,
      required this.isFavorite});

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
    return 'Location(locationId: $locationId, locationName: $locationName, country: $country, isFavorite: $isFavorite)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_Location &&
            const DeepCollectionEquality()
                .equals(other.locationId, locationId) &&
            const DeepCollectionEquality()
                .equals(other.locationName, locationName) &&
            const DeepCollectionEquality().equals(other.country, country) &&
            const DeepCollectionEquality()
                .equals(other.isFavorite, isFavorite));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(locationId),
      const DeepCollectionEquality().hash(locationName),
      const DeepCollectionEquality().hash(country),
      const DeepCollectionEquality().hash(isFavorite));

  @JsonKey(ignore: true)
  @override
  _$$_LocationCopyWith<_$_Location> get copyWith =>
      __$$_LocationCopyWithImpl<_$_Location>(this, _$identity);
}

abstract class _Location implements Location {
  const factory _Location(
      {required final String locationId,
      required final String locationName,
      required final CountryDTO country,
      required final bool isFavorite}) = _$_Location;

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
  _$$_LocationCopyWith<_$_Location> get copyWith =>
      throw _privateConstructorUsedError;
}
