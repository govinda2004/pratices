import 'package:flutter/material.dart';
import 'package:login/Form.dart';
import 'package:login/list.dart';
import 'package:login/list_api.dart';
import 'package:login/login.dart';

import 'downlode.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        initialRoute: 'loginPage',
        routes: {

          'Registration': (context) => MyScreen(),
          'list': (context) => ghl(),
        },
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(

        primarySwatch: Colors.indigo,
      ),
      home:  MyScreen(),
    );
  }
}


