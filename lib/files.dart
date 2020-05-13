class Files {
  String url;

  Files({this.url});
}

List<Files> file1 = [
  Files(url:'https://drive.google.com/open?id=1JC6iVDqH3fuMT0d2uBE4xbZA5U5wau4I'),
  Files(url:'https://drive.google.com/open?id=1JC6iVDqH3fuMT0d2uBE4xbZA5U5wau4I'),
  Files(url:'https://drive.google.com/open?id=1JC6iVDqH3fuMT0d2uBE4xbZA5U5wau4I'),
  Files(url:'https://drive.google.com/open?id=1JC6iVDqH3fuMT0d2uBE4xbZA5U5wau4I'),
  Files(url:'https://drive.google.com/open?id=1JC6iVDqH3fuMT0d2uBE4xbZA5U5wau4I'),

];

List<Files> file2 = [
  Files(url:'https://drive.google.com/open?id=1anreuoFuQUe8aqedICFK0AZUsLFLVXox'),
  Files(url:'https://drive.google.com/open?id=1anreuoFuQUe8aqedICFK0AZUsLFLVXox'),
  Files(url:'https://drive.google.com/open?id=1anreuoFuQUe8aqedICFK0AZUsLFLVXox'),
  Files(url:'https://drive.google.com/open?id=1anreuoFuQUe8aqedICFK0AZUsLFLVXox'),
  Files(url:'https://drive.google.com/open?id=1anreuoFuQUe8aqedICFK0AZUsLFLVXox'),
];

List<Files> file3 = [
  Files(url:'https://drive.google.com/open?id=1MN4dUXejps15Cr6LPy4sYELedpJbZv8v'),
  Files(url:'https://drive.google.com/open?id=1MN4dUXejps15Cr6LPy4sYELedpJbZv8v'),
  Files(url:'https://drive.google.com/open?id=1MN4dUXejps15Cr6LPy4sYELedpJbZv8v'),
  Files(url:'https://drive.google.com/open?id=1MN4dUXejps15Cr6LPy4sYELedpJbZv8v'),
  Files(url:'https://drive.google.com/open?id=1MN4dUXejps15Cr6LPy4sYELedpJbZv8v'),
];
List<Files> file4 = [
  Files(url:'https://drive.google.com/open?id=1anreuoFuQUe8aqedICFK0AZUsLFLVXox'),
  Files(url:'https://drive.google.com/open?id=1anreuoFuQUe8aqedICFK0AZUsLFLVXox'),
  Files(url:'https://drive.google.com/open?id=1anreuoFuQUe8aqedICFK0AZUsLFLVXox'),
  Files(url:'https://drive.google.com/open?id=1anreuoFuQUe8aqedICFK0AZUsLFLVXox'),
  Files(url:'https://drive.google.com/open?id=1anreuoFuQUe8aqedICFK0AZUsLFLVXox'),
];
List<Files> file5 = [
  Files(url:'https://drive.google.com/open?id=1anreuoFuQUe8aqedICFK0AZUsLFLVXox'),
  Files(url:'https://drive.google.com/open?id=1anreuoFuQUe8aqedICFK0AZUsLFLVXox'),
  Files(url:'https://drive.google.com/open?id=1anreuoFuQUe8aqedICFK0AZUsLFLVXox'),
  Files(url:'https://drive.google.com/open?id=1anreuoFuQUe8aqedICFK0AZUsLFLVXox'),
  Files(url:'https://drive.google.com/open?id=1anreuoFuQUe8aqedICFK0AZUsLFLVXox'),
];


class Subjects{
  String name;
  List<Files> files;

  Subjects({this.name,this.files});
}

List<Subjects> subjects = [
  Subjects(name:'Electronics Engineering',files: file1),
  Subjects(name:'Microprocessor',files: file2),
  Subjects(name:'Operating System',files: file3),
  Subjects(name:'Theory of automata and languages',files: file4),
  Subjects(name:'Technical Communication',files: file5),

];




