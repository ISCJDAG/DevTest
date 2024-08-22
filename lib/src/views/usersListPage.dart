import 'package:dev_test/src/models/users.dart';
import 'package:dev_test/src/provider/userProvider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class UsersListPage extends StatefulWidget {
  @override
  State<UsersListPage> createState() => _UsersListPageState();
}

class _UsersListPageState extends State<UsersListPage> {
  late double? w, h;

  @override
  void initState() {
    Provider.of<UserProvider>(context, listen: false).getUsers();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    w = MediaQuery.of(context).size.width;
    h = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: AppBar(title: const Text('Users List Test')),
      body: Container(
        width: w,
        height: h,
        decoration: BoxDecoration(
          color: Colors.deepOrange[200],
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              width: w! * 0.85,
              height: h! * 0.75,
              decoration: const BoxDecoration(
                color: Colors.white,
              ),
              child: SingleChildScrollView(
                scrollDirection: Axis.vertical,
                child: _conteneList(context),
              ),
            )
            //buton register
          ],
        ),
      ),
      floatingActionButton: _buttonAddUser(),
    );
  }

  _conteneList(BuildContext context) {
    return Consumer<UserProvider>(
      builder: (context, value, child) {
        if (value.loading == true) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        } else {
          if (value.users.isNotEmpty) {
            return _listUsers(value.users);
          } else {
            return const Center(
              child: Text('No users to show'),
            );
          }
        }
      },
    );
  }

  _listUsers(List<Users> users) {
    return ListView.builder(
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        itemCount: users.length,
        itemBuilder: (context, item) {
          return ListTile(
            title: Text('${users[item].id} .- ${users[item].name}'),
            subtitle: Text(users[item].email),
          );
        });
  }

  _buttonAddUser() {
    return FloatingActionButton(
      onPressed: () {
        //code to move to add user.
      },
      elevation: 3,
      child: const Icon(
        Icons.add,
        size: 30,
      ),
    );
  }

//END CLASS
}
