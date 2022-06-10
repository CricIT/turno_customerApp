import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:get/get.dart';
import '../core/tracker/tracker.dart';
import 'local_storage.dart';

class FirebaseService extends GetxService {
  final store = Get.find<LocalStorageService>();

  @override
  void onReady() {
    _initFirebase();
    _initNotifications();
    _initEventTracking();
    super.onReady();
  }

  Future<void> _firebaseMessagingBackgroundHandler(
      RemoteMessage message) async {
    // If you're going to use other Firebase services in the background, such as Firestore,
    // make sure you call `initializeApp` before using other Firebase services.
    TrackHandler.trackEvent(
      eventName: 'BackgroundNotificationReceived',
      params: {'messageId': message.messageId},
    );
    if (kDebugMode) {
      print('Handling a background message ${message.messageId}');
    }
  }

  /// initialize [TrackHandler]
  /// prepare 3rd party trakers (Mixpanel, Amplitude, etc)
  void _initEventTracking() {
    /// initialize app tracker for syncing with backend
    TrackHandler.prepare();
  }

//initializing all firebase services
  Future<void> _initFirebase() async {
    final FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
        FlutterLocalNotificationsPlugin();
    const AndroidNotificationChannel channel = AndroidNotificationChannel(
      'high_importance_channel', // id
      'High Importance Notifications', // title
      description: 'This channel is used for important notifications.',
      importance: Importance.high,
      enableVibration: true,
      playSound: true,
    );
    FirebaseMessaging.onBackgroundMessage(_firebaseMessagingBackgroundHandler);
    await FirebaseMessaging.instance.setForegroundNotificationPresentationOptions(
      alert: true,
      badge: true,
      sound: true,
    );
    await FirebaseMessaging.instance.requestPermission(
      alert: true,
      announcement: true,
      badge: true,
      carPlay: true,
      criticalAlert: true,
      // This will ensure the popup shows for users
      provisional: false,
    );
    FirebaseMessaging.instance.getToken().then((value) {
      print(value);
      store.setToken = value;
    });
    final tokenStream = FirebaseMessaging.instance.onTokenRefresh;
    tokenStream.listen((token) {
      store.setToken = token;
    });

    FirebaseMessaging.onMessage.listen((RemoteMessage message) async {
      RemoteNotification? notification = message.notification;
      AndroidNotification? android = message.notification?.android;

      const AndroidInitializationSettings initializationSettingsAndroid =
          AndroidInitializationSettings('@mipmap/ic_launcher');

      final IOSInitializationSettings initializationSettingsIOS =
          IOSInitializationSettings(
              onDidReceiveLocalNotification: (_, s, a, b) async {});

      MacOSInitializationSettings initializationSettingsMacOS =
          MacOSInitializationSettings();

      final InitializationSettings initializationSettings =
          InitializationSettings(
        iOS: initializationSettingsIOS,
        macOS: initializationSettingsMacOS,
        android: initializationSettingsAndroid,
      );

      await flutterLocalNotificationsPlugin
          .resolvePlatformSpecificImplementation<
              AndroidFlutterLocalNotificationsPlugin>()
          ?.createNotificationChannel(channel);

      await flutterLocalNotificationsPlugin.initialize(
        initializationSettings,
      );

      if (notification != null && android != null) {
        flutterLocalNotificationsPlugin.show(
          notification.hashCode,
          notification.title,
          notification.body,
          NotificationDetails(
            android: AndroidNotificationDetails(
              channel.id,
              channel.name,
              channelDescription: channel.description,
              icon: '@mipmap/ic_launcher'
            ),
          ),
        );
      }
    });
  }

  void _initNotifications() async {}
}
