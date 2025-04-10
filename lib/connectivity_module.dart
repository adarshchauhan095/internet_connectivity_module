import 'dart:async';
import 'dart:io';
import 'package:connectivity_plus/connectivity_plus.dart';

String connectivityStatus = 'Online';

class MyConnectivity {
  MyConnectivity._internal();

  static final MyConnectivity _instance = MyConnectivity._internal();

  static MyConnectivity get instance => _instance;

  Connectivity connectivity = Connectivity();

  StreamController controller = StreamController.broadcast();

  Stream get myStream => controller.stream;

  void initialise() async {
    var result = await connectivity.checkConnectivity();

    _checkStatus(result[0]);
    if (result[0] == ConnectivityResult.wifi ||
        result[0] == ConnectivityResult.mobile ||
        result[0] == ConnectivityResult.ethernet) {
      connectivityStatus = 'Online';
    } else {
      connectivityStatus = 'Offline';
    }
    connectivity.onConnectivityChanged.listen((result) {
      if (result[0] == ConnectivityResult.wifi ||
          result[0] == ConnectivityResult.mobile ||
          result[0] == ConnectivityResult.ethernet) {
        connectivityStatus = 'Online';
      } else {
        connectivityStatus = 'Offline';
      }
      _checkStatus(result[0]);
    });
  }

  void _checkStatus(ConnectivityResult result) async {
    var isOnline = false;

    try {
      final result = await InternetAddress.lookup('example.com');
      if (result.isNotEmpty && result[0].rawAddress.isNotEmpty) {
        isOnline = true;
      } else {
        isOnline = false;
      }
    } on SocketException catch (_) {
      isOnline = false;
    }
    controller.sink.add({result: isOnline});
  }

  void disposeStream() => controller.close();
}
