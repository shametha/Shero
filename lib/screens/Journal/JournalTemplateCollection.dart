import 'package:flutter/material.dart';
import 'package:lass/SizeConfig.dart';
import 'package:lass/Widgets/JournalScreenWidget.dart';
class JournalTemplateHome extends StatefulWidget {
  const JournalTemplateHome({
    Key? key,
  }) : super(key: key);

  @override
  _JournalTemplateHomeState createState() => _JournalTemplateHomeState();
}

class _JournalTemplateHomeState extends State<JournalTemplateHome>
    with
        SingleTickerProviderStateMixin,
        AutomaticKeepAliveClientMixin<JournalTemplateHome> {
  @override
  bool get wantKeepAlive => true;

  double findAspectRatio(double width) {
    return (width / 2 - MySize.size24!) / ((width / 2 - MySize.size24!) + 72);
  }

  Widget build(BuildContext context) {
    super.build(context);
    MySize().init(context);
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        home: SafeArea(
          child: Container(
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
              padding: EdgeInsets.all(0),
              children: <Widget>[
                Padding(
                    padding: EdgeInsets.all(MySize.size16!),
                    child:  Row(
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
                Container(
                  padding: EdgeInsets.only(left: MySize.size16!, top: 0),
                  child: Text("Welcome back. Choose a template to get started!",
                      style: TextStyle(fontSize: 16, color: Colors.black)),
                ),
                Container(
                  child: GridView.count(
                      padding: EdgeInsets.all(MySize.size16!),
                      shrinkWrap: true,
                      physics: ClampingScrollPhysics(),
                      crossAxisCount: 3,
                      childAspectRatio:
                          findAspectRatio(MediaQuery.of(context).size.width),
                      mainAxisSpacing: MySize.size16!,
                      crossAxisSpacing: MySize.size16!,
                      children: <Widget>[
                        JournalScreenWidget(
                          name: "My Birthday!",
                          image: 'assets/images/bg1.jpg',
                        ),
                        JournalScreenWidget(
                          name: "He Proposed!",
                          image: 'assets/images/bg5.png',
                        ),
                        JournalScreenWidget(
                          name: "Hate Day!",
                          image: 'assets/images/2.png',
                        ),
                        JournalScreenWidget(
                          name: "Just a Day",                          
                          image: 'assets/images/journal_bg2.jpg',
                        ),
                        JournalScreenWidget(
                          name: "life's Colorful",
                          image: 'assets/images/3.png',
                        ),
                        JournalScreenWidget(
                          name: "Music 4 Life",
                          image: 'assets/images/4.png',
                        ),
                        JournalScreenWidget(
                          name: "My Birthday!",
                          image: 'assets/images/bg1.jpg',
                        ),
                        JournalScreenWidget(
                          name: "He Proposed!",
                          image: 'assets/images/bg5.png',
                        ),
                        JournalScreenWidget(
                          name: "Hate Day!",
                          image: 'assets/images/2.png',
                        ),
                        JournalScreenWidget(
                          name: "Just a Day",                          
                          image: 'assets/images/journal_bg2.jpg',
                        ),
                        JournalScreenWidget(
                          name: "life's Colorful",
                          image: 'assets/images/3.png',
                        ),
                        JournalScreenWidget(
                          name: "Music 4 Life",
                          image: 'assets/images/4.png',
                        ),
                      ]),
                ),
              ],
            )),
          ),
        ));
  }
}
