import 'package:flutter/material.dart';

import './todo.dart';

class Todos with ChangeNotifier {
  List<Todo> _todos = [
    Todo(
        desc: 'Clean livingroom',
        title: 'Do housework',
        date: '123',
        id: '0',
        isDone: false),
    Todo(
        desc: 'Do ex3',
        title: 'Do homework',
        date: '123',
        id: '1',
        isDone: false),
    Todo(
        desc: 'Hang out with my Friend',
        title: 'Relax',
        date: '123',
        id: '2',
        isDone: true),
  ];

  List<Todo> get todos {
    return [..._todos];
  }

  Todo findByIdTodo(String id) {
    return _todos.firstWhere((todos) => todos.id == id);
  }

  void addTodo(Todo todo) {
    final newTodo = Todo(
      id: _todos.length.toString(),
      desc: todo.desc,
      title: todo.title,
      date: todo.date,
      isDone: todo.isDone,
    );
    _todos.add(newTodo);
    notifyListeners();
  }

  void updateTodo(String id, Todo newTodo) {
    final todoId = _todos.indexWhere((todos) => todos.id == id);
    if (todoId >= 0) {
      _todos[todoId] = newTodo;
      notifyListeners();
    } else {
      print('can\'t find');
    }
  }

  void removeTodo(String id) {
    _todos.removeWhere((todos) => todos.id == id);
    notifyListeners();
  }
}
