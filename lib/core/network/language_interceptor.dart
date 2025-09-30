import 'package:dio/dio.dart';
import 'package:fares/core/helpers/cache_helper.dart';
import 'package:fares/core/utils/prefs_keys.dart';

class LanguageInterceptor extends Interceptor {
  @override
  void onRequest(
    RequestOptions options,
    RequestInterceptorHandler handler,
  ) async {
    final langKey = CacheHelper().getData(key: PrefsKeys.appLanguage) ?? 'ar';
    options.headers['lang'] = langKey;
    super.onRequest(options, handler);
  }
}
