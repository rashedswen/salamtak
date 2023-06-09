import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:salamtak/core/connection/network_info.dart';

class NetworkInfoImplMobile implements NetworkInfo {
  NetworkInfoImplMobile(this.connectionChecker);
  final InternetConnectionChecker connectionChecker;

  @override
  Future<bool> get isConnected => connectionChecker.hasConnection;
}
