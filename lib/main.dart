import 'package:flutter/material.dart';

import './widgets/home.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'To-Do List',
        home: Home(),
        theme: ThemeData(primarySwatch: Colors.deepOrange));
  }
}
