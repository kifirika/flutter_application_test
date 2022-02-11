// @dart=2.9
import 'package:flutter/material.dart';
import 'package:flutter_application_2/pages/simple_user_page.dart';
import 'pages/sm_user_page.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: Text('JSON APP'),
          centerTitle: true,
        ),
        body: FirstPage(),
      ),
      initialRoute: '/',
      routes: {
        '/users': (context) => SimpleUserPage(),
        '/users_sm': (context) => SmUserPage(),
      },
        //HomePage(),
        );
  }
}

class FirstPage extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: EdgeInsets.all(20.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
                onPressed: () {
                  Navigator.pushNamed(context, '/users');
                },
                child: Text('Load users'),
                style: ElevatedButton.styleFrom(
                  primary: Colors.amber[700],
                  textStyle: const TextStyle(
                      fontSize: 20, fontWeight: FontWeight.bold),
                )),
            SizedBox(width: 20),
            ElevatedButton(
                onPressed: () {
                  Navigator.pushNamed(context, '/users_sm');
                },
                child: Text('Bloc'),
                style: ElevatedButton.styleFrom(
                  primary: Colors.amber[700],
                  textStyle: const TextStyle(
                      fontSize: 20, fontWeight: FontWeight.bold),
                )),
          ],
        ));
  }
}