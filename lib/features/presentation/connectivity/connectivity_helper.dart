import 'dart:io';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:rxdart/rxdart.dart';

enum ConnectivityStatus { connected, disconnected, nill }

class ConnectivityHelper {
  final _connectivityStreamController =
      BehaviorSubject<ConnectivityStatus>.seeded(ConnectivityStatus.nill);

  Stream<ConnectivityStatus> checkConnectivity() async* {
    Connectivity().onConnectivityChanged.listen((connectionResult) async {
      if (connectionResult == ConnectivityResult.mobile ||
          connectionResult == ConnectivityResult.wifi) {
        final result = await _checkInternetConnection();
        _connectivityStreamController.add(result);
      } else {
        _connectivityStreamController.add(ConnectivityStatus.disconnected);
      }
    }).onDone(() {
      _connectivityStreamController.close();
    });

    yield* _connectivityStreamController.asBroadcastStream();
  }
}

Future<ConnectivityStatus> _checkInternetConnection() async {
  final result = await InternetAddress.lookup('example.com');
  if (result.isNotEmpty && result[0].rawAddress.isNotEmpty) {
    return ConnectivityStatus.connected;
  }
  return ConnectivityStatus.disconnected;
}
