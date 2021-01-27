import 'package:flutter/foundation.dart';

class Todo {
  final String desc;
  final String title;
  final String date;
  final int id;

  Todo({
    @required this.desc,
    @required this.title,
    @required this.date,
    @required this.id,
  });
}
