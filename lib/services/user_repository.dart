// @dart=2.9
import 'package:flutter_application_2/models/user.dart';
import 'package:flutter_application_2/services/user_api_provider.dart';

class UsersRepository {
  UserProvider _usersProvider = UserProvider();
  Future<List<User>> getAllUsers() => _usersProvider.getUser();
}