import 'package:flutter/material.dart';
import './widgets/my_drawer.dart';
import '../widgets/dismissible.dart';
import './models/album.dart';
import 'package:http/http.dart' as http;


import 'dart:convert';


void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // static const appTitle = 'Drawer Demo';

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        theme: ThemeData(
          primaryColor: Colors.blue,
          textTheme: const TextTheme(
            headline1: TextStyle(fontSize: 72.0, fontWeight: FontWeight.bold),
          ),
        ),
        title: 'appTitle',
        home: DefaultTabController(
          length: 3,
          child: MyHomePage(),
        ));
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  late Future<Album> futureAlbum;


Future<Album> fetchAlbum() async {
  final response = await http
      .get(Uri.parse('https://jsonplaceholder.typicode.com/albums/2'));

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

  @override
  void initState() {
    futureAlbum = fetchAlbum();
        super.initState();
  }
  // final String title;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Demo app'),
        bottom: TabBar(tabs: [
          Tab(
            icon: Icon(Icons.home),
            text: 'HOME',
          ),
          Tab(
            icon: Icon(Icons.account_box),
            text: 'ABOUT',
          ),
          Tab(
            icon: Icon(Icons.contact_mail),
            text: 'CONTACT',
          ),
        ]),
      ),
      drawer: MyDrawer(),
      body: TabBarView(children: [
        Dismissables(),
        Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('HELLO'),
            ElevatedButton(
              onPressed: () {
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    action: SnackBarAction(
                        label: 'undo',
                        onPressed: () {
                          print('undo');
                        },
                        textColor: Colors.amber),
                    backgroundColor: Colors.black38,
                    duration: Duration(seconds: 1),
                    content: Text("it's snackbar"),
                  ),
                );
              },
              child: Text('show snackbar'),
            ),
          ],
        ),
        Center(
          child: FutureBuilder<Album>(
            future: futureAlbum,
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                // print(snapshot.data != null ? snapshot.data?.title : 'kkk');
                return Text(snapshot.data!.title);
              } else if (snapshot.hasError) {
                return Text('${snapshot.error}');
              }

              // By default, show a loading spinner.
              return const CircularProgressIndicator();
            },
          ),
        )
        ,
      ]),
    );
  }
}
