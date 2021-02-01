import 'package:demo/screens/Day2/add_todo_screen.dart';
import 'package:demo/theme/theme.dart';
import 'package:demo/widgets/todolist_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class TodoList extends StatefulWidget {
  @override
  _TodoListState createState() => _TodoListState();
}

class _TodoListState extends State<TodoList> {
  String filter = 'All';
  bool _isLight = false;

  @override
  Widget build(BuildContext context) {
    ThemeData _lightTheme =
        Provider.of<ThemeChanger>(context, listen: false).getLightTheme();
    ThemeData _darkTheme =
        Provider.of<ThemeChanger>(context, listen: false).getDarkTheme();
    return MaterialApp(
      theme: _isLight ? _lightTheme : _darkTheme,
      home: Scaffold(
        appBar: _buildAppBar(),
        body: _buildBody(),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => AddTodo()),
            );
          },
          child: Icon(Icons.add),
        ),
      ),
    );
  }

  Widget _buildBody() {
    return Column(
      children: [
        Container(
          padding: const EdgeInsets.all(10),
          width: 400,
          child: CupertinoSlidingSegmentedControl(
              groupValue: filter,
              backgroundColor: filter == 'Pending'
                  ? Colors.red.shade200
                  : Colors.blue.shade200,
              children: const <String, Widget>{
                'All': Text('All'),
                'Done': Text('Done'),
                'Pending': Text('Pending'),
              },
              onValueChanged: (value) {
                setState(() {
                  filter = value;
                });
              }),
        ),
        Container(
          width: MediaQuery.of(context).size.width * 1,
          height: MediaQuery.of(context).size.height * 0.8,
          child: TodoListView(
            filter: filter,
          ),
        ),
      ],
    );
  }

  Widget _buildAppBar() {
    return AppBar(
      title: Text('Todo List'),
      leading: Center(
        child: Switch(
          value: _isLight,
          onChanged: (value) {
            setState(() {
              _isLight = value;
            });
          },
        ),
      ),
    );
  }
}
