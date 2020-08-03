import 'dart:async';

import 'package:flutter/material.dart';
import '../models/todo.model.dart';

import 'package:intl/intl.dart';

class RenderTodos extends StatefulWidget {
  RenderTodos({this.todos, this.handleDone});

  final List<TodoModel> todos;

  final Function handleDone;

  @override
  _RenderTodosState createState() =>
      _RenderTodosState(handleDone: this.handleDone);
}

class _RenderTodosState extends State<RenderTodos> {
  double _height = 70;

  TodoModel done;

  final Function handleDone;

  _RenderTodosState({this.handleDone});

  handledonelocal(TodoModel e) {
    setState(() {
      done = e;

      Timer(Duration(seconds: 1), () => this.handleDone(e));
    });
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: <Widget>[
          ...this
              .widget
              .todos
              .map((TodoModel e) => AnimatedContainer(
                    height: e == done ? 0 : _height,
                    duration: Duration(milliseconds: 250),
                    child: done == e
                        ? Container(
                            child: Card(
                              child: Text(""),
                            ),
                            height: _height,
                            width: double.maxFinite,
                            padding: EdgeInsets.all(1),
                          )
                        : Container(
                            child: GestureDetector(
                              onDoubleTap: () => {handledonelocal(e)},
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
                                          fontWeight: FontWeight.bold,
                                          fontSize: 20),
                                    ),
                                    Text(
                                      DateFormat.yMMMEd().format(e.date),
                                      style: TextStyle(
                                          fontWeight: FontWeight.w100),
                                    )
                                  ],
                                ),
                              )),
                            ),
                            width: double.maxFinite,
                            padding: EdgeInsets.all(1),
                          ),
                  ))
              .toList()
        ],
      ),
    );
  }
}
