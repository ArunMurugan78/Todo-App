import 'package:flutter/material.dart';

class NewTodo extends StatefulWidget {
  final Function handleSubmit;
  NewTodo({this.handleSubmit});
  @override
  _NewTodoState createState() => _NewTodoState(handleSubmit: this.handleSubmit);
}

class _NewTodoState extends State<NewTodo> {
  final Function handleSubmit;
  _NewTodoState({this.handleSubmit});

  final _controller = TextEditingController(text: '');

  @override
  void dispose() {
    // Clean up the controller when the widget is removed from the
    // widget tree.
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Padding(
            padding: EdgeInsets.fromLTRB(10, 20, 10, 0),
            child: TextField(
              controller: _controller,
              onEditingComplete: () =>
                  this.handleSubmit(title: _controller.text),
              decoration: InputDecoration(
                  labelText: "Add Todo", border: OutlineInputBorder()),
              textCapitalization: TextCapitalization.characters,
            ),
          ),
          Container(
            margin: EdgeInsets.all(30),
            child: ButtonTheme(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(Radius.circular(30))),
              child: RaisedButton(
                disabledColor: Color.fromARGB(255, 240, 240, 240),
                onPressed: _controller.text.toString().trim() != ""
                    ? (() => this.handleSubmit(title: _controller.text))
                    : null,
                child: Container(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    mainAxisSize: MainAxisSize.min,
                    children: <Widget>[
                      Icon(Icons.add),
                      Text(
                        'Add',
                      ),
                    ],
                  ),
                  padding: EdgeInsets.all(15),
                ),
                color: Colors.amber,
              ),
            ),
          )
        ],
      ),
    );
  }
}
