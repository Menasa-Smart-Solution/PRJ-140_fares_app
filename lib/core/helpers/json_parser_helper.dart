import 'dart:isolate';
import 'package:flutter/foundation.dart';

class JsonParserHelper {
  static Future<T> parseInBackground<T>(
    Map<String, dynamic> json,
    T Function(Map<String, dynamic>) fromJson,
  ) async {
    if (kIsWeb) {
      // On web, isolates are not supported
      return fromJson(json);
    }

    return await compute((jsonData) => fromJson(jsonData), json);
  }

  static Future<List<T>> parseListInBackground<T>(
    List<dynamic> jsonList,
    T Function(Map<String, dynamic>) fromJson,
  ) async {
    if (kIsWeb) {
      return jsonList.map((e) => fromJson(e as Map<String, dynamic>)).toList();
    }

    return await compute(
      (data) => (data).map((e) => fromJson(e as Map<String, dynamic>)).toList(),
      jsonList,
    );
  }
}
