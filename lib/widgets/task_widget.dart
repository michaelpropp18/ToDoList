import 'package:flutter/material.dart';
import 'package:../to_do/models/task.dart';

class TaskWidget extends StatelessWidget {
  final Task task;
  final Function removeTask;

  TaskWidget(this.task, this.removeTask);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: <Widget>[
        Text(task.name),
        Icon(Icons.arrow_upward),
        Icon(Icons.arrow_downward),
        IconButton(
            icon: Icon(Icons.delete),
            onPressed: () {
              removeTask(task.id);
            }),
      ],
    );
  }
}
