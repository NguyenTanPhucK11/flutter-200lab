import 'package:demo/providers/todo.dart';
import 'package:demo/providers/todos.dart';
import 'package:demo/screens/Day2/todo.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class AddTodo extends StatefulWidget {
  @override
  _AddTodoState createState() => _AddTodoState();
}

class _AddTodoState extends State<AddTodo> {
  var _titleController = TextEditingController();
  var _descController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('New Todo'),
      ),
      body: _buildBody(),
    );
  }

  Widget _buildBody() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        _textInput('Title', 'Title', _titleController),
        _textInput('Description', 'Description', _descController),
        RaisedButton(
          color: Colors.orangeAccent,
          child: Text('Done'),
          onPressed: () {
            if (_titleController.text != '' && _descController.text != '') {
              Provider.of<Todos>(context, listen: false).addTodo(
                Todo(
                  desc: _descController.text,
                  title: _titleController.text,
                  date: 'null',
                  id: Provider.of<Todos>(context, listen: false)
                      .todos
                      .length
                      .toString(),
                  isDone: false,
                ),
              );
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) => TodoList(),
                ),
              );
            }
          },
        )
      ],
    );
  }

  Widget _textInput(String _title, String _desc, TextEditingController _input) {
    return Center(
      child: Container(
        width: MediaQuery.of(context).size.width * 0.8,
        child: TextField(
          decoration: InputDecoration(
            hintText: _title,
            labelText: _desc,
          ),
          controller: _input,
        ),
      ),
    );
  }
}
