import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'files.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Exam Companion',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        scaffoldBackgroundColor: Colors.white,
      ),
      home: MyHomePage(title: 'Exam companion'),
    );
  }
}

class MyHomePage extends StatelessWidget {
  MyHomePage({Key key, this.title}) : super(key: key);
  final String title;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: <Widget>[
          Expanded(
            flex: 2,
            child: ClipPath(
              clipper: MyClipper(),
              child: Container(
                padding: EdgeInsets.only(left: 20, top: 50, right: 20),
                //height: 350,
                width: double.infinity,
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.topLeft,
                    end: Alignment.bottomLeft,
                    colors: [
                      Color(0xFF3383CD),
                      Color(0xFF1124),
                    ],
                  ),
                  //image: DecorationImage(image: AssetImage('assets/images/bg1.jpg'))
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Align(
                      alignment: Alignment.topLeft,
                      child: SvgPicture.asset(
                        'assets/icons/menu.svg',
                        color: Colors.black87,
                      ),
                    ),
                    SizedBox(height: 50),
                    Expanded(
                      child: Stack(
                        children: <Widget>[
                          SvgPicture.asset(
                            'assets/icons/books.svg',
                            width: 150,
                            fit: BoxFit.fitWidth,
                            alignment: Alignment.topCenter,
                          ),
                          Positioned(
                            top: 20,
                            left: 170,
                            child: Text(
                              "      Exam \n Companion",
                              style: TextStyle(
                                fontSize: 28,
                                fontWeight: FontWeight.w600,
                                color: Colors.black87,
                                fontFamily: 'Lobster',
                              ),
                            ),
                          ),
                          Container(),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          Expanded(
            child: Container(
              padding: EdgeInsets.symmetric(
                horizontal: 12.0,
              ),
              child: Row(
                children: <Widget>[
                  buildExpandedNode('notes2', 'Notes', '', context),
                  SizedBox(width: 20),
                  buildExpandedNode(
                      'notes', 'Previous year Papers', '', context),
                ],
              ),
            ),
          ),
          Expanded(
            flex: 1,
            child: Container(),
          )
        ],
      ),
    );
  }

  Expanded buildExpandedNode(
      String icon, String title, String page, BuildContext context) {
    return Expanded(
      child: Stack(
        children: <Widget>[
          FlatButton(
            child: Container(
              height: 150,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(25.0),
                boxShadow: [
                  BoxShadow(
                    blurRadius: 33,
                    offset: Offset(0, 10),
                    color: Color(0xFFD3D3D3).withOpacity(.84),
                  ),
                ],
              ),
            ),
            onPressed: () {
              if (title == 'Notes') {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => NotesPage(),
                  ),
                );
              } else {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => QuestionPaperPage(),
                  ),
                );
              }
            },
          ),
          Align(
            alignment: Alignment.topLeft,
            child: SvgPicture.asset(
              'assets/icons/$icon.svg',
              height: 100,
            ),
          ),
          Positioned(
              bottom: 70,
              left: 20,
              child: Text(
                title,
                style: TextStyle(
                    fontFamily: 'SourceSansPro', fontWeight: FontWeight.bold),
              ))
        ],
      ),
    );
  }
}

class MyClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    var path = Path();
    path.lineTo(0, size.height - 80);
    path.quadraticBezierTo(
        size.width / 2, size.height, size.width, size.height - 80);
    path.lineTo(size.width, 0);
    path.close();
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) {
    return false;
  }
}

class NotesPage extends StatefulWidget {
  @override
  _NotesPageState createState() => _NotesPageState();
}

final List<String> subjectList = [
  '-------Select Subject-------',
  'Electronics Engineering',
  'Microprocessor',
  'Theroy of automata and languages',
  'Operating System',
  'Technical Communication'
];

bool _isVisible = false;
String dropDownValue = subjectList[0];

class _NotesPageState extends State<NotesPage> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        scaffoldBackgroundColor: Colors.white,
      ),
      home: Scaffold(
        body: bulitNotesPageBody(),
      ),
    );
  }

  Widget bulitNotesPageBody() {
    return Column(
      children: <Widget>[
        Expanded(
          flex: 2,
          child: ClipPath(
            clipper: MyClipper(),
            child: Container(
              padding: EdgeInsets.only(
                left: 20,
                top: 40,
                right: 20,
              ),
              width: double.infinity,
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topLeft,
                  end: Alignment.bottomLeft,
                  colors: [
                    Color(0xFFFF6F00),
                    Color(0xFF1124),
                  ],
                ),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Align(
                    alignment: Alignment.topLeft,
                    child: FlatButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => MyHomePage(),
                          ),
                        );
                      },
                      child: Icon(
                        Icons.home,
                        size: 30.0,
                      ),
                    ),
                  ),
                  SizedBox(height: 30),
                  Container(
                    margin: EdgeInsets.symmetric(
                      horizontal: 10.0,
                    ),
                    padding: EdgeInsets.symmetric(horizontal: 12.0),
                    height: 65.0,
                    width: double.infinity,
                    // color:Colors.white,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(25.0),
                      border: Border.all(
                        color: Color(0xFFE5E5E5),
                      ),
                    ),
                    child: Row(
                      children: <Widget>[
                        Expanded(
                          child: buildDropdown(),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
        Expanded(
          child: Container(
            child: Row(
              children: <Widget>[
                buildExpandedTiles('1', _isVisible, 1),
                buildExpandedTiles('2', _isVisible, 2),
              ],
            ),
          ),
        ),
        Expanded(
          child: Container(
            child: Row(
              children: <Widget>[
                buildExpandedTiles('3', _isVisible, 3),
                buildExpandedTiles('4', _isVisible, 4),
              ],
            ),
          ),
        ),
        Expanded(
          child: Container(
              child: Row(
            children: <Widget>[
              buildExpandedTiles('5', _isVisible, 5),
              buildExpandedTiles('6', false, 6),
            ],
          )),
        ),
        Expanded(child: Container())
      ],
    );
  }

  DropdownButton<String> buildDropdown() {
    return DropdownButton(
      items: subjectList.map<DropdownMenuItem<String>>((String value) {
        return DropdownMenuItem<String>(
          child: Text(value),
          value: value,
        );
      }).toList(),
      onChanged: (String newValue) {
        setState(
          () {
            dropDownValue = newValue;
            _isVisible = (newValue == subjectList[0]) ? false : true;
          },
        );
      },
      value: dropDownValue,
      underline: SizedBox(),
      icon: SvgPicture.asset('assets/icons/dropdown.svg'),
    );
  }

  String getUrl(int no) {
    int index = (dropDownValue == subjectList[1])
        ? 0
        : (dropDownValue == subjectList[2])
            ? 1
            : (dropDownValue == subjectList[3])
                ? 2
                : (dropDownValue == subjectList[4])
                    ? 3
                    : (dropDownValue == subjectList[5]) ? 4 : -1;
    if (index != -1) {
      return subjects[index].files[no - 1].url;
    }
    return null;
  }

  Expanded buildExpandedTiles(String text, bool flag, int no) => Expanded(
        child: Visibility(
          visible: flag,
          child: Stack(
            children: <Widget>[
              FlatButton(
                onPressed: () {
                  String url = getUrl(no);
                  if (url != null) {
                    _launchURL(url);
                  }
                },
                child: Container(
                  margin: EdgeInsets.only(top: 10.0, bottom: 10.0),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(25.0),
                    boxShadow: [
                      BoxShadow(
                        blurRadius: 33,
                        offset: Offset(0, 10),
                        color: Color(0xFFD3D3D3).withOpacity(.84),
                      )
                    ],
                  ),
                ),
              ),
              Align(
                alignment: Alignment.topCenter,
                child: SvgPicture.asset(
                  'assets/icons/paper.svg',
                  height: 100.0,
                ),
              ),
              Positioned(
                  bottom: 20,
                  left: 65,
                  child: Text(
                    "Unit-$text",
                    style: TextStyle(
                        fontFamily: 'SourceSansPro',
                        fontWeight: FontWeight.bold,
                        fontSize: 20),
                  ))
            ],
          ),
        ),
      );

  _launchURL(String localUrl) async {
    String url = localUrl;
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }
}

class QuestionPaperPage extends StatefulWidget {
  @override
  _QuestionPaperPageState createState() => _QuestionPaperPageState();
}

class _QuestionPaperPageState extends State<QuestionPaperPage> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        scaffoldBackgroundColor: Colors.white,
      ),
      home: Scaffold(
        body: bulitPaperPageBody(),
      ),
    );
  }

  Widget bulitPaperPageBody() {
    return Column(
      children: <Widget>[
        Expanded(
          flex: 2,
          child: ClipPath(
            clipper: MyClipper(),
            child: Container(
              padding: EdgeInsets.only(
                left: 20,
                top: 40,
                right: 20,
              ),
              width: double.infinity,
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topLeft,
                  end: Alignment.bottomLeft,
                  colors: [
                    Color(0xFFFF6F00),
                    Color(0xFF1124),
                  ],
                ),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Align(
                    alignment: Alignment.topLeft,
                    child: FlatButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => MyHomePage(),
                          ),
                        );
                      },
                      child: Icon(
                        Icons.home,
                        size: 30.0,
                      ),
                    ),
                  ),
                  SizedBox(height: 30),
                  Container(
                    margin: EdgeInsets.symmetric(
                      horizontal: 10.0,
                    ),
                    padding: EdgeInsets.symmetric(horizontal: 12.0),
                    height: 65.0,
                    width: double.infinity,
                    // color:Colors.white,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(25.0),
                      border: Border.all(
                        color: Color(0xFFE5E5E5),
                      ),
                    ),
                    child: Row(
                      children: <Widget>[
                        Expanded(
                          child: buildDropdown(),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
        Expanded(
          child: Container(
            child: Row(
              children: <Widget>[
                buildExpandedTiles('1', _isVisible, 1),
                // buildExpandedTiles('2', false, 2),
              ],
            ),
          ),
        ),
        Expanded(
          child: Container(
            child: Row(
              children: <Widget>[
                buildExpandedTiles('2', _isVisible, 3),
                // buildExpandedTiles('4', false, 4),
              ],
            ),
          ),
        ),
        Expanded(
          child: Container(
              child: Row(
            children: <Widget>[
              //buildExpandedTiles('5', false, 5),
              // buildExpandedTiles('6', false, 6),
            ],
          )),
        ),
        Expanded(child: Container())
      ],
    );
  }

  DropdownButton<String> buildDropdown() {
    return DropdownButton(
      items: subjectList.map<DropdownMenuItem<String>>((String value) {
        return DropdownMenuItem<String>(
          child: Text(value),
          value: value,
        );
      }).toList(),
      onChanged: (String newValue) {
        setState(
          () {
            dropDownValue = newValue;
            _isVisible = (newValue == subjectList[0]) ? false : true;
          },
        );
      },
      value: dropDownValue,
      underline: SizedBox(),
      icon: SvgPicture.asset('assets/icons/dropdown.svg'),
    );
  }

  String getUrl(int no) {
    int index = (dropDownValue == subjectList[1])
        ? 0
        : (dropDownValue == subjectList[2])
            ? 1
            : (dropDownValue == subjectList[3])
                ? 2
                : (dropDownValue == subjectList[4])
                    ? 3
                    : (dropDownValue == subjectList[5]) ? 4 : -1;
    if (index == 0) {
      return 'https://drive.google.com/open?id=1qebS52kGU2SD0BxLsirGeIswOwocVjUO';
    }else if( index == 1 ){
      return 'https://drive.google.com/open?id=1R1RM5tuBsJRcGTs5EKvj-PeMfcv0pZnr';
    } else if(index!=-1){
      return 'https://drive.google.com/open?id=1R1RM5tuBsJRcGTs5EKvj-PeMfcv0pZnr';
    }
    return null;
  }

  Expanded buildExpandedTiles(String text, bool flag, int no) => Expanded(
        child: Visibility(
          visible: flag,
          child: Stack(
            children: <Widget>[
              FlatButton(
                onPressed: () {
                  String url = getUrl(no);
                  if (url != null) {
                    _launchURL(url);
                  }
                },
                child: Container(
                  margin: EdgeInsets.only(top: 10.0, bottom: 10.0),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(25.0),
                    boxShadow: [
                      BoxShadow(
                        blurRadius: 33,
                        offset: Offset(0, 10),
                        color: Color(0xFFD3D3D3).withOpacity(.84),
                      )
                    ],
                  ),
                ),
              ),
              Align(
                alignment: Alignment.topCenter,
                child: SvgPicture.asset(
                  'assets/icons/paper.svg',
                  height: 100.0,
                ),
              ),
              Positioned(
                  bottom: 20,
                  left: 100,
                  child: Text(
                    "Question Paper-$text",
                    style: TextStyle(
                        fontFamily: 'SourceSansPro',
                        fontWeight: FontWeight.bold,
                        fontSize: 20),
                  ))
            ],
          ),
        ),
      );

  _launchURL(String localUrl) async {
    String url = localUrl;
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }
}
