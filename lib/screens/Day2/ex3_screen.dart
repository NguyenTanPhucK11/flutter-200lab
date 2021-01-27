import 'package:demo/widgets/todolist-widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class TodoList extends StatefulWidget {
  @override
  _TodoListState createState() => _TodoListState();
}

class _TodoListState extends State<TodoList> {
  int filter = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _buildAppBar(),
      body: Column(
        children: [
          Container(
            padding: const EdgeInsets.all(10),
            width: 400,
            child: CupertinoSlidingSegmentedControl(
                groupValue: filter,
                backgroundColor:
                    filter == 2 ? Colors.red.shade200 : Colors.blue.shade200,
                children: const <int, Widget>{
                  0: Text('All'),
                  1: Text('Done'),
                  2: Text('Pending'),
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
      ),
    );
  }

  Widget _buildAppBar() {
    return AppBar(
      title: Text('Todo List'),
      actions: [
        Container(
          padding: const EdgeInsets.only(right: 12),
          child: IconButton(
            icon: Icon(Icons.add),
            onPressed: () {
              setState(() {});
            },
          ),
        ),
      ],
    );
  }
}
