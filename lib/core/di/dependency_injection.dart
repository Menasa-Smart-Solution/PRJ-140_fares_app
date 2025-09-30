import 'package:dio/dio.dart';
import 'package:fares/core/network/api_service.dart';
import 'package:fares/core/network/auth_interceptor.dart';
import 'package:fares/core/network/language_interceptor.dart';
import 'package:fares/core/services/internet_service.dart';
import 'package:fares/core/utils/env_variables.dart';
import 'package:fares/features/auth/auth_di.dart';
import 'package:flutter/foundation.dart';
import 'package:get_it/get_it.dart';
import 'package:internet_connection_checker_plus/internet_connection_checker_plus.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';

final getIt = GetIt.instance;

Future<void> setupDependencyInjection() async {
  // Initialize core dependencies
  await _initCoreDependencies();
  await initAuthDI();
}

Future<void> _initCoreDependencies() async {
  // getIt.registerLazySingleton<ImagePickerService>(() => ImagePickerService());
  getIt.registerSingleton<InternetConnection>(
    InternetConnection.createInstance(
      checkInterval: const Duration(seconds: 10),
      useDefaultOptions: false,
      customCheckOptions: [
        InternetCheckOption(uri: Uri.parse('https://www.google.com')),
        InternetCheckOption(
          uri: Uri.parse('https://cloudflare.com'),
          timeout: const Duration(seconds: 5),
        ),
      ],
    ),
  );

  getIt.registerLazySingleton(
    () => InternetService(internetConnection: getIt()),
  );

  getIt.registerLazySingleton<Dio>(() {
    final dio = Dio();
    dio.options
      ..baseUrl = Env.apiUrl
      ..connectTimeout = const Duration(seconds: 30)
      ..receiveTimeout = const Duration(seconds: 30);
    dio.interceptors.add(AuthInterceptor());
    dio.interceptors.add(LanguageInterceptor());
    if (kDebugMode) {
      dio.interceptors.add(
        PrettyDioLogger(
          requestBody: true,
          requestHeader: true,
          responseBody: true,
        ),
      );
    }

    return dio;
  });
  // ApiService
  getIt.registerLazySingleton<ApiService>(() => ApiService(getIt<Dio>()));
}
