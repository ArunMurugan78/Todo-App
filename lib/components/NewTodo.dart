import 'package:flutter/material.dart';

class NewTodo extends StatefulWidget {
  @override
  _NewTodoState createState() => _NewTodoState();
}

class _NewTodoState extends State<NewTodo> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Padding(
          padding: EdgeInsets.all(8.0),
          child: TextField(decoration: InputDecoration(labelText: "Add Todo"),),
        )
      ],
    );
  }
}