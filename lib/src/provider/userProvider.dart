import 'package:dev_test/src/models/users.dart';
import 'package:dev_test/src/services/usersService.dart';
import 'package:flutter/material.dart';

class UserProvider extends ChangeNotifier {
  late List<Users> users;
  bool loading = false;
  UsersService usersService = UsersService();

  getUsers() async {
    loading = true;
    users = await usersService.getUsers();
    loading = false;
    notifyListeners();
  }
}
