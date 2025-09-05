// lib/services/notification_service.dart
import 'package:firebase_messaging/firebase_messaging.dart';

class NotificationService {
  final FirebaseMessaging _fcm = FirebaseMessaging.instance;
  Future<void> initNotifications() async {
    await _fcm.requestPermission();
    FirebaseMessaging.onMessage.listen((RemoteMessage message) {
      // Handle foreground notifications
    });
    FirebaseMessaging.onBackgroundMessage(_backgroundHandler);
  }
  static Future<void> _backgroundHandler(RemoteMessage message) async {
    // Handle background message
  }
}
