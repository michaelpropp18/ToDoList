import 'package:flutter/material.dart';
import 'package:to_do/models/task.dart';
import 'package:to_do/widgets/task_widget.dart';

class TaskList extends StatelessWidget {
  final List<Task> _taskList;
  final Function _removeTask;
  final Function _upTask;
  final Function _downTask;

  TaskList(this._taskList, this._removeTask, this._upTask, this._downTask);

  @override
  Widget build(BuildContext context) {
    return Container(
        child: SingleChildScrollView(
      child: Column(
        children: _taskList.map((t) {
          return TaskWidget(t, _removeTask, _upTask, _downTask);
        }).toList(),
      ),
    ));
  }
}
