import 'package:flutter/material.dart';
import 'package:json_api/API/second.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(

      home: UserList(),
    );
  }
}

