
import 'package:flutter/material.dart';
import '../firebase/firebase_handler.dart';

class TrackHandler {

  // false == release
  //true   == testing
  static bool isTestingBuild = false;

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
      FirebaseHandler.analytics.logLogin(loginMethod: 'PhoneNumber');
      FirebaseHandler.analytics.setUserId(id: userId);
    } catch (_) {}

    try {
      FirebaseHandler.analytics.setUserProperty(name: 'mobile', value: mobile);
    } catch (_) {}
  }

  static Future<void> setUserLanguage({
    required String lang,
  }) async {
    if (isTestingBuild) return null;

    try {
      FirebaseHandler.analytics
          .setUserProperty(name: 'LanguageCode', value: lang);
      trackEvent(
        eventName: lang,
      );
      trackEvent(eventName: 'LanguageChanged', params: {'language': lang});
      debugPrint(lang);
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
      debugPrint('Screen logged $screenName');
    } catch (_) {}
  }

  static Future<void> trackEvent({
    required String eventName,
    Map<String, dynamic>? params,
  }) async {
    if (isTestingBuild) return null;
    try {
      debugPrint('event logged $eventName');
      FirebaseHandler.analytics.logEvent(name: eventName, parameters: params);
    } catch (e) {
      debugPrint(e.toString());
    }
  }
}
