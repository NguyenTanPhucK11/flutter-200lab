import 'package:demo/screens/Day1/convertFToC.dart';
import 'package:demo/screens/Day1/ex2_screen.dart';
import 'package:demo/screens/Day2/todo.dart';
import 'package:demo/screens/Day3/profile_screen.dart';
import 'package:flutter/material.dart';

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
      body: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: <Widget>[
          RaisedButton(
            onPressed: () => Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => Exercise1(),
                )),
            child: Text('Ex'),
          ),
          RaisedButton(
            onPressed: () => Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => Exercise2(),
                )),
            child: Text('Ex2'),
          ),
          RaisedButton(
            onPressed: () => Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => TodoList(),
                )),
            child: Text('Ex3'),
          ),
          RaisedButton(
            onPressed: () => Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => Profile(),
                )),
            child: Text('Ex4'),
          ),
        ],
      ),
    );
  }
}
