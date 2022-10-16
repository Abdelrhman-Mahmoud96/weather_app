import 'package:equatable/equatable.dart';

abstract class Failure extends Equatable {
  abstract final String? message;

  @override
  List<Object> get props => [message!];
}
