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
    return Card(
      elevation: 5,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Container(
              padding: EdgeInsets.fromLTRB(10, 0, 0, 0),
              width: MediaQuery.of(context).size.width - 100,
              child: Text(task.name, overflow: TextOverflow.ellipsis)),
          Container(
            height: 50,
            child: FittedBox(
              child: Column(
                children: <Widget>[
                  IconButton(
                      iconSize: 50,
                      icon: Icon(Icons.arrow_upward),
                      onPressed: () {
                        upTask(task.id);
                      }),
                  IconButton(
                      iconSize: 50,
                      icon: Icon(Icons.arrow_downward),
                      onPressed: () {
                        downTask(task.id);
                      }),
                ],
              ),
            ),
          ),
          IconButton(
              iconSize: 30,
              icon: Icon(Icons.delete),
              onPressed: () {
                removeTask(task.id);
              }),
        ],
      ),
    );
  }
}
