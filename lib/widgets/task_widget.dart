import 'package:flutter/material.dart';
import 'package:../to_do/models/task.dart';

class TaskWidget extends StatelessWidget {
  final Task task;
  final Function removeTask;
  final Function upTask;
  final Function downTask;

  TaskWidget(this.task, this.removeTask, this.upTask, this.downTask);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: <Widget>[
        Text(task.name),
        IconButton(
            icon: Icon(Icons.arrow_upward),
            onPressed: () {
              upTask(task.id);
            }),
        IconButton(
            icon: Icon(Icons.arrow_downward),
            onPressed: () {
              downTask(task.id);
            }),
        IconButton(
            icon: Icon(Icons.delete),
            onPressed: () {
              removeTask(task.id);
            }),
      ],
    );
  }
}
