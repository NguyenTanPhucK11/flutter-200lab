import 'package:demo/exercise_screen.dart';
import 'package:demo/providers/profiles.dart';
import 'package:demo/screens/Day2/todo.dart';
import 'package:demo/theme/theme.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import './providers/todos.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider.value(
          value: Todos(),
        ),
        ChangeNotifierProvider.value(
          value: ThemeChanger(ThemeData.dark()),
        ),
        ChangeNotifierProvider.value(
          value: Profiles(),
        ),
      ],
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: TodoList(),
      ),
    );
  }
}
