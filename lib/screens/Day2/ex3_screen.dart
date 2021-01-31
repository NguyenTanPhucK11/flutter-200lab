import 'package:demo/providers/todo.dart';
import 'package:demo/providers/todos.dart';
import 'package:demo/screens/Day2/add_todo_screen.dart';
import 'package:demo/widgets/todolist-widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class TodoList extends StatefulWidget {
  @override
  _TodoListState createState() => _TodoListState();
}

class _TodoListState extends State<TodoList> {
  String filter = 'All';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
    final _lengthTodos =
        Provider.of<Todos>(context, listen: false).todos.length.toString();
    return AppBar(
      title: Text('Todo List'),
      actions: [
        Container(
          padding: const EdgeInsets.only(right: 12),
          child: IconButton(
            icon: Icon(Icons.add),
            onPressed: () {
              setState(() {
                Provider.of<Todos>(context, listen: false).addTodo(Todo(
                    desc: _lengthTodos,
                    title: _lengthTodos,
                    date: _lengthTodos,
                    id: _lengthTodos.toString(),
                    isDone: true));
              });
            },
          ),
        ),
      ],
    );
  }
}
