import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:lass/Widgets/Notification.dart';
import 'package:lass/screens/Diva%20Dude/HomeScreen.dart';
import 'package:lass/screens/Journal/JournalHome.dart';
import 'package:lass/screens/notify.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({Key? key}) : super(key: key);
  
  
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
            colors: [
              Colors.purple[100]!,
              Colors.purple[300]!,
            ],
            begin: const FractionalOffset(0.0, 0.0),
            end: const FractionalOffset(1.0, 0.0),
            stops: [0.0, 1.0],
            tileMode: TileMode.clamp),
      ),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                padding: EdgeInsets.all(40),
                child: Image(image: AssetImage('assets/images/LASS-logo.png'),)),
              ElevatedButton(
                child: Text("            Dear Diary            ",
                style: TextStyle(fontSize: 19),),
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => JournalHome(
                                rootContext: context,
                              )));
                },
                style: ElevatedButton.styleFrom(
                  primary: Colors.purple[900],
                  padding: EdgeInsets.symmetric(horizontal: 40),
                  shape: const RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(Radius.circular(10)),
                  ),
                ),
              ),
              SizedBox(height: 8,),
              ElevatedButton(
                child: Text("            Diva Dude            ",
                style: TextStyle(fontSize: 19),),
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => DDHomeScreen()));
                },
                style: ElevatedButton.styleFrom(
                  primary: Colors.purple[900],
                  padding: EdgeInsets.symmetric(horizontal: 40),
                  shape: const RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(Radius.circular(10)),
                  ),
                ),
              ),              
              LocalNotificationWidget(),
              ElevatedButton(
                child: Text("           Dollar Dude           ",
                style: TextStyle(fontSize: 19),),
                onPressed: () {},
                style: ElevatedButton.styleFrom(
                  primary: Colors.purple[900],
                  padding: EdgeInsets.symmetric(horizontal: 40),
                  shape: const RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(Radius.circular(10)),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
