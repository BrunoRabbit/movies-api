import 'package:connectivity_plus/connectivity_plus.dart';

abstract class NetworkStatus {
  bool get isConnected;
}

class NetworkStatusImpl implements NetworkStatus {
  final Connectivity connectivity;
  bool _hasConnection = false;

  NetworkStatusImpl(this.connectivity) {
    init();
  }

  init() async {
    connectivity.onConnectivityChanged.listen(updateConnectionStatus);
    await connectivity.checkConnectivity().then(updateConnectionStatus);
  }

  void updateConnectionStatus(List<ConnectivityResult>? event) {
    final hasNoneConnection = event!.contains(ConnectivityResult.none);

    if (hasNoneConnection) {
      _hasConnection = false;
    }

    _hasConnection = true;
  }

  @override
  bool get isConnected => _hasConnection;
}
