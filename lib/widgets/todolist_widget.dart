import 'package:demo/providers/todo.dart';
import 'package:demo/providers/todos.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class TodoListView extends StatefulWidget {
  final String filter;
  TodoListView({Key key, @required this.filter}) : super(key: key);

  @override
  _TodoListViewState createState() => _TodoListViewState();
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
        if (widget.filter == 'All' ||
            widget.filter == 'Done' && _item.isDone ||
            widget.filter == 'Pending' && !_item.isDone)
          return listTileTodo(_todos, index);

        return const SizedBox();
      },
    );
  }

  Widget listTileTodo(_todos, index) {
    final _todoIndex = _todos[index];
    return Dismissible(
      key: Key(_todoIndex.id),
      onDismissed: (direction) {
        setState(() {
          Provider.of<Todos>(context, listen: false).removeTodo(_todoIndex.id);
        });
        Scaffold.of(context).showSnackBar(
            SnackBar(content: Text("Deleted todo ${_todoIndex.title}")));
      },
      background: Container(color: Colors.red),
      child: Card(
        child: ListTile(
          trailing: Icon(
            _todoIndex.isDone ? Icons.check_box : Icons.check_box_outline_blank,
            color: _todoIndex.isDone ? Colors.blue : null,
          ),
          title: Text('${_todoIndex.title}'),
          subtitle: Text('${_todoIndex.desc}'),
          onTap: () {
            setState(() {
              Provider.of<Todos>(context, listen: false).updateTodo(
                  _todoIndex.id,
                  Todo(
                    id: _todoIndex.id,
                    desc: _todoIndex.desc,
                    title: _todoIndex.title,
                    date: _todoIndex.date,
                    isDone: !_todoIndex.isDone,
                  ));
            });
          },
        ),
      ),
    );
  }
}
