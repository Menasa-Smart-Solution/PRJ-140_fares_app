import 'package:dio/dio.dart';
import 'package:fares/core/helpers/cache_helper.dart';
import 'package:fares/core/helpers/extensions.dart';
import 'package:fares/core/routing/app_router.dart';
import 'package:fares/core/routing/routes.dart';
import 'package:fares/core/utils/prefs_keys.dart';

class AuthInterceptor extends Interceptor {
  @override
  Future<void> onRequest(
    RequestOptions options,
    RequestInterceptorHandler handler,
  ) async {
    final token = await CacheHelper.getSecuredString(PrefsKeys.token);

    if (token != null && token.isNotEmpty) {
      options.headers['Authorization'] = 'Bearer $token';
    }
    // options.headers['Authorization'] =
    //     'Bearer 151649|op8Vx5UYqZHAK29pxve2sY5Txv8lq0ahIy6vLj65';
    return super.onRequest(options, handler);
  }

  @override
  void onError(DioException err, ErrorInterceptorHandler handler) async {
    if (err.response?.statusCode == 401) {
      await CacheHelper.clearAllSecuredData();

      AppRouter.navigatorKey.currentState!.context.pushNamedAndRemoveUntil(
        Routes.loginRoute,
        predicate: (route) {
          return false;
        },
      );
    }
    return super.onError(err, handler);
  }
}
