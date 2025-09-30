import 'package:equatable/equatable.dart';

class AppException extends Equatable implements Exception {
  final String message;
  final int? code;

  const AppException({required this.message, this.code});

  @override
  String toString() => "AppException: $message";

  @override
  List<Object?> get props => [message];
}

class NetworkException extends AppException {
  const NetworkException({required super.message});
}

class ServerException extends AppException {
  const ServerException({required super.message, super.code});
}

class CacheException extends AppException {
  const CacheException({required super.message});
}
