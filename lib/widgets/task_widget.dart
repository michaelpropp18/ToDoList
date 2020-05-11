import 'package:flutter/material.dart';
import 'package:../to_do/models/task.dart';

class TaskWidget extends StatelessWidget {
  final Task _task;
  final Function _removeTask;
  final Function _upTask;
  final Function _downTask;

  TaskWidget(this._task, this._removeTask, this._upTask, this._downTask);

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
              child: Text(_task.name,
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  overflow: TextOverflow.ellipsis)),
          Container(
            height: 50,
            child: FittedBox(
              child: Column(
                children: <Widget>[
                  IconButton(
                      iconSize: 50,
                      icon: Icon(Icons.arrow_upward),
                      onPressed: () {
                        _upTask(_task.id);
                      }),
                  IconButton(
                      iconSize: 50,
                      icon: Icon(Icons.arrow_downward),
                      onPressed: () {
                        _downTask(_task.id);
                      }),
                ],
              ),
            ),
          ),
          IconButton(
              iconSize: 30,
              icon: Icon(Icons.delete),
              onPressed: () {
                _removeTask(_task.id);
              }),
        ],
      ),
    );
  }
}
