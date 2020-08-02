import 'package:Todo/components/Todo.dart';
import 'package:flutter/material.dart';
import './components/Todo.dart';
import './components/NewTodo.dart';

void main() {
  runApp(RootApp());
}

class RootApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: MainApp(),
      theme: ThemeData(primarySwatch: Colors.red),
    );
  }
}

class MainApp extends StatefulWidget {
  @override
  _MainState createState() => _MainState();
}

class _MainState extends State<MainApp> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Todo'),
      ),
      body: Todo(),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          showModalBottomSheet<void>(
            context: context,
            builder: (BuildContext context) {
              return Container(
                color:Color.fromARGB(140, 0, 0, 0),
                  child: Container(

                  height: 600,
                decoration: BoxDecoration(borderRadius: BorderRadius.only(topLeft: Radius.circular(10),topRight: Radius.circular(10)),color: Colors.white),
                  child: NewTodo(
                    handleSubmit: () {
                      setState(() {

                      });
                    },
                  ),
                ),
              );
            },
          );
        },
        child: Icon(Icons.add),
      ),
    );
  }
}
