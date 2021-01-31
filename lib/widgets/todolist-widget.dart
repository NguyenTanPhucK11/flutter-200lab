import 'package:demo/providers/todo.dart';
import 'package:demo/providers/todos.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class TodoListView extends StatefulWidget {
  @override
  _TodoListViewState createState() => _TodoListViewState();
  final String filter;
  TodoListView({Key key, @required this.filter}) : super(key: key);
}

class _TodoListViewState extends State<TodoListView> {
  @override
  Widget build(BuildContext context) {
    final _todos = Provider.of<Todos>(context, listen: false).todos;
    return ListView.builder(
      padding: const EdgeInsets.all(8),
      itemCount: _todos.length,
      itemBuilder: (BuildContext context, int index) {
        final _item = _todos[index];
        return widget.filter == 'All'
            ? listTileTodo(_todos, index)
            : (widget.filter == 'Done'
                ? (_item.isDone ? listTileTodo(_todos, index) : Container())
                : !_item.isDone
                    ? listTileTodo(_todos, index)
                    : Container());
      },
    );
  }

  Widget listTileTodo(_todos, index) {
    return Dismissible(
      key: Key(_todos[index].id),
      onDismissed: (direction) {
        setState(() {
          Provider.of<Todos>(context, listen: false)
              .removeTodo(_todos[index].id);
        });
        Scaffold.of(context).showSnackBar(
            SnackBar(content: Text("Deleted todo ${_todos[index].title}")));
      },
      background: Container(color: Colors.red),
      child: Card(
        child: ListTile(
          trailing: Icon(
            _todos[index].isDone
                ? Icons.check_box
                : Icons.check_box_outline_blank,
            color: _todos[index].isDone ? Colors.blue : null,
          ),
          title: Text('${_todos[index].title}'),
          subtitle: Text('${_todos[index].desc}'),
          onTap: () {
            setState(() {
              Provider.of<Todos>(context, listen: false).updateTodo(
                  _todos[index].id,
                  Todo(
                    id: _todos[index].id,
                    desc: _todos[index].desc,
                    title: _todos[index].title,
                    date: _todos[index].date,
                    isDone: !_todos[index].isDone,
                  ));
            });
          },
        ),
      ),
    );
  }
}
