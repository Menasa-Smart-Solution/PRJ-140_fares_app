import 'package:easy_localization/easy_localization.dart';
import 'package:fares/core/helpers/cache_helper.dart';
import 'package:fares/fares_app.dart';
import 'package:flutter/material.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await EasyLocalization.ensureInitialized();
  await CacheHelper().init();

  runApp(
    EasyLocalization(
      useOnlyLangCode: true,
      supportedLocales: const [Locale('ar')],
      path: 'assets/lang',
      fallbackLocale: const Locale('ar'),
      startLocale: const Locale('ar'),
      child: FaresApp(),
    ),
  );
}

/// dart run easy_localization:generate -f keys -o locale_keys.g.dart -S assets/lang
/// dart run easy_localization:generate -S assets/lang
/// Di (InjectableInit)
/// dart run build_runner build --delete-conflicting-outputs
