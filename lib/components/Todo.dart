import 'package:flutter/material.dart';
import '../models/todo.model.dart';
import '../models/Type.dart';
import 'package:intl/intl.dart';

class Todo extends StatefulWidget {
  @override
  _TodoState createState() => _TodoState();
}

class _TodoState extends State<Todo> {
  Offset offset = Offset(0, 0);

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

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: <Widget>[
          ...this
              .todos
              .map((e) => Container(
                  child: GestureDetector(
                    onHorizontalDragUpdate: (details) {
                      print(this.offset);
                      setState(() {
                        offset = details.localPosition;
                      });
                    },
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
                  width: double.infinity,
                  padding: EdgeInsets.all(1)))
              .toList()
        ],
      ),
    );
  }
}
