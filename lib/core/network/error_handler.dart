import 'dart:developer';
import 'dart:io';
import 'package:dio/dio.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:fares/core/network/api_error_model.dart';
import 'package:fares/generated/locale_keys.g.dart';

class ErrorHandler {
  static ApiErrorModel handle(dynamic error) {
    if (error is DioException) {
      log('👉 Message: ${error.message}');
      log('👉 Type: ${error.type}');
      log('👉 URI: ${error.requestOptions.uri}');
      log('👉 Status Code: ${error.response?.statusCode}');
      log('👉 Data: ${error.response?.data}');
      switch (error.type) {
        case DioExceptionType.connectionTimeout:
          return ApiErrorModel(message: LocaleKeys.connectionTimeout.tr());
        case DioExceptionType.sendTimeout:
          return ApiErrorModel(message: LocaleKeys.sendTimeout.tr());
        case DioExceptionType.receiveTimeout:
          return ApiErrorModel(message: LocaleKeys.receiveTimeout.tr());
        case DioExceptionType.badCertificate:
          return ApiErrorModel(message: LocaleKeys.badCertificate.tr());
        case DioExceptionType.badResponse:
          return _handleError(error.response);
        case DioExceptionType.cancel:
          return ApiErrorModel(message: LocaleKeys.cancelApiError.tr());
        case DioExceptionType.connectionError:
          return ApiErrorModel(
            message: LocaleKeys.connectionError.tr(),
            status: 0,
          );
        case DioExceptionType.unknown:
          if (error.error.toString().contains("SocketException")) {
            return ApiErrorModel(message: LocaleKeys.socketException.tr());
          } else {
            return ApiErrorModel(message: LocaleKeys.unknown.tr());
          }
      }
    } else if (error is SocketException) {
      return ApiErrorModel(message: LocaleKeys.socketException.tr());
    } else {
      return ApiErrorModel(message: LocaleKeys.unknown.tr());
    }
  }
}

ApiErrorModel _handleError(Response? response) {
  var result = response?.data;
  final errors = result?['errors'];
  final List<String> messages = [];
  // errors can be map or list
  if (errors != null) {
    if (errors is Map) {
      errors.forEach((key, value) {
        if (value is List) {
          for (var msg in value) {
            messages.add("${key.toString()}: $msg");
          }
        } else {
          messages.add("${key.toString()}: ${value.toString()}");
        }
      });
    } else if (errors is List) {
      for (var msg in errors) {
        messages.add(msg.toString());
      }
    }
  }
  if (messages.isNotEmpty) {
    result['message'] = messages.join('\n');
  }
  return ApiErrorModel.fromJson(result);
}
