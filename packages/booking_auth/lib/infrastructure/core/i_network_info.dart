import 'package:booking_auth/domain/core/network/network_info.dart';
import 'package:injectable/injectable.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';

@LazySingleton(as: NetworkInfo)
class INetworkInfo implements NetworkInfo {
  final InternetConnectionChecker _internetConnectionChecker;
  const INetworkInfo(this._internetConnectionChecker);
  @override
  Future<bool> get isConnected => _internetConnectionChecker.hasConnection;
}
