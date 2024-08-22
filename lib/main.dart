import 'package:dev_test/src/app.dart';
import 'package:dev_test/src/provider/userProvider.dart';
import 'package:dev_test/src/services/httpOvers.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'dart:io';

void main() {
  HttpOverrides.global = MyHttpOverrides();
  runApp(MultiProvider(
    providers: [
      ChangeNotifierProvider(create: (_) => UserProvider()),
    ],
    child: const MyApp(),
  ));
}
