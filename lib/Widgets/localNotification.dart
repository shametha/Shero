import 'dart:async';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';


Future _showNotification(
  FlutterLocalNotificationsPlugin notifications, {
  required String title,
  required String body,
  required NotificationDetails type,
  int id = 0,
}) =>    notifications.show(id, title, body, type);