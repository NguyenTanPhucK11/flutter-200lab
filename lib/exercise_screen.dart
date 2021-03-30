import 'package:demo/screens/Day1/convertFToC.dart';
import 'package:demo/screens/Day1/ex2_screen.dart';
import 'package:demo/screens/Day10/bloc.dart';
import 'package:demo/screens/Day2/todo.dart';
import 'package:demo/screens/Day3/profile_screen.dart';
import 'package:flutter/material.dart';

import 'screens/Day5/login-screen.dart';

class Exercise extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ScaffoldAppWithTheme();
  }
}

class ScaffoldAppWithTheme extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Exercise'),
      ),
      body: Wrap(
        alignment: WrapAlignment.start,
        children: <Widget>[
          _buttonDay(Exercise1(), 'Day 1', context),
          _buttonDay(Exercise2(), 'Day 1', context),
          _buttonDay(TodoList(), 'Day 2', context),
          _buttonDay(Profile(), 'Day 3', context),
          _buttonDay(Login(), 'Day 5', context),
          _buttonDay(Bloc(), 'Day 5', context),
        ],
      ),
    );
  }

  _buttonDay(Widget f, String name, BuildContext ctx) {
    return ElevatedButton(
      onPressed: () => Navigator.push(
          ctx,
          MaterialPageRoute(
            builder: (context) => f,
          )),
      child: Text(name),
    );
  }
}
