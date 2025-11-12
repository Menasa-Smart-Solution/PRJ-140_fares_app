import 'dart:convert';
import 'dart:developer';
import 'dart:io';
import 'package:fares/core/helpers/cache_helper.dart';
import 'package:fares/core/utils/prefs_keys.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:permission_handler/permission_handler.dart';

import '../utils/app_logger.dart';

@pragma('vm:entry-point')
Future<void> firebaseMessagingBackgroundHandler(RemoteMessage message) async {
  await Firebase.initializeApp();
  log("BG_MSG_ID: ${message.messageId}, Data: ${message.data}");
}

class NotificationService {
  NotificationService._();
  static final NotificationService _instance = NotificationService._();
  factory NotificationService() => _instance;

  final FirebaseMessaging _fcm = FirebaseMessaging.instance;
  final FlutterLocalNotificationsPlugin _localNotifications =
      FlutterLocalNotificationsPlugin();
  final ValueNotifier<bool> permissionGranted = ValueNotifier(false);

  /// Initializes the handler.
  Future<void> initialize() async {
    await checkNotificationPermission();

    FirebaseMessaging.onBackgroundMessage(firebaseMessagingBackgroundHandler);
    await _initializeLocalNotifications();
    _setupMessageListeners();
    await getFcmToken();
    if (permissionGranted.value) {
      await _configureUiNotifications();
    }
  }

  Future<void> checkNotificationPermission() async {
    if (Platform.isIOS) {
      // iOS: get current notification authorization status
      NotificationSettings settings = await _fcm.getNotificationSettings();
      permissionGranted.value =
          settings.authorizationStatus == AuthorizationStatus.authorized;

      log('iOS Authorization Status: ${settings.authorizationStatus}');
    } else {
      // Android: check permission from Permission package
      final status = await Permission.notification.status;
      permissionGranted.value = status.isGranted;

      log('Initial Notification Permission Status: $status');
    }
  }

  Future<void> requestInitialPermission() async {
    if (Platform.isIOS) {
      await requestIosPermission();
    } else {
      final status = await Permission.notification.request();
      permissionGranted.value = status.isGranted;
      log('Android Notification Permission Status: $status');

      if (status.isGranted) {
        await _configureUiNotifications();
      }
    }
  }

  /// Requests notification permission from the user.
  Future<void> handlePermissionRedirect({required bool enabled}) async {
    if (Platform.isIOS) {
      final settings = await FirebaseMessaging.instance
          .getNotificationSettings();

      final granted =
          settings.authorizationStatus == AuthorizationStatus.authorized;
      final denied = settings.authorizationStatus == AuthorizationStatus.denied;
      final notDetermined =
          settings.authorizationStatus == AuthorizationStatus.notDetermined;

      if (enabled) {
        if (denied) {
          // User previously denied → must open settings
          await openAppSettings();
          return;
        }

        if (notDetermined) {
          // Show native iOS permission dialog
          final result = await FirebaseMessaging.instance.requestPermission();
          permissionGranted.value =
              result.authorizationStatus == AuthorizationStatus.authorized;
          return;
        }
      } else {
        if (granted) {
          // User wants to disable → only possible through settings
          await openAppSettings();
        }
      }
    } else {
      // Android
      final status = await Permission.notification.status;

      if (enabled) {
        if (status.isPermanentlyDenied) {
          // User denied permanently → open settings
          await openAppSettings();
          return;
        }

        if (status.isDenied) {
          // Show Android native permission dialog
          final newStatus = await Permission.notification.request();
          permissionGranted.value = newStatus.isGranted;
          return;
        }
      } else {
        if (status.isGranted) {
          // User wants to disable notifications
          await openAppSettings();
        }
      }

      // Always refresh final status
      permissionGranted.value =
          (await Permission.notification.status).isGranted;
    }
  }

  Future<void> requestIosPermission() async {
    NotificationSettings settings = await _fcm.requestPermission(
      alert: true,
      announcement: false,
      badge: true,
      carPlay: false,
      criticalAlert: false,
      provisional: false,
      sound: true,
    );

    log(
      "iOS Notification Authorization Status: ${settings.authorizationStatus}",
    );

    permissionGranted.value =
        settings.authorizationStatus == AuthorizationStatus.authorized;

    if (permissionGranted.value) {
      await _configureUiNotifications();
      await getFcmToken();
    } else if (settings.authorizationStatus == AuthorizationStatus.denied) {
      log("Permission denied — opening settings directly...");
    }
  }

  Future<void> _configureUiNotifications() async {
    log('Permission Granted. Configuring UI notifications...');
    if (defaultTargetPlatform == TargetPlatform.iOS) {
      await _fcm.setForegroundNotificationPresentationOptions(
        alert: true,
        badge: true,
        sound: true,
      );
    }
    _setupMessageListeners();
  }

  Future<void> getFcmToken() async {
    if (Platform.isIOS) {
      final String? apnsToken = await _fcm.getAPNSToken();
      if (apnsToken == null) {
        log("APNS Token is null, cannot proceed with FCM token.");
        return;
      }
    }

    final cachedToken = CacheHelper().getData(key: PrefsKeys.deviceToken) ?? '';
    if (cachedToken.isNotEmpty || cachedToken != '') {
      log("Using cached FCM token: $cachedToken");
    } else {
      final String? fcmToken = await _fcm.getToken();
      await CacheHelper().saveData(
        key: PrefsKeys.deviceToken,
        value: fcmToken ?? '',
      );
      log("=======================================");
      log("Fcm are Saved $fcmToken");
      log("=======================================");
    }
  }

  void _setupMessageListeners() {
    FirebaseMessaging.onMessage.listen((RemoteMessage message) {
      log('Foreground message received!');
      if (message.notification != null) {
        if (Platform.isAndroid) {
          _showLocalNotification(message); // ✅ Android فقط
        } else {
          log(
            '❗ iOS native notification already shown, skipping local notification.',
          );
        }
      }
    });

    FirebaseMessaging.onMessageOpenedApp.listen((RemoteMessage message) {
      log('Message opened app from background.');
      _handleNavigation(message.data);
    });

    _fcm.getInitialMessage().then((RemoteMessage? message) {
      if (message != null) {
        log('Message opened app from terminated state.');
        _handleNavigation(message.data);
      }
    });
  }

  void _handleNavigation(Map<String, dynamic> data) {
    // final bool isExist = data.isNotEmpty && data.containsKey('value')
    //     ? true
    //     : false;

    // log('Handling navigation with data: $data, isExist: $isExist');
    // if (isExist) {
    //   if (data['key'] == 'productDetailsScreen') {
    //     AppRouter.navigatorKey.currentState?.pushNamed(
    //       Routes.mainDriverRoute,
    //       arguments: ProductDetailsArgs(data['value'], data['name']),
    //     );
    //   } else {
    //     AppRouter.navigatorKey.currentState?.pushNamed(
    //       Routes.orders,
    //       arguments: data['value'],
    //     );
    //   }
    // } else {
    //   AppRouter.navigatorKey.currentState?.pushNamed(Routes.mainScreen);
    // }
    // AppRouter.navigatorKey.currentState?.pushNamed(Routes.mainDriverRoute);
  }

  Future<void> _initializeLocalNotifications() async {
    const AndroidNotificationChannel channel = AndroidNotificationChannel(
      'high_importance_channel',
      'High Importance Notifications',
      description: 'This channel is used for important notifications.',
      importance: Importance.max,
    );
    await _localNotifications
        .resolvePlatformSpecificImplementation<
          AndroidFlutterLocalNotificationsPlugin
        >()
        ?.createNotificationChannel(channel);
    const InitializationSettings initSettings = InitializationSettings(
      android: AndroidInitializationSettings('@mipmap/ic_launcher'),
      iOS: DarwinInitializationSettings(),
    );
    await _localNotifications.initialize(
      initSettings,
      onDidReceiveNotificationResponse: (NotificationResponse response) {
        log(
          'User tapped on a local notification. Payload: ${response.payload}',
        );
        if (response.payload != null && response.payload!.isNotEmpty) {
          _handleNavigation(
            jsonDecode(response.payload!) as Map<String, dynamic>,
          );
        }
      },
    );
  }

  Future<void> _showLocalNotification(RemoteMessage message) async {
    AppLogger.log(
      'Showing local notification: ${message.data} - ${message.notification?.body}',
    );
    const NotificationDetails notificationDetails = NotificationDetails(
      android: AndroidNotificationDetails(
        'high_importance_channel',
        'High Importance Notifications',
        channelDescription: 'This channel is used for important notifications.',
        importance: Importance.max,
        priority: Priority.high,
        icon: '@mipmap/ic_launcher', // Ensure this icon exists in your project
      ),
      iOS: DarwinNotificationDetails(
        presentAlert: true,
        presentBadge: true,
        presentSound: true,
      ),
    );
    await _localNotifications.show(
      message.hashCode,
      message.notification?.title,
      message.notification?.body,
      notificationDetails,
      payload: jsonEncode(message.data),
    );
  }
}
