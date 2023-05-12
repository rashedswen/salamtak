import 'package:salamtak/core/connection/network_info.dart';

class NetworkInfoImplWeb implements NetworkInfo {
  NetworkInfoImplWeb();

  @override
  Future<bool> get isConnected => Future.value(true);
}
