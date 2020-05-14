import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:com/files.dart';
import 'package:com/clipper.dart';
import 'homepage.dart';

class QuestionPaperPage extends StatefulWidget {
  @override
  _QuestionPaperPageState createState() => _QuestionPaperPageState();
}

class _QuestionPaperPageState extends State<QuestionPaperPage> {
  static List<String> subjectList = [
    '-------Select Subject-------',
    'Electronics Engineering',
    'Microprocessor',
    'Theroy of automata and languages',
    'Operating System',
    'Technical Communication'
  ];

  bool _isVisible = false;
  String dropDownValue = subjectList[0];

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
    if (index != -1) {
      return questionPprUrl[index];
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