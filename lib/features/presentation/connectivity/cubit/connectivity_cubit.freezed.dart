// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'connectivity_cubit.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$ConnectivityState {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() nil,
    required TResult Function() connected,
    required TResult Function() disconnected,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? nil,
    TResult Function()? connected,
    TResult Function()? disconnected,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? nil,
    TResult Function()? connected,
    TResult Function()? disconnected,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(Nil value) nil,
    required TResult Function(Connected value) connected,
    required TResult Function(Disconnected value) disconnected,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(Nil value)? nil,
    TResult Function(Connected value)? connected,
    TResult Function(Disconnected value)? disconnected,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(Nil value)? nil,
    TResult Function(Connected value)? connected,
    TResult Function(Disconnected value)? disconnected,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ConnectivityStateCopyWith<$Res> {
  factory $ConnectivityStateCopyWith(
          ConnectivityState value, $Res Function(ConnectivityState) then) =
      _$ConnectivityStateCopyWithImpl<$Res>;
}

/// @nodoc
class _$ConnectivityStateCopyWithImpl<$Res>
    implements $ConnectivityStateCopyWith<$Res> {
  _$ConnectivityStateCopyWithImpl(this._value, this._then);

  final ConnectivityState _value;
  // ignore: unused_field
  final $Res Function(ConnectivityState) _then;
}

/// @nodoc
abstract class _$$NilCopyWith<$Res> {
  factory _$$NilCopyWith(_$Nil value, $Res Function(_$Nil) then) =
      __$$NilCopyWithImpl<$Res>;
}

/// @nodoc
class __$$NilCopyWithImpl<$Res> extends _$ConnectivityStateCopyWithImpl<$Res>
    implements _$$NilCopyWith<$Res> {
  __$$NilCopyWithImpl(_$Nil _value, $Res Function(_$Nil) _then)
      : super(_value, (v) => _then(v as _$Nil));

  @override
  _$Nil get _value => super._value as _$Nil;
}

/// @nodoc

class _$Nil implements Nil {
  const _$Nil();

  @override
  String toString() {
    return 'ConnectivityState.nil()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$Nil);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() nil,
    required TResult Function() connected,
    required TResult Function() disconnected,
  }) {
    return nil();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? nil,
    TResult Function()? connected,
    TResult Function()? disconnected,
  }) {
    return nil?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? nil,
    TResult Function()? connected,
    TResult Function()? disconnected,
    required TResult orElse(),
  }) {
    if (nil != null) {
      return nil();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(Nil value) nil,
    required TResult Function(Connected value) connected,
    required TResult Function(Disconnected value) disconnected,
  }) {
    return nil(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(Nil value)? nil,
    TResult Function(Connected value)? connected,
    TResult Function(Disconnected value)? disconnected,
  }) {
    return nil?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(Nil value)? nil,
    TResult Function(Connected value)? connected,
    TResult Function(Disconnected value)? disconnected,
    required TResult orElse(),
  }) {
    if (nil != null) {
      return nil(this);
    }
    return orElse();
  }
}

abstract class Nil implements ConnectivityState {
  const factory Nil() = _$Nil;
}

/// @nodoc
abstract class _$$ConnectedCopyWith<$Res> {
  factory _$$ConnectedCopyWith(
          _$Connected value, $Res Function(_$Connected) then) =
      __$$ConnectedCopyWithImpl<$Res>;
}

/// @nodoc
class __$$ConnectedCopyWithImpl<$Res>
    extends _$ConnectivityStateCopyWithImpl<$Res>
    implements _$$ConnectedCopyWith<$Res> {
  __$$ConnectedCopyWithImpl(
      _$Connected _value, $Res Function(_$Connected) _then)
      : super(_value, (v) => _then(v as _$Connected));

  @override
  _$Connected get _value => super._value as _$Connected;
}

/// @nodoc

class _$Connected implements Connected {
  const _$Connected();

  @override
  String toString() {
    return 'ConnectivityState.connected()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$Connected);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() nil,
    required TResult Function() connected,
    required TResult Function() disconnected,
  }) {
    return connected();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? nil,
    TResult Function()? connected,
    TResult Function()? disconnected,
  }) {
    return connected?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? nil,
    TResult Function()? connected,
    TResult Function()? disconnected,
    required TResult orElse(),
  }) {
    if (connected != null) {
      return connected();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(Nil value) nil,
    required TResult Function(Connected value) connected,
    required TResult Function(Disconnected value) disconnected,
  }) {
    return connected(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(Nil value)? nil,
    TResult Function(Connected value)? connected,
    TResult Function(Disconnected value)? disconnected,
  }) {
    return connected?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(Nil value)? nil,
    TResult Function(Connected value)? connected,
    TResult Function(Disconnected value)? disconnected,
    required TResult orElse(),
  }) {
    if (connected != null) {
      return connected(this);
    }
    return orElse();
  }
}

abstract class Connected implements ConnectivityState {
  const factory Connected() = _$Connected;
}

/// @nodoc
abstract class _$$DisconnectedCopyWith<$Res> {
  factory _$$DisconnectedCopyWith(
          _$Disconnected value, $Res Function(_$Disconnected) then) =
      __$$DisconnectedCopyWithImpl<$Res>;
}

/// @nodoc
class __$$DisconnectedCopyWithImpl<$Res>
    extends _$ConnectivityStateCopyWithImpl<$Res>
    implements _$$DisconnectedCopyWith<$Res> {
  __$$DisconnectedCopyWithImpl(
      _$Disconnected _value, $Res Function(_$Disconnected) _then)
      : super(_value, (v) => _then(v as _$Disconnected));

  @override
  _$Disconnected get _value => super._value as _$Disconnected;
}

/// @nodoc

class _$Disconnected implements Disconnected {
  const _$Disconnected();

  @override
  String toString() {
    return 'ConnectivityState.disconnected()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$Disconnected);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() nil,
    required TResult Function() connected,
    required TResult Function() disconnected,
  }) {
    return disconnected();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? nil,
    TResult Function()? connected,
    TResult Function()? disconnected,
  }) {
    return disconnected?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? nil,
    TResult Function()? connected,
    TResult Function()? disconnected,
    required TResult orElse(),
  }) {
    if (disconnected != null) {
      return disconnected();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(Nil value) nil,
    required TResult Function(Connected value) connected,
    required TResult Function(Disconnected value) disconnected,
  }) {
    return disconnected(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(Nil value)? nil,
    TResult Function(Connected value)? connected,
    TResult Function(Disconnected value)? disconnected,
  }) {
    return disconnected?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(Nil value)? nil,
    TResult Function(Connected value)? connected,
    TResult Function(Disconnected value)? disconnected,
    required TResult orElse(),
  }) {
    if (disconnected != null) {
      return disconnected(this);
    }
    return orElse();
  }
}

abstract class Disconnected implements ConnectivityState {
  const factory Disconnected() = _$Disconnected;
}
