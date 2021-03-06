// @dart=2.9
import 'dart:async';
import 'package:http/http.dart' as http;

const baseUrl = "https://jsonplaceholder.typicode.com";
class UsersApi {
  static Future getUsers() async {
    var url = baseUrl + "/users";
    return await http.get(Uri.parse(url));
  }
}