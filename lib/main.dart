import 'package:flutter/material.dart';

import './widgets/task_list.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'To-Do List',
        home: Scaffold(
            appBar: AppBar(title: Text('To-Do List')),
            body: TaskList(),
            floatingActionButton: FloatingActionButton(
              child: Icon(Icons.add),
              onPressed: () {},
            )));
  }
}
