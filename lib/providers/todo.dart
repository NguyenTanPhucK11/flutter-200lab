import 'package:flutter/foundation.dart';

class Todo {
  final String desc;
  final String title;
  final String date;
  final String id;
  final bool isDone;

  Todo({
    @required this.desc,
    @required this.title,
    @required this.date,
    @required this.id,
    @required this.isDone,
  });
}
