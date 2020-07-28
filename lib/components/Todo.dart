import 'package:flutter/material.dart';
import '../models/todo.model.dart';
import '../models/Type.dart';
import 'package:intl/intl.dart';

class Todo extends StatefulWidget {
  @override
  _TodoState createState() => _TodoState();
}

class _TodoState extends State<Todo> {
  List<TodoModel> todos = [
    TodoModel(title: "CODE", type: Type.NOT_IMPORTANT),
    TodoModel(title: "SLEEP", type: Type.NOT_IMPORTANT),
    TodoModel(title: "EAT", type: Type.NOT_IMPORTANT),
    TodoModel(title: "GO SOMEWHERE", type: Type.NOT_IMPORTANT),
    TodoModel(title: "EAT", type: Type.NOT_IMPORTANT),
    TodoModel(title: "GO TO GYM", type: Type.NOT_IMPORTANT),
    TodoModel(title: "STUDY", type: Type.NOT_IMPORTANT),
    TodoModel(title: "LEARN", type: Type.NOT_IMPORTANT),
    TodoModel(title: "SLEEP", type: Type.NOT_IMPORTANT),
    TodoModel(title: "GYM", type: Type.NOT_IMPORTANT),
    TodoModel(title: "PLAY", type: Type.NOT_IMPORTANT),
    TodoModel(title: "EAT", type: Type.NOT_IMPORTANT),
    TodoModel(title: "CODE", type: Type.NOT_IMPORTANT),
  ];

  handleDone(TodoModel e) {
    setState(() {
      List<TodoModel> temp = [];
      for (int i = 0; i < todos.length; i++) {
        if (e != todos[i]) {
          temp.add(todos[i]);
        }
      }
      todos = temp;
    });
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: <Widget>[
          ...this
              .todos
              .map((e) => Container(
                    child: GestureDetector(
                      onDoubleTap: () => {handleDone(e)},
                      child: Card(
                          child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Text(
                              e.title,
                              style: TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 20),
                            ),
                            Text(
                              DateFormat.yMMMEd().format(e.date),
                              style: TextStyle(fontWeight: FontWeight.w100),
                            )
                          ],
                        ),
                      )),
                    ),
                    width: double.maxFinite,
                    padding: EdgeInsets.all(1),
                  ))
              .toList()
        ],
      ),
    );
  }
}
