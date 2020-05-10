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
          rank: (taskList.length + 1)));
    });
  }

  void removeTask(String id) {
    setState(() {
      taskList.removeWhere((t) {
        return t.id == id;
      });
    });
  }

  void orderTasks() {
    setState(() {
      taskList.sort((a, b) => a.rank.compareTo(b.rank));
    });
  }

  void upTask(String id) {
    Task upTask;
    Task previousTask;
    for (Task t in taskList) {
      if (t.id == id) {
        upTask = t;
      }
    }
    for (Task t in taskList) {
      if (t.rank < upTask.rank) {
        if (previousTask == null) {
          previousTask = t;
        } else if (t.rank > previousTask.rank) {
          previousTask = t;
        }
      }
    }
    if (previousTask == null) {
      return;
    }
    int storage = previousTask.rank;
    previousTask.rank = upTask.rank;
    upTask.rank = storage;
    orderTasks();
  }

  void downTask(String id) {
    Task downTask;
    Task nextTask;
    for (Task t in taskList) {
      if (t.id == id) {
        downTask = t;
      }
    }
    for (Task t in taskList) {
      if (t.rank > downTask.rank) {
        if (nextTask == null) {
          nextTask = t;
        } else if (t.rank < nextTask.rank) {
          nextTask = t;
        }
      }
    }
    if (nextTask == null) {
      return;
    }
    int storage = nextTask.rank;
    nextTask.rank = downTask.rank;
    downTask.rank = storage;
    orderTasks();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'To-Do List',
        home: Scaffold(
            appBar: AppBar(title: Text('To-Do List')),
            body: TaskList(taskList, removeTask, upTask, downTask),
            floatingActionButton: FloatingActionButton(
              child: Icon(Icons.add),
              onPressed: addTask,
            )));
  }
}
