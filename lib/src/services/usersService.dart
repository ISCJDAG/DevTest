import 'dart:convert';

import 'package:dev_test/src/models/users.dart';
import 'package:dev_test/src/services/api.dart';
import 'package:http/http.dart' as http;

class UsersService {
  Api api = Api();

//get Users
  getUsers() async {
    late List users = [];
    try {
      final res = await http
          .get(Uri.parse(api.basePath + api.getUsers), headers: api.header)
          .timeout(const Duration(minutes: 5));
      if (res.statusCode == 200) {
        List mapdata = json.decode(res.body);
        print(mapdata);
        // var dataJson = jsonDecode(mapdata);
        users = mapdata.map((e) => Users.fromJson(e)).toList();
      } else {
        print('Error Occurred');
      }
    } catch (e) {
      print('Error Occurred' + e.toString());
    }

    return users;
  }

  //create USers
  create(Map<String, dynamic> body) async {
    late int msg = 0;
    try {
      final res = await http
          .post(Uri.parse(api.basePath + api.storeUser),
              headers: api.header, body: json.encode(body))
          .timeout(const Duration(minutes: 1));
      if (res.statusCode == 200) {
        var mapData = json.decode(res.body);
        if (mapData['msg'] == 'success') {
          msg = 1;
        } else {
          print('Error Occurred');
        }
      } else {
        print('Error Occurred');
      }
    } catch (e) {
      print('Error Occurred: ' + e.toString());
    }
    return msg;
  }
  //read  User
  //update Users
  //delete Users
}
