import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:lass/SizeConfig.dart';
import 'package:lass/screens/Diva%20Dude/Profile.dart';
import 'package:lass/screens/Diva%20Dude/QuestionCategory.dart';
import 'package:lass/screens/Diva%20Dude/ViewQuestions.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

class DDHomeScreen extends StatefulWidget {
  @override
  _DDHomeScreenState createState() => _DDHomeScreenState();
}

class _DDHomeScreenState extends State<DDHomeScreen> {
  late ThemeData themeData;  

  Widget build(BuildContext context) {
    themeData = Theme.of(context);
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        home: Container(
          child: Stack(children: <Widget>[
            Container(
              child: ClipPath(
                  clipper: _MyCustomClipper(context),
                  child: Container(
                    alignment: Alignment.center,
                    color: themeData.colorScheme.primaryVariant,
                  )),
            ),
            Scaffold(
                floatingActionButton: FloatingActionButton.extended(
                    backgroundColor: themeData.colorScheme.primary,
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => QuestionCategoryScreen()));
                    },
                    label: Row(
                      children: [
                        Icon(
                          MdiIcons.plus,
                          color: themeData.colorScheme.onPrimary,
                          size: 18,
                        ),
                        Container(
                          child: Text(
                            "Start Asking",
                            style: TextStyle(color: Colors.yellow)),
                          ),
                        
                      ],
                    )),
                body: Container(
                  color: Colors.blue,
                  child: ListView(
                    padding: EdgeInsets.all(20),
                    children: [
                      Container(
                        margin: EdgeInsets.fromLTRB(0, 0, 24, 0),
                        alignment: Alignment.centerRight,
                        child: Row(
                          children: [
                            Expanded(
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Container(
                                    margin: EdgeInsets.fromLTRB(24, 0, 0, 0),
                                    child: Text(
                                      "Hello",
                                      style: TextStyle(color: Colors.yellow),
                                    ),
                                  ),
                                  Container(
                                    //margin: Spacing.left(24),
                                    child: Text(
                                      "Shifu!",
                                      // style: AppTheme.getTextStyle(
                                      //     themeData.textTheme.headline4,
                                      //     letterSpacing: -0.5,
                                      //     color: themeData
                                      //         .colorScheme.primaryVariant,
                                      //     fontWeight: 700),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Container(
                              child: ClipRRect(
                                borderRadius: BorderRadius.all(
                                    Radius.circular(8)),
                                child: GestureDetector(
                                  onTap: () {
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) =>
                                                ProfileScreen()));
                                  },
                                  child: Container(
                                    margin:
                                        EdgeInsets.only(bottom: 16),
                                    width: 140,
                                    height: 120,
                                    decoration: BoxDecoration(
                                      shape: BoxShape.circle,
                                      image: DecorationImage(
                                          image: AssetImage(
                                              "./assets/images/LASS-logo.png"),
                                          fit: BoxFit.fill),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.fromLTRB(24, 24, 24, 0),
                        //padding: Spacing.horizontal(12),
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.all(
                                Radius.circular(8)),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.grey,
                                spreadRadius: 2,
                                blurRadius: 10,
                                offset: Offset(0, 8),
                              ),
                            ]),
                        child: Row(
                          children: [
                            Icon(
                              MdiIcons.magnify,
                              color:
                                  themeData.colorScheme.primary.withAlpha(200),
                              size: 16,
                            ),
                            Expanded(
                              child: Container(
                                //margin: Spacing.left(12),
                                child: TextFormField(
                                  // style: AppTheme.getTextStyle(
                                  //     themeData.textTheme.caption,
                                  //     color:
                                  //         themeData.colorScheme.primaryVariant,
                                  //     fontWeight: 500),
                                  decoration: InputDecoration(
                                    fillColor: Colors.red,
                                    // hintStyle: AppTheme.getTextStyle(
                                    //     themeData.textTheme.bodyText2,
                                    //     color: themeData
                                    //         .colorScheme.primaryVariant,
                                    //     muted: true,
                                    //     fontWeight: 500),
                                    hintText: "Find Answers...",
                                    border: InputBorder.none,
                                    enabledBorder: InputBorder.none,
                                    focusedBorder: InputBorder.none,
                                  ),
                                  textCapitalization:
                                      TextCapitalization.sentences,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      Container(
                        padding: EdgeInsets.only(top: 22),
                        margin: EdgeInsets.fromLTRB(24, 24, 24, 0),
                        child: Text(
                          "What shall we discuss today ?!",
                          // style: AppTheme.getTextStyle(
                          //     themeData.textTheme.subtitle1,
                          //     letterSpacing: -0.15,
                          //     color: themeData.colorScheme.primaryVariant,
                          //     fontWeight: 600,
                          //     muted: true),
                        ),
                      ),
                      Container(
                        //margin: EdgeInsets.only(top:24),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            InkWell(
                                child: singleHelpWidget(
                                    iconData: MdiIcons.humanGreeting,
                                    title: "She Helps"),
                                onTap: () {
                                  Navigator.push(context,
                                      MaterialPageRoute(builder: (context) {
                                    return CategoryQuestion(
                                        categoryInput: "She helps");
                                  }));
                                }),
                            singleHelpWidget(
                                iconData: MdiIcons.laptop, title: "Business"),
                            singleHelpWidget(
                                iconData: MdiIcons.babyCarriage,
                                title: "MotherHood")
                          ],
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.only(top:24),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            singleHelpWidget(
                                iconData: MdiIcons.lockOpen,
                                title: "Confessions"),
                            singleHelpWidget(
                                iconData: MdiIcons.cashMarker,
                                title: "Finance"),
                            singleHelpWidget(
                                iconData: MdiIcons.bookEducation,
                                title: "Education"),
                          ],
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.only(top:24),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            singleHelpWidget(
                                iconData: MdiIcons.meditation,
                                title: "Fitness"),
                            singleHelpWidget(
                                iconData: MdiIcons.shoeHeel, title: "Fashion"),
                            singleHelpWidget(
                                iconData: MdiIcons.food, title: "Food"),
                          ],
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.only(top:24),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            singleHelpWidget(
                                iconData: MdiIcons.bagSuitcase,
                                title: "Travel"),
                            singleHelpWidget(
                                iconData: MdiIcons.faceWoman,
                                title: "Teen"),
                            singleHelpWidget(
                                iconData: MdiIcons.music,
                                title: "Music and Arts")
                          ],
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.only(top:24),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            singleHelpWidget(
                                iconData: MdiIcons.hammerScrewdriver,
                                title: "Technology"),
                            singleHelpWidget(
                                iconData: MdiIcons.dog, title: "Pets"),
                            singleHelpWidget(
                                iconData: MdiIcons.heart, title: "Random")
                          ],
                        ),
                      ),
                      Container(
                        padding: EdgeInsets.all(4),
                      )
                    ],
                  ),
                )),
          ]),
        ));
  }

  Widget singleHelpWidget(
      {IconData? iconData, required String title, Color? color}) {
    return Container(
      width: (MySize.safeWidth! - MySize.getScaledSizeWidth(96)) / 3,
      padding: Spacing.fromLTRB(0, 20, 0, 20),
      decoration: BoxDecoration(
          color: Colors.green,
          borderRadius: BorderRadius.all(Radius.circular(8)),
          boxShadow: [
            BoxShadow(
                color: Colors.grey,
                blurRadius: 6,
                offset: Offset(0, 4))
          ]),
      child: Column(
        children: [
          Icon(
            iconData,
            color: color == null ? themeData.colorScheme.primary : color,
            size: 30,
          ),
          Container(
            margin: EdgeInsets.only(top:8),
            child: Text(
              title,
              // style: AppTheme.getTextStyle(themeData.textTheme.caption,
              //     letterSpacing: 0,
              //     color: themeData.colorScheme.primaryVariant,
              //     fontWeight: 600),
            ),
          ),
        ],
      ),
    );
  }
}

class _MyCustomClipper extends CustomClipper<Path> {
  final BuildContext _context;

  _MyCustomClipper(this._context);

  @override
  Path getClip(Size size) {
    final path = Path();
    Size size = MediaQuery.of(_context).size;
    path.lineTo(size.width, 0);
    path.lineTo(size.width, size.height * 0.3);
    path.lineTo(0, size.height * 0.8);
    path.close();
    return path;
  }

  @override
  bool shouldReclip(CustomClipper oldClipper) {
    return false;
  }
}
