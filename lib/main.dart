import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: 'Aktu companion'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: ListTile(
              contentPadding: EdgeInsets.all(16.0),
              leading: Icon(Icons.assignment),
              title: Text(
                "Notes Section",
                style: TextStyle(
                  fontSize: 24.0,
                ),
              ),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => NotesPage(),
                  ),
                );
                // setState(() {
                //   buildNotesPage();
                // });
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: ListTile(
              contentPadding: EdgeInsets.all(16.0),
              leading: Icon(Icons.account_balance),
              title: Text(
                "Previous Year Question",
                style: TextStyle(
                  fontSize: 24.0,
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: ListTile(
              contentPadding: EdgeInsets.all(16.0),
              leading: Icon(Icons.assignment),
              title: Text(
                "Notice",
                style: TextStyle(
                  fontSize: 24.0,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  NotesPage buildNotesPage() => new NotesPage();
}

class NotesPage extends StatefulWidget {
  @override
  _NotesPageState createState() => _NotesPageState();
}

final List<String> SubjectList = [
  '---Select Subject---',
  'Electronics Engineering',
  'Theroy of automata and languages',
];
String dropDownValue = SubjectList[0];

class _NotesPageState extends State<NotesPage> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text("Notes Section"),
        ),
        
        body: Padding(
          padding: const EdgeInsets.all(20.0),
          child: DropdownButton<String>(focusColor: Color(0xFFEF9A9A),
          iconSize: 60.0,
              items: SubjectList.map<DropdownMenuItem<String>>((String value) {
                return DropdownMenuItem<String>(
                  child: Text(value),
                  value: value,
                );
              }).toList(),
               value: dropDownValue,
               style: TextStyle(color: Colors.red),
              onChanged: (String newValue){setState(() {
                 dropDownValue = newValue;
              });}),
        ),
      ),
    );
  }
}
