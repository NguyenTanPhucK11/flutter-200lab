import 'package:flutter/material.dart';

class TodoListView extends StatefulWidget {
  @override
  _TodoListViewState createState() => _TodoListViewState();
  final int filter;
  TodoListView({Key key, @required this.filter}) : super(key: key);
}

class _TodoListViewState extends State<TodoListView> {
  final _items = List<String>.generate(9, (index) => '${index + 1}');
  final _listCheckDone = List<bool>.generate(9, (index) => false);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      padding: const EdgeInsets.all(8),
      itemCount: _items.length,
      itemBuilder: (BuildContext context, int index) {
        final _item = _items[index];
        return widget.filter == 0
            ? dismissible(_item, index)
            : (widget.filter == 1
                ? (_listCheckDone[index]
                    ? dismissible(_item, index)
                    : Container())
                : !_listCheckDone[index]
                    ? dismissible(_item, index)
                    : Container());
      },
    );
  }

  Widget dismissible(_item, index) {
    return Dismissible(
      key: Key(_item),
      onDismissed: (direction) {
        setState(() {
          _items.removeAt(index);
          _listCheckDone.removeAt(index);
        });
      },
      background: Container(
        color: Colors.red,
        child: Icon(Icons.delete),
      ),
      child: ListTile(
        trailing: Icon(
          _listCheckDone[index]
              ? Icons.check_box
              : Icons.check_box_outline_blank,
          color: _listCheckDone[index] ? Colors.blue : null,
        ),
        title: Text('Title $_item'),
        subtitle: Text('description $_item'),
        onTap: () {
          setState(() {
            _listCheckDone[index] = !_listCheckDone[index];
          });
        },
      ),
    );
  }
}
