
import 'package:flutter/material.dart';
import 'package:lass/SizeConfig.dart';
import 'package:lass/Widgets/FaderRoute.dart';
import 'package:lass/Widgets/models.dart';
import 'package:lass/screens/Journal/editNoteScreen.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

class JournalScreenWidget extends StatefulWidget {
  final String name, image;

  const JournalScreenWidget({
    Key? key,
    required this.name,
    required this.image,
  }) : super(key: key);

  @override
  JournalScreenWidgetState createState() => JournalScreenWidgetState();
}

class JournalScreenWidgetState extends State<JournalScreenWidget> {
  late ThemeData themeData;

  @override
  Widget build(BuildContext context) {
    themeData = Theme.of(context);
    return InkWell(
      onTap: () {
        Navigator.push(
        context,
        FadeRoute(
            page:EditNotePage(existingNote: NotesModel(
                      id: 0,
                      title: '',
                      content: '',
                      isImportant: false,
                      date: DateTime.now()), image: widget.image,)),);  
      },
      child: Container(
        height: MediaQuery.of(context).size.height,
        child: Stack(
          children: <Widget>[
            Container(
              child: ClipRRect(
                borderRadius: BorderRadius.all(Radius.circular(MySize.size18!)),
                child: Image.asset(
                  widget.image,
                  width: MediaQuery.of(context).size.width,
                  fit: BoxFit.cover,
                ),
              ),
            ),
            Positioned(
                right: 8,
                top: 8,
                child: Icon(
                  MdiIcons.heart,
                  color: Colors.pink[600],
                  size: 20,
                ))
          ],
        ),
      ),
    );
  }
}
