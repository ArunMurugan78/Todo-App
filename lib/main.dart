import 'package:Todo/components/Todo.dart';
import 'package:flutter/material.dart';
import 'package:localstorage/localstorage.dart';
import './components/Todo.dart';
import './components/NewTodo.dart';
import './models/todo.model.dart';

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
  final storage = new LocalStorage('data.json');

  bool initialised = false;

  List<TodoModel> todos = [];

  toJSONEncodable() {
    return this.todos.map((TodoModel e) {
      Map<String, dynamic> m = new Map();
      print(e.date);
      m['title'] = e.title;
      m['date'] = e.date.toString();
      m['type'] = e.type;
    }).toList();
  }

  _saveToStorage() {
    storage.setItem('todos', toJSONEncodable());
  }

  @override
  Widget build(BuildContext context) {
    if (initialised == false) {
      var todos = storage.getItem('todos');

      print(todos);

      if (todos != null) {
        this.todos = todos.map((e) {
          return new TodoModel(
              title: e.title, date: new DateTime(e.date), type: e.type);
        }).toList();
      }

      //initialised = true;
    }
    return Scaffold(
      appBar: AppBar(
        title: Text('Todo'),
      ),
      body: RenderTodos(
          todos: todos,
          handleDone: (TodoModel e) {
            setState(() {
              todos = todos.map((el) {
                if (e == el) {
                  return null;
                } else {
                  return el;
                }
              }).toList();
            });
            _saveToStorage();
          }),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          showModalBottomSheet<void>(
            context: context,
            builder: (BuildContext context) {
              return Container(
                color: Color.fromARGB(140, 0, 0, 0),
                child: Container(
                  height: 600,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(10),
                          topRight: Radius.circular(10)),
                      color: Colors.white),
                  child: NewTodo(
                    handleSubmit: ({String title}) {
                      print({title});
                      if (title.trim() != "") {
                        var t = new TodoModel(title: title);
                        print({t.title,t.date});
                        setState(() {
                         todos.add(t);
                        });
                        //   // _saveToStorage();
                        Navigator.pop(context);
                      }
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
