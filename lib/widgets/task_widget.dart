import 'package:flutter/material.dart';
import 'package:../to_do/models/task.dart';

class TaskWidget extends StatelessWidget {
  final Task task;

  TaskWidget(this.task);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: <Widget>[
        Text(task.name),
        Icon(Icons.arrow_upward),
        Icon(Icons.arrow_downward),
        Icon(Icons.delete),
      ],
    );
  }
}
