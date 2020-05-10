import 'package:flutter/material.dart';

import './widgets/task_list.dart';
import 'models/task.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final List<Task> taskList = [];
  void addTask() {
    setState(() {
      taskList.add(Task(
          id: DateTime.now().toString(),
          name: 'Task ${taskList.length + 1}',
          rank: taskList.length + 1));
    });
  }
  void removeTask(String id) {
    setState(() {
      taskList.removeWhere((t) {
        return t.id == id;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'To-Do List',
        home: Scaffold(
            appBar: AppBar(title: Text('To-Do List')),
            body: TaskList(taskList, removeTask),
            floatingActionButton: FloatingActionButton(
              child: Icon(Icons.add),
              onPressed: addTask,
            )));
  }
}
