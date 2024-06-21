import 'package:connectivity_plus/connectivity_plus.dart';

class NetworkStatus {
  final Connectivity connectivity;
  Future<bool> isConnected = Future.value(false);

  NetworkStatus(this.connectivity) {
    isConnected = init();
  }

  Future<bool> init() async {
    var initialStatus = await connectivity.checkConnectivity();
    return updateConnectionStatus(initialStatus);
  }

  bool updateConnectionStatus(List<ConnectivityResult>? event) {
    return event!.any((result) => result != ConnectivityResult.none);
  }
}
