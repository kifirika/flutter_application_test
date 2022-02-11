import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_2/models/user.dart';
import 'package:flutter_application_2/simple_api/api.dart';

class SimpleUserPage extends StatefulWidget {
  @override
  createState() => UsersPageState();
}
class UsersPageState extends State {
  var users = <User>[];
  _getUsers() {
    UsersApi.getUsers().then((response) {
      setState(() {
        Iterable list = json.decode(response.body);
        users = list.map((model) => User.fromJson(model)).toList();
      });
    });
  }
  initState() {
    super.initState();
    _getUsers();
  }
  dispose() {
    super.dispose();
  }
  @override
  Widget build(context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {
        Navigator.pop(context);
        },
        child: Icon(Icons.arrow_back),
      ),
      body:
        ListView.builder(
          itemCount: users.length,
          itemBuilder: (context, index) {
            return Card(
              child:
                ListTile(
                  title: Text('Name: ${users[index].name}'),
                  subtitle: Text('Phone: ${users[index].phone}'),
                  leading: Text('${users[index].id}'),
                  tileColor: Colors.amber[50],
                )
            );
          }),
    );
  }
}