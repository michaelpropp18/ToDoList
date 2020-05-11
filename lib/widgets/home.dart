import 'package:flutter/material.dart';

import './task_list.dart';
import '../models/task.dart';
import './pop_up.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final List<Task> _taskList = [];
  int _rank = 0;
  void _addTask(String name) {
    setState(() {
      _taskList.add(Task(
          id: DateTime.now().toString(),
          name: name,
          rank: _rank++));
    });
  }

  void _removeTask(String id) {
    setState(() {
      _taskList.removeWhere((t) {
        return t.id == id;
      });
    });
  }

  void _orderTasks() {
    setState(() {
      _taskList.sort((a, b) => a.rank.compareTo(b.rank));
    });
  }

  void _upTask(String id) {
    Task _upTask;
    Task _previousTask;
    for (Task t in _taskList) {
      if (t.id == id) {
        _upTask = t;
      }
    }
    for (Task t in _taskList) {
      if (t.rank < _upTask.rank) {
        if (_previousTask == null) {
          _previousTask = t;
        } else if (t.rank > _previousTask.rank) {
          _previousTask = t;
        }
      }
    }
    if (_previousTask == null) {
      return;
    }
    int _storage = _previousTask.rank;
    _previousTask.rank = _upTask.rank;
    _upTask.rank = _storage;
    _orderTasks();
  }

  void _downTask(String id) {
    Task _downTask;
    Task _nextTask;
    for (Task t in _taskList) {
      if (t.id == id) {
        _downTask = t;
      }
    }
    for (Task t in _taskList) {
      if (t.rank > _downTask.rank) {
        if (_nextTask == null) {
          _nextTask = t;
        } else if (t.rank < _nextTask.rank) {
          _nextTask = t;
        }
      }
    }
    if (_nextTask == null) {
      return;
    }
    int _storage = _nextTask.rank;
    _nextTask.rank = _downTask.rank;
    _downTask.rank = _storage;
    _orderTasks();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('To-Do List')),
      body: TaskList(_taskList, _removeTask, _upTask, _downTask),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () {
          createAlertDialog(context).then((name) {
            if (name != null && name.length > 0) {
              _addTask(name);
            }
          });
        },
      ),
    );
  }
}
