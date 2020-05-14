import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:com/clipper.dart';
import 'questionpage.dart';
import 'notespage.dart';

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