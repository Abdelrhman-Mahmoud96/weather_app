import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:weather_app_task/features/presentation/connectivity/connectivity_helper.dart';

part 'connectivity_state.dart';
part 'connectivity_cubit.freezed.dart';

class ConnectivityCubit extends Cubit<ConnectivityState> {
  ConnectivityCubit({required this.connectivityHelper}) : super(const Nil());

  final ConnectivityHelper connectivityHelper;

  void checkInternetConnection() async {
    connectivityHelper.checkConnectivity().listen((connectivityResult) {
      if (connectivityResult == ConnectivityStatus.connected) {
        emit(const Connected());
      } else {
        emit(const Disconnected());
      }
    });
  }
}
