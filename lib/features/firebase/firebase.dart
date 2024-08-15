import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:sync_center_mobile/core/ui/theme/colors.dart';
import 'package:sync_center_mobile/di/di.dart';
import 'package:sync_center_mobile/features/auth/data/local/repositories/auth_local_repository.dart';
import 'package:sync_center_mobile/features/firebase/data/repositories/firebase_repository.dart';

import 'firebase_options.dart';


void initFirebaseApp() async {
  // Initialize the firebase application..
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  // Request notifications_cubit permission..
  await FirebaseMessaging.instance.requestPermission();

  // Get the FCM token..
  final fcmToken = await FirebaseMessaging.instance.getToken();
  debugPrint("FCM TOKEN: $fcmToken");

  // Send the token only if the user is logged because it required access token.
  final isLoggedIn = getIt.get<AuthLocalRepository>().isLoggedIn();
  if(isLoggedIn) {
    // Send the FCM token to the server..
    await getIt.get<FirebaseRepository>().updateFcmToken(fcmToken: fcmToken ?? "");
  }

  // Set foreground notifications_cubit on iOS..
  await FirebaseMessaging.instance.setForegroundNotificationPresentationOptions(
    alert: true,
    badge: true,
    sound: true,
  );

  // Create LocalNotificationsPlugin..
  final FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
  FlutterLocalNotificationsPlugin();

  // Create Initialization settings..
  const androidSetting = AndroidInitializationSettings('notification');
  const iosSetting = DarwinInitializationSettings(
    requestAlertPermission: true,
    requestBadgePermission: true,
    requestSoundPermission: true,
  );
  const initializationSettings =
  InitializationSettings(android: androidSetting, iOS: iosSetting);

  // Initialize the plugin..
  await flutterLocalNotificationsPlugin.initialize(
    initializationSettings,
  );

  // Create a high priority notifications_cubit channel on android..
  const AndroidNotificationChannel channel = AndroidNotificationChannel(
    'high_importance_channel',
    'High Importance Notifications',
    description: 'This channel is used for important notifications.',
    importance: Importance.max,
    ledColor: SyncColors.lightBlue,
  );

  // Create the notifications_cubit channel..
  await flutterLocalNotificationsPlugin
      .resolvePlatformSpecificImplementation<
      AndroidFlutterLocalNotificationsPlugin>()
      ?.createNotificationChannel(channel);

  // Listen on any messages while the application is in the foreground..
  FirebaseMessaging.onMessage.listen((RemoteMessage message) {
    final notification = message.notification;
    final android = message.notification?.android;

    // If `onMessage` is triggered with a notification, construct our own
    // local notification to show to users using the created channel.
    if (notification != null && android != null) {

      // Show a local notification to the user..
      flutterLocalNotificationsPlugin.show(
        notification.hashCode,
        notification.title,
        notification.body,
        NotificationDetails(
          android: AndroidNotificationDetails(
            channel.id,
            channel.name,
            channelDescription: channel.description,
            icon: android.smallIcon,
          ),
        ),
      );
    }
  });

  // Listen for any changes in the FCM token..
  FirebaseMessaging.instance.onTokenRefresh.listen(
        (fcmToken) async {
      // Send the new Fcm token to the server.
      await getIt.get<FirebaseRepository>().updateFcmToken(fcmToken: fcmToken);
    },
  ).onError(
        (err) {
      debugPrint(err);
    },
  );
}
