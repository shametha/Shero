import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:lass/Widgets/Notification.dart';
import 'package:lass/screens/HomeScreen.dart';

class LocalNotificationWidget extends StatefulWidget {
  @override
  _LocalNotificationWidgetState createState() =>
      _LocalNotificationWidgetState();
}

class _LocalNotificationWidgetState extends State<LocalNotificationWidget> {
  final notifications = FlutterLocalNotificationsPlugin();

  @override
  void initState() {
    super.initState();

    //Android Settings
    //here to parse the app icon that is in the folder : android/app/src/main/res/drawable
    final settingsAndroid = AndroidInitializationSettings('app_icon');

    //iOS Settings
    final settingsIOS = IOSInitializationSettings(
        onDidReceiveLocalNotification: (id, title, body, payload) =>
            onSelectNotification(payload!));

    notifications.initialize(
        InitializationSettings(android: settingsAndroid, iOS: settingsIOS),
        onSelectNotification:
            onSelectNotification); //the action when click the notification
  }

  Future onSelectNotification(String? payload) async => await Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => HomeScreen()),
      );

  Widget title(String text) => Container(
        margin: EdgeInsets.symmetric(vertical: 4),
        child: Text(
          text,
          //style: Theme.of(context).textTheme.title,
          style: TextStyle(fontSize: 25.0, fontWeight: FontWeight.bold),
          textAlign: TextAlign.center,
        ),
      );

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: 
      ElevatedButton(
                child: Text("            Ding Dong            ",
                style: TextStyle(fontSize: 19),),
                onPressed: () => showOngoingNotification(notifications,
            title: 'Good Morning', body: 'A strong woman is one who is able to smile this morning like she wasn’t crying last night.'),
                style: ElevatedButton.styleFrom(
                  primary: Colors.purple[900],
                  padding: EdgeInsets.symmetric(horizontal: 40),
                  shape: const RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(Radius.circular(10)),
                  ),
                ),
              ),
    );
  }
}