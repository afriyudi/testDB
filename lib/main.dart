import 'dart:async';
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;


void main() {
  runApp(MaterialApp(
    title: 'Program Absensi MHS',
    //home: TutorialHome(),
    initialRoute: '/',
    routes: {
      // When navigating to the "/" route, build the TutorialHome widget.
      '/': (context) => TutorialHome(),
      // When navigating to the "/second" route, build the InputData widget.
      '/second': (context) => InputData(),
      '/third': (context) => DataTableDemo(),
      '/ke4': (context) => MyApp1(),
      
    },
    debugShowCheckedModeBanner: false,
  ));
}

class TutorialHome extends StatelessWidget {
  List<String> _listViewData = [
    "vidyaoctavianti2@gmail.com",
    "idzhaadhityaranius@gmail.com",
    "fauzanrizky399@gmail.com",
    "aditwahyu216@gmail.com",
    "thedaamandaa@gmail.com",
    "thdaminto@gmail.com",
    "rizkiagung225@gmail.com",
  ];

  _displayDialog(BuildContext context) async {
    return showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: Text('Display Data Mahasiswa'),
            content: Container(
              width: double.maxFinite,
              height: 300.0,
              child: ListView(
                padding: EdgeInsets.all(8.0),
                //map List of our data to the ListView
                children: _listViewData
                    .map((data) => new FlatButton(
                          child: new Text(data),
                          onPressed: () {
                            Navigator.of(context).pop();
                          },
                        ))
                    .toList(),
              ),
            ),
            actions: <Widget>[
              new FlatButton(
                child: new Text('CANCEL'),
                onPressed: () {
                  Navigator.of(context).pop();
                },
              )
            ],
          );
        });
  }

  _showPopupMenu(BuildContext context){
    showMenu<String>(
      context: context,
      position: RelativeRect.fromLTRB(25.0, 25.0, 0.0, 0.0),      //position where you want to show the menu on screen
      items: [
        PopupMenuItem<String>(
            child: const Text('menu option 1'), value: '1'),
        PopupMenuItem<String>(
            child: const Text('menu option 2'), value: '2'),
        PopupMenuItem<String>(
            child: const Text('menu option 3'), value: '3'),
      ],
      elevation: 8.0,
    )
    .then<void>((String itemSelected) {

      if (itemSelected == null) return;

      if(itemSelected == "1"){
        print("1");
      }else if(itemSelected == "2"){
        print("2");
      }else{
        print("3");
      }

    });
}

   _cariApa(BuildContext context) {
    showMenu<String>(
      context: context,
      position: RelativeRect.fromLTRB(25.0, 25.0, 0.0,
          0.0), //position where you want to show the menu on screen
      items: [
        PopupMenuItem<String>(child: const Text('nim'), value: '1'),
        PopupMenuItem<String>(child: const Text('nama'), value: '2'),
        PopupMenuItem<String>(child: const Text('kelas'), value: '3'),
        PopupMenuItem<String>(child: const Text('mata kuliah'), value: '4'),
      ],
      elevation: 8.0,
    ).then<void>((String itemSelected) {
      if (itemSelected == null) return;

      if (itemSelected == "1") {
        print("1");
      } else if (itemSelected == "2") {
        print("2");
      } else if (itemSelected == "3") {
        print("3");
      } else {
        print("4");
      }
    });
  }
  
  
  @override
  Widget build(BuildContext context) {
    // Scaffold is a layout for the major Material Components.
    return Scaffold(
      appBar: AppBar(
        title: Text('Program Absensi MHS'),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.delete),
            tooltip: 'Delete',
            onPressed: () {
              Navigator.pushNamed(context, '/third');
            },
          ),
          IconButton(
            icon: Icon(Icons.search),
            tooltip: 'Search',
            onPressed: () {_cariApa(context);},
          ),
          IconButton(
            icon: Icon(Icons.add),
            tooltip: 'Add',
            onPressed: () {
              print("test");
              Navigator.pushNamed(context, '/ke4');
            },
          ),
          IconButton(
            icon: Icon(Icons.more_vert),
            tooltip: 'popup menu',
            onPressed: () {
              
               _showPopupMenu(context);  
            },
          ),
        ],
      ),
      // body is the majority of the screen.
      body: Center(
        child: Text('PAMHS Ver.1'),
      ),
       floatingActionButton: Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: <Widget>[
            FloatingActionButton(
              tooltip: 'delete', // used by assistive technologies
              child: Icon(Icons.delete),
              mini: true,
              onPressed: () {
                Navigator.pushNamed(context, '/third');
              },
            ),
            FloatingActionButton(
              tooltip: 'Add', // used by assistive technologies
              child: Icon(Icons.add),
              mini: true,
              onPressed: () {
                Navigator.pushNamed(context, '/second');
              },
            ),
          ]),
      drawer: Drawer(
        // Add a ListView to the drawer. This ensures the user can scroll
        // through the options in the drawer if there isn't enough vertical
        // space to fit everything.
        child: ListView(
          // Important: Remove any padding from the ListView.
          padding: EdgeInsets.zero,
          children: <Widget>[
           Container(
              height: 90.0,
              child: DrawerHeader(
                child: Text('Menu Utama',
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                    )),
                decoration: BoxDecoration(
                  color: Colors.blue,
                ),
                margin: EdgeInsets.all(0.0),
                padding: EdgeInsets.all(10.0),
              ),
            ),
            ListTile(
              title: Text('Input Data'),
              onTap: () {
                // Update the state of the app
                // ...
                // Then close the drawer
                Navigator.pushNamed(context, '/second');
              },
            ),
            ListTile(
              title: Text('Display Data'),
              onTap: () {
                // Update the state of the app
                // ...
                // Then close the drawer
                _displayDialog(context);
              },
            ),
            MyButton(),
          ],
        ),
      ),
    );
  }
}

class MyButton extends StatelessWidget {
  Widget gambar() {
    return Container(
        padding: EdgeInsets.all(2),
        height: 120,
        child: Card(
            child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
             Image.network("https://elearning.binadarma.ac.id/pluginfile.php/1/theme_lambda/logo/1602057627/ubd_logo.png",),
              Expanded(
                  child: Container(
                      padding: EdgeInsets.all(5),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: <Widget>[
                          Text("program Absensi MHS",
                              style: TextStyle(fontWeight: FontWeight.bold)),
                          Text("Ver 1.0"),
                          Text("create by Price"),
                        ],
                      )))
            ])));
  }
  
  Widget _about() {
    return Container(
      height: 36.0,
      padding: const EdgeInsets.all(8.0),
      margin: const EdgeInsets.symmetric(horizontal: 8.0),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(5.0),
        color: Colors.lightGreen[500],
      ),
      child: Center(
        child: Text('About'),
      ),
    );
  }


  _showMaterialDialog(BuildContext context) {
    showDialog(
        context: context,
        builder: (_) => new AlertDialog(
              title: _about(),
              content: gambar(),
              actions: <Widget>[
                FlatButton(
                  child: Text('Close me!'),
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                )
              ],
            ));
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        _showMaterialDialog(context);
      },
      child: Container(
        height: 36.0,
        padding: const EdgeInsets.all(8.0),
        margin: const EdgeInsets.symmetric(horizontal: 8.0),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(5.0),
          color: Colors.lightGreen[500],
        ),
        child: Center(
          child: Text('About'),
        ),
      ),
    );
  }
}


Future saveData(BuildContext context,String nim,String nama,String kelas,String kdmatkul,String email) async{

    // Showing CircularProgressIndicator using State.
    

    // Getting value from Controller
    
    // API URL
    var url = 'https://testflutterku.000webhostapp.com/saveData.php';

    // Store all data with Param Name.
    var data = {'nim':nim,'nama': nama,'kelas':kelas,'kdmatkul':kdmatkul, 'email': email};

    // Starting Web Call with data.
    var response = await http.post(url, body: json.encode(data));

    // Getting Server response into variable.
    var message = jsonDecode(response.body);

    // If Web call Success than Hide the CircularProgressIndicator.
    if(response.statusCode == 200){
      
    }
   
    // Showing Alert Dialog with Response JSON.
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: new Text(message),
          actions: <Widget>[
            FlatButton(
              child: new Text("OK"),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );

  }

class InputData extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<InputData> {
  TextEditingController namaController = TextEditingController();
  TextEditingController nimController = TextEditingController();
  TextEditingController kelasController = TextEditingController();
  TextEditingController kdmatkulController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  
  String nimMHS = '';
  String fullName = '';
  String kelas = '';
  String kdmatkul = '';
  String email = '';
  
  Widget _inputFullName() {
    return Container(
        margin: EdgeInsets.all(20),
        child: TextField(
          controller: namaController,
          decoration: InputDecoration(
            border: OutlineInputBorder(),
            labelText: "Full Name",
          ),
          onChanged: (text) {
            setState(() {
              fullName = text;
              //you can access nameController in its scope to get
              // the value of text entered as shown below
              //fullName = nameController.text;
            });
          },
        ));
  }

  Widget _inputNIM() {
    return Container(
        margin: EdgeInsets.all(20),
        child: TextField(
          controller: nimController,
          decoration: InputDecoration(
            border: OutlineInputBorder(),
            labelText: "Nomor Induk Mahasiswa",
          ),
          onChanged: (text) {
            setState(() {
              nimMHS = text;
              //you can access nameController in its scope to get
              // the value of text entered as shown below
              //nimMHS = nameController.text;
            });
          },
        ));
  }


 Widget _inputKelas() {
    return Container(
        margin: EdgeInsets.all(20),
        child: TextField(
          controller: kelasController,
          decoration: InputDecoration(
            border: OutlineInputBorder(),
            labelText: "Nomor Induk Mahasiswa",
          ),
          onChanged: (text) {
            setState(() {
              kelas = text;
             
            });
          },
        ));
  }

Widget _inputkdmatkul() {
    return Container(
        margin: EdgeInsets.all(20),
        child: TextField(
          controller: kdmatkulController,
          decoration: InputDecoration(
            border: OutlineInputBorder(),
            labelText: "Nomor Induk Mahasiswa",
          ),
          onChanged: (text) {
            setState(() {
              kdmatkul = text;
             
            });
          },
        ));
  }

Widget _inputEmail() {
    return Container(
        margin: EdgeInsets.all(20),
        child: TextField(
          controller: emailController,
          decoration: InputDecoration(
            border: OutlineInputBorder(),
            labelText: "Nomor Induk Mahasiswa",
          ),
          onChanged: (text) {
            setState(() {
              email = text;
             
            });
          },
        ));
  }

Widget _submit() {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 16.0),
      child: ElevatedButton(
        onPressed: () {
          // Validate will return true if the form is valid, or false if
          // the form is invalid.
          print(nimMHS);
          print(fullName);
          if ((nimMHS.isEmpty) || (fullName.isEmpty)) {
            print("nim atau nama tidak boleh kosong");
          
          showDialog<void>(
            context: context,
            builder: (BuildContext context) {
              return AlertDialog(
                title: const Text('Thanks!'),
                content: Text('nim atau nama tidak boleh kosong'),
                actions: <Widget>[
                  FlatButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    child: const Text('OK'),
                  ),
                ],
              );
            },
          );
          }
          else
          {saveData(context,nimMHS,fullName,kelas,kdmatkul,email );}  ///end if
        },
        child: Text('Submit'),
      ),
    );
  }
  
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        
          appBar: AppBar(
            title: Text('Input Data Mahasiswa'),
          ),
          body: Center(
              child: Column(children: <Widget>[
                _inputNIM(),
            _inputFullName(),
            _inputKelas(),
            _inputkdmatkul(),
            _inputEmail(),
                _submit(),
            
            Container(
              margin: EdgeInsets.all(20),
              child: Text(fullName),
            ),
          ])),
          floatingActionButton: FloatingActionButton(
            tooltip: 'Close', // used by assistive technologies
            child: Icon(Icons.close),
            onPressed: () {
              Navigator.pushNamed(context, '/');
            },
          )),
    );
  }
}

class User {
  String firstName;
  String lastName;

  User({this.firstName, this.lastName});

  static List<User> getUsers() {
    return <User>[
      User(firstName: "Aaryan", lastName: "Shah"),
      User(firstName: "Ben", lastName: "John"),
      User(firstName: "Carrie", lastName: "Brown"),
      User(firstName: "Deep", lastName: "Sen"),
      User(firstName: "Emily", lastName: "Jane"),
    ];
  }
}


class DataTableDemo extends StatefulWidget {
  DataTableDemo() : super();

  final String title = "Data Table Flutter Demo";

  @override
  DataTableDemoState createState() => DataTableDemoState();
}

class DataTableDemoState extends State<DataTableDemo> {
  List<User> users;
  List<User> selectedUsers;
  bool sort;

  @override
  void initState() {
    sort = false;
    selectedUsers = [];
    users = User.getUsers();
    super.initState();
  }

  onSortColum(int columnIndex, bool ascending) {
    if (columnIndex == 0) {
      if (ascending) {
        users.sort((a, b) => a.firstName.compareTo(b.firstName));
      } else {
        users.sort((a, b) => b.firstName.compareTo(a.firstName));
      }
    }
  }

  onSelectedRow(bool selected, User user) async {
    setState(() {
      if (selected) {
        selectedUsers.add(user);
      } else {
        selectedUsers.remove(user);
      }
    });
  }

  deleteSelected() async {
    setState(() {
      if (selectedUsers.isNotEmpty) {
        List<User> temp = [];
        temp.addAll(selectedUsers);
        for (User user in temp) {
          users.remove(user);
          selectedUsers.remove(user);
        }
      }
    });
  }

  SingleChildScrollView dataBody() {
    return SingleChildScrollView(
      scrollDirection: Axis.vertical,
      child: DataTable(
        sortAscending: sort,
        sortColumnIndex: 0,
        columns: [
          DataColumn(
              label: Text("FIRST NAME"),
              numeric: false,
              tooltip: "This is First Name",
              onSort: (columnIndex, ascending) {
                setState(() {
                  sort = !sort;
                });
                onSortColum(columnIndex, ascending);
              }),
          DataColumn(
            label: Text("LAST NAME"),
            numeric: false,
            tooltip: "This is Last Name",
          ),
        ],
        rows: users
            .map(
              (user) => DataRow(
                  selected: selectedUsers.contains(user),
                  onSelectChanged: (b) {
                    print("Onselect");
                    onSelectedRow(b, user);
                  },
                  cells: [
                    DataCell(
                      Text(user.firstName),
                      onTap: () {
                        print('Selected ${user.firstName}');
                      },
                    ),
                    DataCell(
                      Text(user.lastName),
                    ),
                  ]),
            )
            .toList(),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.center,
        verticalDirection: VerticalDirection.down,
        children: <Widget>[
          Expanded(
            child: dataBody(),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              Padding(
                padding: EdgeInsets.all(20.0),
                child: OutlineButton(
                  child: Text('SELECTED ${selectedUsers.length}'),
                  onPressed: () {},
                ),
              ),
              Padding(
                padding: EdgeInsets.all(20.0),
                child: OutlineButton(
                  child: Text('DELETE SELECTED'),
                  onPressed: selectedUsers.isEmpty
                      ? null
                      : () {
                          deleteSelected();
                        },
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

//==================================
Future<Album> fetchAlbum() async {
  final response =
      await http.get('https://testflutterku.000webhostapp.com/onejson.php');

  if (response.statusCode == 200) {
    // If the server did return a 200 OK response,
    // then parse the JSON.
    return Album.fromJson(jsonDecode(response.body));
  } else {
    // If the server did not return a 200 OK response,
    // then throw an exception.
    throw Exception('Failed to load album');
  }
}

class Album {
  final int userId;
  final int id;
  final String title;

  Album({this.userId, this.id, this.title});

  factory Album.fromJson(Map<String, dynamic> json) {
    return Album(
      userId: json['userId'],
      id: json['id'],
      title: json['title'],
    );
  }
}



class MyApp1 extends StatefulWidget {
  MyApp1({Key key}) : super(key: key);

  @override
  _MyAppState1 createState() => _MyAppState1();
}

class _MyAppState1 extends State<MyApp1> {
  Future<Album> futureAlbum;

  @override
  void initState() {
    super.initState();
    futureAlbum = fetchAlbum();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Fetch Data Example',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Scaffold(
        appBar: AppBar(
          title: Text('Fetch Data Example'),
        ),
        body: Center(
          child: FutureBuilder<Album>(
            future: futureAlbum,
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                return Text(snapshot.data.title);
              } else if (snapshot.hasError) {
                return Text("${snapshot.error}");
              }

              // By default, show a loading spinner.
              return CircularProgressIndicator();
            },
          ),
        ),
      ),
    );
  }
}