import 'package:flutter/material.dart';
import 'package:to_do/models/task.dart';
import 'package:to_do/widgets/task_widget.dart';

class TaskList extends StatefulWidget {
  @override
  _TaskListState createState() => _TaskListState();
}

class _TaskListState extends State<TaskList> {
  final List<Task> taskList = [
    Task(id: '1', name: 'Task 1', rank: 1),
    Task(id: '2', name: 'Task 2', rank: 2),
    Task(id: '3', name: 'Task 3', rank: 3),
    Task(id: '4', name: 'Task 4', rank: 4),
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
        child: Column(
      children: taskList.map((t) {
        return TaskWidget(t);
      }).toList(),
    ));
  }
}
