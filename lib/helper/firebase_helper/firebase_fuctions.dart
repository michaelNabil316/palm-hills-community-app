import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import '../../main.dart';
import 'local_notification_service.dart';

RemoteMessage? firebaseRemotemessage;

Future initializeMyFireBase() async {
  await Firebase.initializeApp();
  FirebaseMessaging fcm = FirebaseMessaging.instance;
  fcm.getToken().then((token) {
    print('firebase token ======================>$token');
  });
  await FirebaseMessaging.instance.setAutoInitEnabled(true);
  await LocalNotificationService.initialize();
  FirebaseMessaging.instance.subscribeToTopic("phd_channel");
  FirebaseMessaging.instance.getInitialMessage().then((message) {
    if (message != null) {
      firebaseRemotemessage = message;
    }
  });
  FirebaseMessaging.onBackgroundMessage(_firebaseMessagingBackgroundHandler);
  FirebaseMessaging.onMessage.listen((RemoteMessage message) {
    print("onBackgroundMessage: $message");
    firebaseRemotemessage = message;
    LocalNotificationService.createAndDisplayNotification(message);
  });
  FirebaseMessaging.onMessageOpenedApp.listen((RemoteMessage message) {
    firebaseRemotemessage = message;
    print("onMessageOpenedApp: $message");
    navigationForFirebaseNoification();
  });
}

Future<void> _firebaseMessagingBackgroundHandler(RemoteMessage message) async {
  firebaseRemotemessage = message;
  print("_firebaseMessagingBackgroundHandler: $message");
  navigationForFirebaseNoification();
}

navigationForFirebaseNoification() {
  if (firebaseRemotemessage != null) {
    if (navigatorKey.currentState != null) {
      if (firebaseRemotemessage?.data['dataType'] == "report") {
        // navigatorKey.currentState?.push(
        //   MaterialPageRoute(
        //     builder: (context) => FingerprintDetailScreen(
        //       transactions: EmployeeTransactionsStatistics.fromJson(
        //           firebaseRemotemessage!.data),
        //     ),
        //   ),
        // );
      } else if (firebaseRemotemessage?.data['dataType'] == "permission") {
        // navigatorKey.currentState?.push(
        //   MaterialPageRoute(
        //     builder: (context) => PermissionDetailScreen(
        //       isManager: firebaseRemotemessage!.data['isManager'] == "true",
        //       permission: Permission.fromJson(firebaseRemotemessage!.data),
        //     ),
        //   ),
        // );
      } else if (firebaseRemotemessage?.data['dataType'] == "statement") {
        //var data = firebaseRemotemessage!.data;
        // navigatorKey.currentState?.push(
        //   MaterialPageRoute(
        //     builder: (context) => RequestDetails(
        //       isManager: data['isManager'] == "true",
        //       request: Request.fromJson(data),
        //     ),
        //   ),
        // );
      }
    }
  }
}
