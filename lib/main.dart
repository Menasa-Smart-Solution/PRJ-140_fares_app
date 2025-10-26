import 'package:fares/core/helpers/cache_helper.dart';
import 'package:fares/core/services/notification_service.dart';
import 'package:fares/core/utils/app_bloc_observer.dart';
import 'package:fares/core/utils/env_variables.dart';
import 'package:fares/core/utils/exports.dart';
import 'package:fares/core/utils/prefs_keys.dart';
import 'package:fares/fares_app.dart';
import 'package:fares/firebase_options.dart';
import 'package:firebase_core/firebase_core.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);

  final initialRoute = await _initializeApp();
  Bloc.observer = AppBlocObserver();
  runApp(
    EasyLocalization(
      useOnlyLangCode: true,
      supportedLocales: const [Locale('ar')],
      path: 'assets/lang',
      fallbackLocale: const Locale('ar'),
      startLocale: const Locale('ar'),
      child: FaresApp(initialRoute: initialRoute),
    ),
  );
}

Future<String> _initializeApp() async {
  await SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]);

  await Future.wait([
    // Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform),
    EasyLocalization.ensureInitialized(),
    CacheHelper().init(),
    NotificationService().initialize(),
    //
  ]);

  await setupDependencyInjection();
  // FirebaseMessaging.onBackgroundMessage(firebaseMessagingBackgroundHandler);
  // await NotificationHandler().initialize();
  return _getInitialRoute();
}

Future<String> _getInitialRoute() async {
  AppLogger.warning('API URL: ${Env.apiUrl}');
  final String userToken =
      await CacheHelper.getSecuredString(PrefsKeys.token) ?? '';
  AppLogger.info('userToken: $userToken');
  final userType = await CacheHelper.getSecuredString(PrefsKeys.role) ?? '';
  final bool hasSeenOnboarding =
      CacheHelper().getBool(key: PrefsKeys.onboarding) ?? false;

  if (userToken.isNotEmpty) {
    return userType == 'store' ? Routes.mainStoreRoute : Routes.mainDriverRoute;
  } else {
    if (hasSeenOnboarding) {
      return Routes.welcomeRoute;
    } else {
      return Routes.onBoardingRoute;
    }
  }
}

/// dart run easy_localization:generate -f keys -o locale_keys.g.dart -S assets/lang
/// dart run easy_localization:generate -S assets/lang
/// Di (InjectableInit)
/// dart run build_runner build --delete-conflicting-outputs
