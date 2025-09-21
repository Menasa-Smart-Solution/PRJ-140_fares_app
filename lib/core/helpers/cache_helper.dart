import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:shared_preferences/shared_preferences.dart';

class CacheHelper {
  factory CacheHelper() {
    return _instance;
  }

  static late SharedPreferences sharedPreferences;

  static AndroidOptions _getAndroidOptions() =>
      const AndroidOptions(encryptedSharedPreferences: true);

  CacheHelper._internal();
  static final CacheHelper _instance = CacheHelper._internal();

  //! Here The Initialize of cache .
  Future<void> init() async {
    debugPrint('✅ CacheHelper: initializing...');
    sharedPreferences = await SharedPreferences.getInstance();
    debugPrint('✅ CacheHelper: initialized');
  }

  //! this method to put data in local database using key

  String? getDataString({required String key}) {
    return sharedPreferences.getString(key);
  }

  //! this method to put data in local database using key

  Future<bool> saveData({required String key, required dynamic value}) async {
    if (value is bool) {
      return await sharedPreferences.setBool(key, value);
    }
    if (value is String) {
      return await sharedPreferences.setString(key, value);
    }
    if (value is List<String>) {
      return await sharedPreferences.setStringList(key, value);
    }

    if (value is int) {
      return await sharedPreferences.setInt(key, value);
    } else {
      return await sharedPreferences.setDouble(key, value);
    }
  }

  //! this method to get data already saved in local database

  dynamic getData({required String key}) {
    return sharedPreferences.get(key);
  }

  bool? getBool({required String key}) {
    return sharedPreferences.getBool(key);
  }

  //! get String list
  List<String> getDataList({required String key}) {
    return sharedPreferences.getStringList(key) ?? [];
  }

  //! remove data using specific key

  Future<bool> removeData({required String key}) async {
    return await sharedPreferences.remove(key);
  }

  //! this method to check if local database contains {key}
  Future<bool> containsKey({required String key}) async {
    return sharedPreferences.containsKey(key);
  }

  //! clear all data in the local database
  Future<bool> clearData() async {
    return await sharedPreferences.clear();
  }

  //! this method to put data in local database using key
  Future<dynamic> put({required String key, required dynamic value}) async {
    if (value is String) {
      return await sharedPreferences.setString(key, value);
    } else if (value is bool) {
      return await sharedPreferences.setBool(key, value);
    } else {
      return await sharedPreferences.setInt(key, value);
    }
  }

  static Future<void> setSecuredString(String key, String value) async {
    debugPrint(
      "FlutterSecureStorage : setSecuredString with key : $key and value : $value",
    );
    final flutterSecureStorage = FlutterSecureStorage(
      aOptions: _getAndroidOptions(),
    );
    await flutterSecureStorage.write(key: key, value: value);
  }

  /// Gets an String value from FlutterSecureStorage with given [key].
  static Future<String?> getSecuredString(String key) async {
    debugPrint('🔐 getSecuredString with key: $key');
    final flutterSecureStorage = FlutterSecureStorage(
      aOptions: _getAndroidOptions(),
    );
    try {
      final result = await flutterSecureStorage.read(key: key);
      debugPrint('🔐 value: $result');
      return result ?? '';
    } on PlatformException catch (e) {
      debugPrint('🚨 Failed to read from secure storage: ${e.message}');
      return '';
    }
  }

  /// Removes all keys and values in the FlutterSecureStorage
  static Future<void> clearAllSecuredData() async {
    debugPrint('FlutterSecureStorage : all data has been cleared');
    final flutterSecureStorage = FlutterSecureStorage(
      aOptions: _getAndroidOptions(),
    );
    await flutterSecureStorage.deleteAll();
  }

  /// Removes a specific key and its value from FlutterSecureStorage
  static Future<void> removeSecuredData(String key) async {
    debugPrint('FlutterSecureStorage : removing key: $key');
    final flutterSecureStorage = FlutterSecureStorage(
      aOptions: _getAndroidOptions(),
    );
    await flutterSecureStorage.delete(key: key);
  }
}
