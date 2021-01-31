import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/cupertino.dart';

class Exercise1 extends StatefulWidget {
  @override
  _Exercise1State createState() => _Exercise1State();
}

class _Exercise1State extends State<Exercise1> {
  var temperatureC = TextEditingController();
  var temperatureF = TextEditingController();
  bool isConvertToF = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Exercise 1'),
        ),
        body: _buildBody());
  }

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    temperatureC.dispose();
    temperatureF.dispose();
    super.dispose();
  }

  Widget _buildBody() {
    return Center(
      child: Column(
        children: [
          Text(
            'Convert temperature from F and C',
            style: TextStyle(
              fontWeight: FontWeight.bold,
            ),
          ),
          _input(true),
          _input(false),
        ],
      ),
    );
  }

  Widget _input(isConvertToF) {
    return Container(
      width: 200,
      child: TextField(
        keyboardType: TextInputType.number,
        decoration: InputDecoration(
          hintText: 'Please enter ' + (isConvertToF ? 'C' : 'F'),
          labelText: (isConvertToF ? 'C' : 'F') + ' Temperature',
        ),
        onChanged: (value) {
          if (value.isEmpty) {
            temperatureC.text = '';
            temperatureF.text = '';
          } else
            isConvertToF
                ? temperatureF.text =
                    (double.parse(temperatureC.text) * 1.8 + 32)
                        .toStringAsFixed(2)
                : temperatureC.text =
                    ((double.parse(temperatureF.text) - 32) / 1.8)
                        .toStringAsFixed(2);
        },
        controller: isConvertToF ? temperatureC : temperatureF,
      ),
    );
  }
}
