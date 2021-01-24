import 'package:demo/screens/Day1/exercise1.dart';
import 'package:demo/screens/Day1/exercise2.dart';
import 'package:flutter/material.dart';

class Exercise extends StatelessWidget {
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
            child: Text('Ex1'),
          ),
          RaisedButton(
            onPressed: () => Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => Exercise2(),
                )),
            child: Text('Ex2'),
          )
        ],
      ),
    );
  }
}
