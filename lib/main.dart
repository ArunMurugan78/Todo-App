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
      if (e == null) {
        return null;
      }
      print(e.date);
      m['title'] = e.title;
      m['date'] = e.date.toString();
      m['type'] = e.type;

      return m;
    }).toList();
  }

  _saveToStorage() {
    storage.setItem('todos', toJSONEncodable());
  }

  _clearStorage() async {
    await storage.clear();

    setState(() {
      this.todos = [];
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Todo'),
      ),
      body: Container(
        constraints: BoxConstraints.expand(),
        child: FutureBuilder(
            future: storage.ready,
            builder: (BuildContext context, AsyncSnapshot snapshot) {
              if (snapshot.data == null) {
                return Center(
                  child: CircularProgressIndicator(),
                );
              } else {
                if (initialised == false) {
                 
                  var todosRestored = storage.getItem('todos');
               
                  if (todosRestored != null) {
                    print("USING SAVED DATA");

                    // setState(() {
                    this.todos = List<TodoModel>.from(
                      (todosRestored as List).map((e) {
                        print({"E", e});
                        return new TodoModel(
                          title: e['title'],
                          date: DateTime.parse(e['date']),
                        );
                      }),
                    );
                    //});
                  }

                  initialised = true;
                }

                return RenderTodos(
                    todos: this.todos,
                    handleDone: (TodoModel e) {
                      if (e != null) {
                        print({"Removing", e.title});
                        setState(() {
                          this.todos.remove(e);
                          _saveToStorage();
                        });
                      } else {
                        print("Error!");
                      }
                    });
              }
            }),
      ),
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
                        print({t.title, t.date});
                        setState(() {
                          todos.add(t);
                        });
                        _saveToStorage();
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
