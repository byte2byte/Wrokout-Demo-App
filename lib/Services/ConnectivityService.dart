import 'dart:async';
import 'package:connectivity_plus/connectivity_plus.dart';

class ConnectivityService {
  StreamController<bool> connectionStatusController = StreamController<bool>();
  bool hasConnection = false;

  ConnectivityService() {
    Connectivity().onConnectivityChanged.listen((ConnectivityResult result) {
      _checkConnection(result);
    });
  }

  void _checkConnection(ConnectivityResult result) async {
    bool previousConnection = hasConnection;
    if (result == ConnectivityResult.none) {
      hasConnection = false;
    } else {
      hasConnection = true;
    }
    if (previousConnection != hasConnection) {
      connectionStatusController.add(hasConnection);
    }
  }
}
