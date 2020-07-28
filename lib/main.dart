import 'package:Todo/components/Todo.dart';
import 'package:flutter/material.dart';
import './components/Todo.dart';

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
        onPressed: () {},
        child: Icon(Icons.add),
      ),
    );
  }
}
