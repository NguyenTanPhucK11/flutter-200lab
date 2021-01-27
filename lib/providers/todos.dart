import 'package:flutter/material.dart';

import './todo.dart';

class Todos with ChangeNotifier {
  List<Todo> _todos = [
    Todo(desc: null, title: null, date: null, id: null),
    Todo(desc: null, title: null, date: null, id: null),
    Todo(desc: null, title: null, date: null, id: null),
  ];

  List<Todo> get todos {
    return [..._todos];
  }

  Todo findByIdTodo(int id) {
    return _todos.firstWhere((todos) => todos.id == id);
  }

  void addTodo(Todo todo) {
    final newTodo = Todo(
      id: _todos.length,
      desc: todo.desc,
      title: todo.title,
      date: todo.date,
    );
    _todos.add(newTodo);
    notifyListeners();
  }
}
