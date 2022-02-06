import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:lass/Widgets/Journal.dart';
import 'package:lass/screens/Journal/JournalTemplateCollection.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

class JournalHome extends StatefulWidget {
  final BuildContext rootContext;

  const JournalHome({Key? key, required this.rootContext}) : super(key: key);

  @override
  _JournalHomeState createState() => _JournalHomeState();
}

class _JournalHomeState extends State<JournalHome>
    with SingleTickerProviderStateMixin {
  late List<Journal> journals;

  initState() {
    super.initState();
    journals = Journal.getList();
  }

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
        body: ListView(
          padding: EdgeInsets.only(bottom: 10),
          children: <Widget>[
            SizedBox(height: 50),
            Padding(
                padding: EdgeInsets.all(24),
                child: Row(
                  children: <Widget>[
                    Container(
                      child: Image(
                        image: AssetImage('assets/images/LASS-logo.png'),
                        width: 90,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 100),
                      child: Text(
                        "Hey Shifu!",
                        style: TextStyle(
                            fontSize: 30,
                            color: Colors.purple[900],
                            fontWeight: FontWeight.bold,
                            fontFamily: ''),
                      ),
                    ),
                  ],
                )),
            Padding(
              padding: EdgeInsets.fromLTRB(0, 0, 24, 0),
              child: Column(
                children: buildjournals(),
              ),
            ),
          ],
        ),
        floatingActionButton: FloatingActionButton(
          backgroundColor: Colors.purple[900],
          onPressed: () {
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => JournalTemplateHome()));
          },
          tooltip: 'Add New Entry',
          child: Icon(Icons.add),
        ),
      ),
    );
  }

  List<Widget> buildjournals() {
    List<Widget> list = [];
    for (Journal journal in journals) {
      list.add(getSingleJournal(journal));
    }
    return list;
  }

  Widget getSingleJournal(Journal journal) {
    return InkWell(
      onTap: () {
        Navigator.push(
            widget.rootContext,
            PageRouteBuilder(
              transitionDuration: Duration(milliseconds: 500),
              pageBuilder: (_, __, ___) => JournalTemplateHome(),
            ));
      },
      child: Container(
        margin: EdgeInsets.only(bottom: 16, left: 20),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(10)),
          color: Colors.white.withAlpha(90),
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              color: Colors.transparent,
              padding: EdgeInsets.all(8),
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.transparent,
                  borderRadius: BorderRadius.all(
                    Radius.circular(12.0),
                  ),
                ),
                child: ClipRRect(
                  clipBehavior: Clip.antiAliasWithSaveLayer,
                  child: Image.asset(
                    journal.image,
                    height: 172,
                  ),
                ),
              ),
            ),
            SizedBox(
              width: 16,
            ),
            Container(
              width: 170,
              padding: EdgeInsets.only(top:20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    journal.name,
                    style: TextStyle(
                        color: Colors.black,fontSize:20, fontWeight: FontWeight.w600),
                  ),
                  SizedBox(height: 8),
                  Text(
                    journal.description
                  ),
                ],
              ),
            ),
            Expanded(
              child: Padding(
                padding: EdgeInsets.only(top:8,right: 8),
                child: Icon(
                  MdiIcons.heart,
                  color: Colors.pink[600],
                  size: 28,
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
