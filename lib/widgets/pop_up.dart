import 'package:flutter/material.dart';

Future<String> createAlertDialog(BuildContext context) {
  TextEditingController myController = TextEditingController();

  return showDialog(
    context: context,
    builder: (context) {
      return AlertDialog(
          title: Text('Add a new task'),
          content: TextField(
              decoration: InputDecoration(hintText: 'Enter a task'),
              controller: myController),
          actions: <Widget>[
            RaisedButton(
              elevation: 5,
              child: Text('Submit'),
              onPressed: () {
                Navigator.of(context).pop(myController.text.toString());
              },
            )
          ]);
    },
  );
}
