import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'dart:io' show Platform;
import 'firebase_fuctions.dart';

class LocalNotificationService {
  static final FlutterLocalNotificationsPlugin notificationsPlugin =
      FlutterLocalNotificationsPlugin();

  static Future initialize() async {
    const InitializationSettings initializationSettings =
        InitializationSettings(
            android: AndroidInitializationSettings("@mipmap/ic_launcher"),
            iOS: DarwinInitializationSettings());
    await notificationsPlugin.initialize(initializationSettings,
        onDidReceiveNotificationResponse: (payload) async {
      print("payload>>${payload.id}");
      print("firebaseRemotemessage>>${firebaseRemotemessage?.data}");
      navigationForFirebaseNoification();
    });
    if (Platform.isIOS) {
      requestIOSPermissions(notificationsPlugin);
    }
  }

  static void requestIOSPermissions(
      FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin) {
    flutterLocalNotificationsPlugin
        .resolvePlatformSpecificImplementation<
            IOSFlutterLocalNotificationsPlugin>()
        ?.requestPermissions(
          alert: true,
          badge: true,
          sound: true,
        );
  }

  static void createAndDisplayNotification(RemoteMessage message) async {
    try {
      final id = DateTime.now().millisecondsSinceEpoch ~/ 1000;
      const NotificationDetails notificationDetails = NotificationDetails(
          android: AndroidNotificationDetails(
            "pushnotificationapp",
            "phd_channel",
            channelDescription: "phd_channel",
            importance: Importance.max,
            priority: Priority.high,
            playSound: true,
            enableVibration: true,
            icon: "@mipmap/ic_launcher",
          ),
          iOS: DarwinNotificationDetails());
      await notificationsPlugin.show(
        id,
        message.notification!.title,
        message.notification!.body,
        notificationDetails,
        payload: message.data['_id'],
      );
    } on Exception catch (e) {
      print("createAndDisplayNotification error:$e");
    }
  }
}
