import 'package:connectivity_plus/connectivity_plus.dart';

class NetworkConnectPart {
  final Connectivity connectivity;
  const NetworkConnectPart({
    required this.connectivity
  });

  Future<bool> getInternetStatus() async{
    final connectivityResult = await connectivity.checkConnectivity();
    final bool isConnect =
        connectivityResult.contains(ConnectivityResult.wifi) ||
            connectivityResult.contains(ConnectivityResult.ethernet) ||
            connectivityResult.contains(ConnectivityResult.mobile);
    return isConnect;
  }

}