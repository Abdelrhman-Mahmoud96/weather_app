part of 'connectivity_cubit.dart';

@freezed
class ConnectivityState with _$ConnectivityState{
  const factory ConnectivityState.nil() = Nil;  
  const factory ConnectivityState.connected() = Connected;
  const factory ConnectivityState.disconnected() = Disconnected;
}
