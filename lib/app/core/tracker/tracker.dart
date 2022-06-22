// ignore_for_file: avoid_returning_null_for_void

import 'package:flutter/foundation.dart' show kDebugMode;
import '../firebase/firebase_handler.dart';

class TrackHandler {
  static bool isTestingBuild = kDebugMode;

  static Future<void> prepare() async {
    if (isTestingBuild) return;

    try {
      FirebaseHandler.analytics.setAnalyticsCollectionEnabled(true);
    } catch (_) {}

    try {
      FirebaseHandler.analytics.logAppOpen();
    } catch (_) {}
  }

  static Future<void> setUser({
    required String userId,
    required String mobile,
  }) async {
    if (isTestingBuild) return null;

    trackEvent(
      eventName: 'SetLoginUser',
      params: {
        'userId': userId,
        'mobile': mobile,
      },
    );

    try {
      FirebaseHandler.analytics.setUserId(id: userId);
    } catch (_) {}

    try {
      FirebaseHandler.analytics.setUserProperty(name: 'mobile', value: mobile);
    } catch (_) {}
  }

  static Future<void> trackScreen({
    required String screenName,
    Map<String, dynamic>? params,
  }) async {
    if (isTestingBuild) return;

    params = params ?? {};
    params.addAll({'screen': screenName});
    try {
      FirebaseHandler.analytics.setCurrentScreen(
        screenName: screenName,
        screenClassOverride: screenName,
      );
      FirebaseHandler.analytics.logEvent(name: screenName, parameters: params);
    } catch (_) {}
  }

  static Future<void> trackEvent({
    required String eventName,
    Map<String, dynamic>? params,
  }) async {
    if (isTestingBuild) return null;
    try {
      FirebaseHandler.analytics.logEvent(name: eventName, parameters: params);
    } catch (e) {
      print(e.toString());
    }
  }
}
