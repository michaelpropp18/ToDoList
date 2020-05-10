import 'package:flutter/material.dart';
import 'package:to_do/models/task.dart';
import 'package:to_do/widgets/task_widget.dart';

class TaskList extends StatelessWidget {
  final List<Task> taskList;
  final Function removeTask;
  final Function upTask;
  final Function downTask;

  TaskList(this.taskList, this.removeTask, this.upTask, this.downTask);

  @override
  Widget build(BuildContext context) {
    return Container(
        child: SingleChildScrollView(
      child: Column(
        children: taskList.map((t) {
          return TaskWidget(t, removeTask, upTask, downTask);
        }).toList(),
      ),
    ));
  }
}
