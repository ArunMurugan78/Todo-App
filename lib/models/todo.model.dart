import 'Type.dart';

class TodoModel {
  String title;
  DateTime date;
  Type type;

  TodoModel({this.title, this.type, this.date}) {
    if (this.date == null) {
      this.date = new DateTime.now();
    }
  }
}
