import 'package:flutter/material.dart';

import './task_list.dart';
import '../models/task.dart';
import './pop_up.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final List<Task> taskList = [];
  int rank = 0;
  void addTask(String name) {
    setState(() {
      taskList.add(Task(
          id: DateTime.now().toString(),
          name: name,
          rank: rank++));
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
    return Scaffold(
      appBar: AppBar(title: Text('To-Do List')),
      body: TaskList(taskList, removeTask, upTask, downTask),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () {
          createAlertDialog(context).then((name) {
            if (name != null && name.length > 0) {
              addTask(name);
            }
          });
        },
      ),
    );
  }
}
