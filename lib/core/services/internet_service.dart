import 'dart:async';
import 'dart:developer';
import 'package:internet_connection_checker_plus/internet_connection_checker_plus.dart';

class InternetService {
  final InternetConnection internetConnection;

  InternetService({required this.internetConnection});

  Future<bool> isConnected() async {
    final bool isConnected = await internetConnection.hasInternetAccess;
    log(
      '================Internet connection status: $isConnected===========================',
    );
    return isConnected;
  }

  Stream<bool> get onStatusChange => internetConnection.onStatusChange.map(
    (status) => status == InternetStatus.connected,
  );
}
