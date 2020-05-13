import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:flutter_svg/flutter_svg.dart';

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
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => NotesPage()));
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
  'Theroy of automata and languages',
  'Microprocessor',
  'Technical Communication'
];
String dropDownValue = subjectList[0];

class _NotesPageState extends State<NotesPage> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        // primarySwatch: Colors.white,
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
                top: 50,
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
                    child: Icon(
                      Icons.home,
                      size: 30.0,
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
                          child: DropdownButton(
                            items: subjectList
                                .map<DropdownMenuItem<String>>((String value) {
                              return DropdownMenuItem<String>(
                                child: Text(value),
                                value: value,
                              );
                            }).toList(),
                            onChanged: (String newValue) {
                              setState(
                                () {
                                  dropDownValue = newValue;
                                },
                              );
                            },
                            value: dropDownValue,
                            underline: SizedBox(),
                            icon: SvgPicture.asset('assets/icons/dropdown.svg'),
                          ),
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
                buildExpandedTiles('1',true),
                buildExpandedTiles('2',true),
              ],
            ),
          ),
        ),
        Expanded(
          child: Container(
            child: Row(
              children: <Widget>[
                buildExpandedTiles('3',true),
                buildExpandedTiles('4',true),
              ],
            ),
          ),
        ),
        Expanded(
          child: Container(
              child: Row(
            children: <Widget>[
              buildExpandedTiles('5',true),
              buildExpandedTiles('6',false),
            ],
          )),
        ),
        Expanded(child: Container())
      ],
    );
  }

  Expanded buildExpandedTiles(String text,bool flag) => Expanded(
        child: Visibility(
          visible: flag,
                  child: Stack(
            children: <Widget>[
              FlatButton(
                onPressed: null,
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
                bottom:20,
                left: 65,
                child:Text("Unit-$text",
                style: TextStyle(
                  fontFamily: 'SourceSansPro',
                  fontWeight: FontWeight.bold,
                  fontSize: 20
                ),)  
              )
            ],
          ),
        ),
      );

  Padding buildListTile(String text) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: ListTile(
        leading: Icon(
          Icons.assignment,
          size: 30.0,
          color: Colors.white70,
        ),

        // contentPadding: EdgeInsets.all(20.0),
        title: Text(
          text,
          style: TextStyle(fontSize: 30.0, color: Colors.white70),
        ),
        onTap: () {
          setState(() {
            _launchURL();
          });
        },
      ),
    );
  }

  _launchURL() async {
    const url = 'https://flutter.dev';
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }

  Padding buildDropdown() {
    return Padding(
      padding: const EdgeInsets.fromLTRB(40, 30, 20, 20),
      child: DropdownButton<String>(
          autofocus: true,
          elevation: 10,
          focusColor: Colors.amber,
          dropdownColor: Colors.black87,
          iconSize: 40.0,
          items: subjectList.map<DropdownMenuItem<String>>((String value) {
            return DropdownMenuItem<String>(
              child: Text(value),
              value: value,
            );
          }).toList(),
          value: dropDownValue,
          style: TextStyle(color: Colors.white70),
          onChanged: (String newValue) {
            setState(() {
              dropDownValue = newValue;
            });
          }),
    );
  }
}

// return Column(
//   crossAxisAlignment: CrossAxisAlignment.center,
//   children: <Widget>[
//     buildDropdown(),
//     buildListTile("Unit - 1"),
//     buildListTile("Unit - 2"),
//     buildListTile("Unit - 3"),
//     buildListTile("Unit - 4"),
//     buildListTile("Unit - 5"),
//   ],
// );

// Column(
//           mainAxisAlignment: MainAxisAlignment.start,
//           children: <Widget>[
//             Padding(
//               padding: const EdgeInsets.all(8.0),
//               child: ListTile(
//                 contentPadding: EdgeInsets.all(16.0),
//                 leading: Icon(Icons.assignment),
//                 title: Text(
//                   "Notes Section",
//                   style: TextStyle(
//                     fontSize: 24.0,
//                   ),
//                 ),
//                 onTap: () {
//                   Navigator.push(
//                     context,
//                     MaterialPageRoute(
//                       builder: (context) => NotesPage(),
//                     ),
//                   );
//                 },
//               ),
//             ),
//             Padding(
//               padding: const EdgeInsets.all(8.0),
//               child: ListTile(
//                 contentPadding: EdgeInsets.all(16.0),
//                 leading: Icon(Icons.account_balance),
//                 title: Text(
//                   "Previous Year Question",
//                   style: TextStyle(
//                     fontSize: 24.0,
//                   ),
//                 ),
//               ),
//             ),
//             Padding(
//               padding: const EdgeInsets.all(8.0),
//               child: ListTile(
//                 contentPadding: EdgeInsets.all(16.0),
//                 leading: Icon(Icons.assignment),
//                 title: Text(
//                   "Notice",
//                   style: TextStyle(
//                     fontSize: 24.0,
//                   ),
//                 ),
//               ),
//             ),
//           ],
//         ),
